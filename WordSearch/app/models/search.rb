class Search < ApplicationRecord
	serialize :words, Array
	serialize :word_search, Array

	validates :words, presence: true
end
