require 'yaml'
require 'pry'

def load_library(file)
  emoticon_hash = {}
  file = YAML.load_file('./lib/emoticons.yml')
  
  new_file = Hash[file.keys.map {|x| [x, Hash.new]}]
  
  
  new_file.each_value do |emoticons|
    emoticons[:english] = nil
    emoticons[:japanese] = nil
  end
  
  file.each do |k, v|
    new_file[k][:english] = v[0]
    new_file[k][:japanese] = v[1]
  end  

  new_file
end

def get_japanese_emoticon(file, emote)
  search = load_library(file)
  sorry_message = "Sorry, that emoticon was not found"
  
  search.each do |key, value|
    #binding.pry
    value.each do |k, v|
      #binding.pry
      if emote == v
        return value[:japanese]
      end
    end
  end
  #binding.pry
  
  sorry_message
  
end

def get_english_meaning(file, emote)
  # code goes here
  search = load_library(file)
  sorry_message = "Sorry, that emoticon was not found"
  
  search.each do |key, value|
    #binding.pry
    value.each do |k, v|
      #binding.pry
      if emote == v
        return key
      end
    end
  end
  #binding.pry
  
  sorry_message
  
  #load_library.new_file(emote)
  
end


