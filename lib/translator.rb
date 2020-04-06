# require modules here
require 'yaml'
require 'pry'

def load_library(yaml)
 emoticons = YAML.load_file(yaml) 
 output = {}
 emoticons.each do |name, emoticon|
    english = emoticon[0]
    japanese = emoticon[1]
    output[name] = {}
    output[name] = {:english =>english, :japanese => japanese}
 #binding.pry
  end
 output
 end

def get_english_meaning(yaml, emoji)
  emoticons = load_library(yaml)
  #binding.pry
  result = nil
  emoticons.each do |key, value|
    #binding.pry
    if emoticons[key].values.include?(emoji)
      result = key
      break
    else
      result =  "Sorry, that emoticon was not found"
    end
  end
  result
end

def get_japanese_emoticon(yaml, emoji)
  emoticons = load_library(yaml)
  result = nil
  emoticons.each do |key, value|
    if emoticons[key].values.include?(emoji)
      result = value[:japanese]
      break
    else
      result = "Sorry, that emoticon was not found"
    end
  end
  result
end