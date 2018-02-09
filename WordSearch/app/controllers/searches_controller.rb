class SearchesController < ApplicationController
  def index
	 # Get all searches
	 @searches = Search.all
  end

  def new
	# Create search object
	@search = Search.new
  end

  def create
	# Create search object
	@search = Search.new

	# Get words from input and place in array
	words = params[:search][:words][0].upcase
	wordsArr = words.split(/\s*,\s*/)
	puts wordsArr

	# Place words into search object
	@search.words = wordsArr

	# TODO: Generate search based on wordsArr
	#       and place into @search.word_search. (@search.word_search = 20x20arr)

	# try to save word search to db.
	if @search.save
		# redirect to show page
		redirect_to action: 'show', id: @search.id
	else
		render 'new'
	end
  end

  def show
	# Get the search object from database based on the id
	@search = Search.find(params[:id])
  end

end
