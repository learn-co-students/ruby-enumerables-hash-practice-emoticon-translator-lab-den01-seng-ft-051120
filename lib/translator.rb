require "yaml"
require "pry"

def load_library(file_path)
  emoticons_file = YAML.load_file(file_path)
  new_emo_hash = {}
  emoticons_file.each do |key, value|
    if new_emo_hash[key] == nil 
      new_emo_hash[key] = {}
      new_emo_hash[key][:english] = value [0]
      new_emo_hash[key][:japanese] = value[1]   
    end
  end
  new_emo_hash
end


def get_japanese_emoticon (file_path, emoticon)
  library = load_library(file_path)


end

def get_english_meaning (file_path, emoticon)
  library = load_library(file_path)
  library.find do |key, value|
  if emoticon == library[key][:japanese]
   p library[key]
  end
  end
end




