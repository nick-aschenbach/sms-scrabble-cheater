require 'set'
require 'sinatra'

class Permutator
  def self.init
    @@words = Set.new
    File.open('dictionary.txt', 'r') do |f|
      f.each_line { |word| @@words.add(word.chomp) }
    end
  end

  def self.find_words(letters)
    letter_array = []
    letters.each_char { |letter| letter_array << letter }
    words_found = Set.new

    (1..letter_array.size).each do |length|
      letter_array.permutation(length).each do |perm|
        candidate = perm.join
        words_found.add(candidate) if @@words.include?(candidate)
      end
    end
    words_found.to_a.join("\n")
  end
end

configure do
  Permutator::init
end

get '/' do
  begin
    content_type 'text/xml'
    letters = params[:Body][0..7].downcase
    results = Permutator::find_words(letters)
    xml("Permutations for #{letters}:\n#{results}")
  rescue Exception => e
    xml('Could not process input')
  end
end

def xml(message)
  <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Message>#{message}</Message>
</Response>
  XML
end
