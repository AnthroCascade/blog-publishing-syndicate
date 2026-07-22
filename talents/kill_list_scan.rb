#!/usr/bin/env ruby
# Kill-list program: plain terms in, flags out. The author edits kill-list.terms; the patterns live here.

module KillList
  TERMS_FILE = File.join(__dir__, 'kill-list.terms')
  AMBIGUOUS  = ['move', 'name', 'the same']        # the instruction adjudicates these (kill-list.md)
  STRUCTURAL = {
    'contrastive-negation' => /did(?: not|n.?t) need .+?\.\s+it needed/i,
    'contrastive-hedging'  => /not because .+?,? but because/i
  }

  module_function

  def flags(text, source = terms) =
    paragraphs(text).each_with_index.flat_map do |para, i|       
      paragraph_flags(normalised(para), i + 1, source)
    end

  def paragraph_flags(para, para_no, source) =
    word_flags(para, source[:words], para_no) +
    phrase_flags(para, source[:phrases], para_no) +
    structural_flags(para, para_no)

  def word_flags(para, words, para_no) =
    words.flat_map do |word|       
      para.scan(word_pattern(word)).map do
        flag(word, 'word', para_no, _1)
      end             
    end

  def phrase_flags(para, phrases, para_no) =
    phrases.flat_map do |phrase| 
      para.scan(/#{Regexp.escape(normalised(phrase))}/).map do      
        flag(phrase, 'phrase', para_no, phrase)
      end
    end

  def structural_flags(para, para_no) =
    STRUCTURAL.flat_map do |id, pattern|      
      para.scan(pattern).map do
        flag(id, 'structural', para_no, _1)
      end
    end

  def flag(id, kind, para_no, quote) = {
    para: para_no, 
    status: status(id), 
    id:, 
    kind:, 
    quote: quote.to_s.strip
  }

  def status(id) = AMBIGUOUS.include?(id) ? 'NEEDS-JUDGEMENT' : 'VIOLATION'
  

  def paragraphs(text) = text.split(/\n\s*\n/).reject { _1.strip.empty? }

  def normalised(text) = text.downcase.gsub(/[‘’ʼ]/, "'").gsub(/[“”]/, '"')

  def word_pattern(word) =
    /\b(?:#{inflections(word).map { Regexp.escape(_1) }.join('|')})\b/i

  def inflections(word) = [
    word, "#{word}s", "#{word}ed", "#{word}ing", "#{word}ly",
      *(word.end_with?('e') ? ["#{word[0..-2]}ed", "#{word[0..-2]}ing"] : [])
    ]

  def terms(file = TERMS_FILE)
    mode = nil
    lines(file).each_with_object(words: [], phrases: []) do |line, acc|
      line =~ /^\[(\w+)\]$/ ? (mode = $1.to_sym) : (acc[mode] << line)
    end
  end

  def lines(file) =
    File.readlines(file, chomp: true)
      .map { _1.sub(/\s+#.*$/, '').strip }
      .reject { _1.empty? || _1.start_with?('#') }
end

if __FILE__ == $PROGRAM_NAME
  KillList.flags(File.read(ARGV[0]))
    .each do
      puts "P#{_1[:para]}\t#{_1[:status]}\t#{_1[:id]}\t\"#{_1[:quote]}\""
    end
end
