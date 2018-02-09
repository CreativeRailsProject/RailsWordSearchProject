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

	# Generate search based on wordsArr
	# and place into @search.word_search. (@search.word_search = 20x20arr)
	
	/create the blank 20x20 array/
	wordSearchArray = Array.new(20) {Array.new(20, "-")}
	wordSearchKey = Array.new(wordSearchArray)
	/fill the array with random capital letters/
	wordSearchArray.each_index do |row|
		wordSearchArray[row].each_index do |col|
			wordSearchArray[row][col] = (65 + rand(26)).chr
		end
	end

	/keep track of which lines we have already put a word on/
	linesUsed = Array.new()

	wordsArr.each do |word|
		word = word.upcase
		vertPos = rand(20)

		/make sure we haven't put a word on this line yet/
		while linesUsed.include?(vertPos)
			vertPos = rand(20)
		end
		/choose a starting point in the row/
		horizRand = rand(21 - word.length)

		/place characters into the wordSearchArray/
		for place in (0..(word.length-1))
			horizPos = horizRand + place
			wordSearchArray[vertPos][horizPos] = word[place]
			wordSearchKey[vertPos][horizPos] = word[place]
		end
	end
	/@search.word_search_key = wordSearchKey/
	@search.word_search = wordSearchArray

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
