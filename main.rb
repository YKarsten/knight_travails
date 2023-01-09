# pseudocode
# 8x8 chess borad with [x,y] integer/string coordiantes
# knight class
# 8 possible knight moves
# x +/- 2 y +/- 1
# y +/- 2 x +/- 1
# check board boundary

# At max 7 steps/ turns to reach any square
# This could be useful to prevent infinite loops.
# more elegant idea would be to keep track of squares that have been visited before

# Information in classes
# board class
#   coordinates
# knight class
#   valid moves
#   Treat all possible moves the knight could make as children in a tree
#   Find a valid search algorithm to get from one position to another
#     possibility of inifinate loop
# game class?

# Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. 
# Output what that full path looks like, e.g.:

# Build a tree from the starting position to all possible positions for the knight
# root = starting position
# children node lvl 1 all position reachable from the starting
# go on until level 6 has been reached or all squares have been visited once.

# Use an algorithm to find the shortest path. (depth or height from BST project?)

require_relative './lib/board'

# make new Board instance
b = Board.new

loc = [1, 2]

# set data for location
b[loc] = 'K'
b[[0, 0]] = 'N'

# get data for location
p b[[0, 0]]

p b.grid
