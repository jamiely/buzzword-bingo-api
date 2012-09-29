class WordLists
  def self.lists
    if @lists.nil?
      self.setup_lists
    end
    @lists
  end

  def self.setup_lists
    File.open('./word_lists.txt', 'r') do |fin|
      hash_def = fin.lines.map do |line|
        parts = line.strip.split('#')
        WordList.new parts[0], parts[1].split('|') unless parts.length != 2 || parts[0] == ""
      end.
      reject(&:nil?).
      map do | list |
        [list.name, list]
      end

      p hash_def.length

      @lists = Hash[ hash_def ]
    end
  end
end

class WordList
  attr_accessor :name, :words
  def initialize(name, words)
    @name = name
    @words = words
  end
  def to_json
    { name: @name, words: @words }.to_json
  end
end

