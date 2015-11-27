require 'suggestion_box/engine'
require 'slim-rails'
require 'acts_as_commentable'
require 'simple_form'
require 'jquery-rails'
require 'devise'
require 'acts_as_votable'
require 'cancancan'

module SuggestionBox
  mattr_accessor :author_class
  mattr_accessor :admin_check
  mattr_accessor :admin_value
end
