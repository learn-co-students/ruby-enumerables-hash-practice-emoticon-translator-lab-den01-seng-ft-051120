require 'yaml'
require 'pry' 

def load_library(file)
  hash = YAML.load_file(file)
  emoticons = hash.transform_values { |x| 
    x = { :english => x[0], :japanese => x[1] }
    }
end

def get_japanese_emoticon(file, e_emot)
  emoticons = load_library(file)
  emotion = emoticons.select { |(name, hash)|
    
    emoticons[name][:english] == e_emot
  }
  if emotion.empty?
    return "Sorry, that emoticon was not found"
  else
    return emotion.values[0][:japanese]
  end 
end


def get_english_meaning(file, j_emot)
  emoticons = load_library(file)
  emotion = emoticons.select { |(name, hash)|
    emoticons[name][:japanese] == j_emot
  }
  if emotion.empty?
    return "Sorry, that emoticon was not found"
  else 
    emotion.to_a[0][0]
  end 
end



