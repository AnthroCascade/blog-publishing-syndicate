#!/usr/bin/env ruby
# Voice-guardian program: the deterministic layer — kill-list flags, monotone paragraphs, signpost candidates.

require_relative '../talents/kill_list_scan'

RHYTHM_THRESHOLD = 0.18                                   # author corpus 5th-percentile sentence-length CV
ANNOUNCE  = /\A\s*[A-Z][^.?!:]{2,40}:\s/
STRUCTURE = /\b(this section|as we.?ll see|in what follows|layer|axis|level)\b/i
VERDICT   = /\bthis is (fundamental|systemic|essential|crucial)\b/i
SAMENESS  = /\bthe same \w+/i

module VoiceGuardian
  module_function

  def monotone_paragraphs(text) =
    KillList.paragraphs(text).each_with_index
            .map { |para, i| { para: i + 1, lengths: sentence_lengths(para) } }
            .select { _1[:lengths].length >= 3 }
            .map { _1.merge(cv: dispersion(_1[:lengths]).round(3)) }
            .select { _1[:cv] < RHYTHM_THRESHOLD }

  def signpost_flags(text) =
    KillList.paragraphs(text).each_with_index.flat_map { |para, i| paragraph_signposts(sentences(para), i + 1) }

  def paragraph_signposts(sents, para_no) =
    announce(sents.first, para_no) + micdrop(sents, para_no)

  def announce(first, para_no) =
    (first =~ ANNOUNCE || first =~ STRUCTURE) ? [{ para: para_no, role: 'first-announce', quote: first }] : []

  def micdrop(sents, para_no) =
    sents.length > 1 && (sents.last =~ VERDICT || sents.last =~ SAMENESS) ? [{ para: para_no, role: 'last-micdrop', quote: sents.last }] : []

  def dispersion(lengths) =
    (mean = lengths.sum.to_f / lengths.length).zero? ? 0.0 : Math.sqrt(lengths.sum { (_1 - mean)**2 } / lengths.length) / mean

  def sentence_lengths(para) = sentences(para).map { _1.split(/\s+/).length }.select { _1 >= 2 }

  def sentences(para) = para.split(/(?<=[.!?])\s+/).map(&:strip).reject(&:empty?)
end

if __FILE__ == $PROGRAM_NAME
  text = File.read(ARGV[0])
  puts '== kill-list =='
  KillList.flags(text).each { puts "P#{_1[:para]}\t#{_1[:status]}\t#{_1[:id]}\t\"#{_1[:quote]}\"" }
  puts "\n== rhythm (CV < #{RHYTHM_THRESHOLD}) =="
  VoiceGuardian.monotone_paragraphs(text).each { puts "P#{_1[:para]}\tMONOTONE\tCV=#{_1[:cv]}" }
  puts "\n== signpost / mic-drop (candidate -> judgement) =="
  VoiceGuardian.signpost_flags(text).each { puts "P#{_1[:para]}\t#{_1[:role]}\t\"#{_1[:quote]}\"" }
end
