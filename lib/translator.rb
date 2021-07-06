# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  lib = YAML.load_file(path)
  res = {}
  i = 0
  # adjust hash so you have translations
  lib.each do |name, values| 
    res[name] = {}
    res[name][:english] = values[0]
    res[name][:japanese] = values[1]
  end
  res
end

def get_japanese_emoticon(path, query)
  # code goes here
  h = load_library(path)
  h.each do |names, language|
    if language[:english] == query
      return language[:japanese]
    end
end
return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, query)
  # code goes here 
  h = load_library(path)
  h.each do |names, language|
    #language.detect { |p| p == query }
    if language[:japanese] == query
      return names
    end
  end
  return "Sorry, that emoticon was not found"
end