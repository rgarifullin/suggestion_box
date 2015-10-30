require 'suggestion_box/engine'
require 'slim-rails'
require 'acts_as_commentable'
require 'simple_form'
require 'jquery-rails'
require 'byebug'
require 'devise'
require 'acts_as_votable'
require 'font-awesome-rails'

module SuggestionBox
  mattr_accessor :author_class
end
