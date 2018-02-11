# RailsWordSearchProject

# Contributors

Collin Valleroy, Jamie Kunzelman, Luis Hernandez Cruz

# Project Summary

Using our project, users will be able to create a fun, easy, and unique word search. The word search will be filled with words specified by the user themselves, taking up to ten words that are less than 11 characters long. Once the user is satisfied with their selection of words, they can hit the 'Generate!' button to receive the fully generated word search in their browser. The word search will mix the words in with random letters, with all of the words arranged horizontally left-to-right. The user will also be able to see a word bank below the word search, complete with all of the words they originally input into the generator.

# Users

Any person looking to create a fun activity to share with others. This could be teachers making assignments for their students, 

friends creating a game to share with their friends, or a bored individual looking to entertain themselves.

# MVP Description

-   The user can input up to ten words that they want to be scrambled into the word search (max length 10 letters per word)

-   Generate a 20 x 20 letter word search that incorporates all of the user's words, initially all horizontally read left-to-right

-   Word search is stored as 20, 20 character arrays

-   Ability to display the generated word search in the web browser

-   Word Bank should appear below the generated word search, in the order that the user input them into the program

# Functionality

-   User begins on index page, which lists all current word searches in the database.

-   Users can create, view, and delete word searches from the index page

-   When creating a new word search, the user can enter up to 10 words, each less than 11 characters long

-   Once created, the user can view their newly generated word search, see the answers to the search, or go back to the word search index page

# Installation Steps

-   Step 1: Install Ruby on Rails

http://railsinstaller.org/en

-   Step 2: Clone repository. Cd into WordSearch directory

git clone https://github.com/CreativeRailsProject/RailsWordSearchProject.git
cd RailsWordSearchProject
cd WordSearch

-   Step 3: Create the searches database

rails db:migrate

-   Step 4: Start the server

rails server

-   Step 5: Open browser to website

localhost:3000

# Issues

-   Merge conflicts on Github - we had to do manual conflict resolution

-   Double render errors when checking the length of inputted words - decided to use redirect functions instead

-   Styling the `new` page - we had to look at a lot of stackoverflow questions for help.

-   Creating links between different pages and nested database items took some research to figure out

# References

-   https://stackoverflow.com/

-   https://www.ruby-forum.com/

-   https://www.railstutorial.org/book/

-   http://guides.rubyonrails.org/getting_started.html

-   http://guides.rubyonrails.org/routing.html

-   http://www.simplehtmlguide.com/cheatsheet.php