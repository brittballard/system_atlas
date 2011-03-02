require 'factory_girl'
Factory.definition_file_paths = [File.join(Rails.root, 'spec', 'factories')]
Factory.find_definitions
require 'factory_girl/step_definitions'
require 'ruby-debug'
