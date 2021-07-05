# require modules here
require "yaml"
def load_library(file)
  new_hash = {}
  load_emoticons = YAML.load_file(file)
  load_emoticons.each do |key, value|
    if new_hash[key] == nil
      new_hash[key] = {}
    end
    if new_hash[key][:english] == nil || new_hash[name][:japanese] == nil
      new_hash[key][:english] = []
      new_hash[key][:japanese] = []
    end 
    new_hash[key][:english] = value.first
    new_hash[key][:japanese] = value.last
  end
  new_hash
end

def get_japanese_emoticon(file, western_emoticon)
  translated_emoticon = "Sorry, that emoticon was not found"
  library = load_library(file)
  library.each do |word, language|
    language.each do |key, emoticon|
      if western_emoticon == emoticon
        translated_emoticon = library[word][:japanese]
      end
    end
  end
  translated_emoticon
end

def get_english_meaning(file, eastern_emoticon)
  translated_word = "Sorry, that emoticon was not found"
  library = load_library(file)
  library.each do |word, language|
    language.each do |key, emoticon|
      if eastern_emoticon == emoticon
        translated_word = word.to_s
      end
    end
  end
  translated_word
end