class WordSearchGen

  inputWords = ["apple", "banana", "pear", "orange"]

  wordSearchArray = Array.new(20) {Array.new(20, "/")}

  wordSearchArray.each_index do |repl|
    wordSearchArray[repl].each_index do |lett|
	  wordSearchArray[repl][lett] = (65 + rand(26)).chr
	end
  end
  /keep track of which lines we have already put a word on/
  linesUsed = Array.new()

  inputWords.each do |word|
    word = word.upcase
    vertPos = rand(20)
	/Make sure we haven't put a word on this line yet/
    while linesUsed.include?(vertPos)
	  vertPos = rand(20)
	end
	/choose a starting point in the row/
	horizRand = rand(20 - word.length-1)
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