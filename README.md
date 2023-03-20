# Chess

This is the final project of the Ruby chapter in The Odin Project’s Ruby Curriculum. Find it at [http://www.theodinproject.com](https://www.theodinproject.com/lessons/ruby-ruby-final-project)

## Description

This is a simple game of chess that is playable in the command window. It also holds the ability to tell you a knights shortest path from point A to point B on the chessboard - cool, huh? Built it myself ;)

## Getting started

To start a chess match: open the console, cd into the directory and 
```
$ruby main.rb
```
The pieces can be accessed by calling their index on the 2D board [x,y].
All Position are zero indexed i.e. 
* white's rooks are at [0, 0] & [0, 7]. 
* Black's knights are at [7, 1] & [7, 6] etc.


## What I learned & applied in this project

### How to tackle a bigger project.

* Make a plan of action before starting to code.
* Break down bigger ideas into small chunks.

### How to use rspec tests to actually speed up development

* Before this project, tests seemed to slow down my progress. In this project I embraced the idea of test driven development TDD.

### To branch out classes and methods to subclasses

* During development methods started getting too big and I had to create subdirectories and multiple files. In the beginning this was confusing, because I couldn't find the piece of code I was lookking for. But it also taught me to properly name files and directories.

### Using a factory method
```
#self.start_chess
```
Was very useful to test piece functionality, as it populates the board in one line.

### Singleton's NullPiece

Using a NullPiece instance for empty spaces on the board instead of checking for Nil? prevents some difficult to spot bugs.

### Rendering pieces 

* Overriding the #to_s (puts Piece) method for individual pieces with specific unicode characters makes the dull commandline game prettier.

## Future ideas

* Add numbers to the edge of the board to make it easier to see which coordinates the pieces on the board have.
* Add castle and en passant and promotion.
