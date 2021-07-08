# require modules here
require 'pry'
require 'yaml'



def load_library(file_name)
  emot_file = YAML.load_file(file_name)

  # code goes here
  transilator ={"get_meaning" =>{}, "get_emoticon" => {}}
  emot_file.each do |meaning, emoticons|

    english = emoticons[0]

    japanese = emoticons[1]
    transilator["get_meaning"][japanese] =meaning
    transilator["get_emoticon"][english] =japanese

  end




  transilator

end

def get_japanese_emoticon(load_lib_file, emoticon)
  library = load_library(load_lib_file)

  jap_transilator = library['get_emoticon'][emoticon]
  if jap_transilator
    jap_transilator
  else
      "Sorry, that emoticon was not found"
    end

end

def get_english_meaning(l_lib_file, emoticons)
  eng_library_loader = load_library(l_lib_file)
  engl_transilator = eng_library_loader['get_meaning'][emoticons]
  if engl_transilator
    eng_library_loader['get_meaning'][emoticons]
  else
      "Sorry, that emoticon was not found"
    end

  # code goes here
end
