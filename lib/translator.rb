# require modules here
require "yaml"

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)

  emoticons.reduce({}) do |emoticons, (name, symbols)|
    emoticons[name] ||= {}
    emoticons[name][:english] = symbols[0]
    emoticons[name][:japanese] = symbols[1]
    emoticons
  end
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticon_hash = load_library(file_path)
  emoticon_hash.each do |name, symbols_hash|
    symbols_hash.each do |language, symbol|
      if symbol == english_emoticon
        return emoticon_hash[name][:japanese]
      end
    end
  end
  p "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  emoticon_hash.each do |name, symbols_hash|
    symbols_hash.each do |language, symbol|
      if symbol == emoticon
        return name
      end
    end
  end
  p "Sorry, that emoticon was not found"
end
