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
	wordsArr = params[:search][:words]

	# Place words into search object
	@search.words = wordsArr

	# Generate search based on wordsArr
	
	# Create the blank 20x20 array
	wordSearchArray = Array.new(20) {Array.new(20, "-")}
	wordSearchKey = Array.new(20) {Array.new(20, "-")}
	# Fill the array with random capital letters
	wordSearchArray.each_index do |row|
		wordSearchArray[row].each_index do |col|
			wordSearchArray[row][col] = (65 + rand(26)).chr
		end
	end

	# Keep track of which lines we have already put a word on
	linesUsed = Array.new()

	wordsArr.each do |word|
		word = word.upcase
		vertPos = rand(20)

		# Make sure we haven't put a word on this line yet
		while linesUsed.include?(vertPos)
			vertPos = rand(20)
		end
		# Choose a starting point in the row
		horizRand = rand(21 - word.length)

		# Place characters into the wordSearchArray
		if flipRand == 0
			for place in (0..(word.length-1))
				horizPos = horizRand + place
				wordSearchArray[vertPos][horizPos] = word[place]
				wordSearchKey[vertPos][horizPos] = word[place]
			end
		else
			for place in (0..(word.length-1))
				horizPos = horizRand + place
				wordSearchArray[vertPos][horizPos] = word[word.length - place - 1]
				wordSearchKey[vertPos][horizPos] = word[word.length - place - 1]
			end
		end
	end
	@search.key = wordSearchKey
	@search.word_search = wordSearchArray
	
	# Output the wordSearchArray filled with the user's words
	puts "Word Search"
	wordSearchArray.each do |arg|
		puts arg.each{|line| line}.join(" ")
	end

	puts "Word Search KEY"
	wordSearchKey.each do |arg|
		puts arg.each{|line| line}.join(" ")
	end

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

  def key
    # Get the key object from database based on the id
    @search = Search.find(params[:id])
    end


    def destroy
      @search = Search.find(params[:id])
      @search.destroy
    redirect_to searches_path
  end

end
