require 'yaml'
require 'pry'

def load_library(filepath)
  emoticons = YAML.load_file(filepath)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  emoticons.each do |meaning, collection|
    new_hash["get_meaning"][collection[-1]] = {}
    new_hash["get_meaning"][collection[-1]] = meaning
    new_hash["get_emoticon"][collection[0]] = {}
    new_hash["get_emoticon"][collection[0]] = collection[-1]
    end
return new_hash
end

def get_japanese_emoticon(filepath, english_emoticon)
  library = load_library(filepath)
  if library["get_emoticon"].include?(english_emoticon)
    return library["get_emoticon"][english_emoticon]
    else
    return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(filepath, japanese_emoticon)
  library = load_library(filepath)
  if library["get_meaning"].include?(japanese_emoticon)
    return library["get_meaning"][japanese_emoticon]
    else
    return "Sorry, that emoticon was not found"
    end
end