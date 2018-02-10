class Search < ApplicationRecord
	serialize :words, Array
	serialize :word_search, Array
	serialize :key, Array

	validates :words, presence: true
end
