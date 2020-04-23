# require modules here
require 'yaml'

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticon_hash = {}
  # go through each emoticon to create hash with english & japanese meanings
  emoticons.each_pair do |key, value|
    emoticon_hash[key] = {english: value[0], japanese: value[1]}
  end
  emoticon_hash
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  hash.each_pair do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  hash.each_pair do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end
