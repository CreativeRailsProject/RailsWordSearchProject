class WordSearchGen

  inputWords = ["apple", "banana", "pear", "orange"]
  /create the blank 20x20 array/
  wordSearchArray = Array.new(20) {Array.new(20)}
  /fill the array with random capital letters/
  wordSearchArray.each_index do |row|
    wordSearchArray[row].each_index do |col|
	  wordSearchArray[row][col] = (65 + rand(26)).chr
	end
  end

  /keep track of which lines we have already put a word on/
  linesUsed = Array.new()

  inputWords.each do |word|
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
	end
  end

  /output the wordSearchArray filled with the user's words/
  wordSearchArray.each do |arg|
    puts arg.each{|line| line}.join(" ")
  end
end