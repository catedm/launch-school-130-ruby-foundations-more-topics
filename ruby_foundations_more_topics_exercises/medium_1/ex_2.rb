class TextAnalyzer
  def process
    file = File.open('ex_2_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").count} lines" }
analyzer.process { |file| puts "#{file.split(' ').size} words" }
