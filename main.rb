# pseudocode
# 8x8 chess borad with [x,y] integer/string coordiantes
# knight class
# 8 possible knight moves
# x +/- 2 y +/- 1
# y +/- 2 x +/- 1
# check board boundary

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