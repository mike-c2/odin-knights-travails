# Knights Travails

## Introduction

This is a text-based Chess Knight calculator for figuring out the shortest path from one square on the board to another. This was made as part of [The Odin Project](https://www.theodinproject.com). This project is written in Ruby.

The project details can be found at [Project: Knights Travails](https://www.theodinproject.com/lessons/ruby-knights-travails).

## How to Use

The program is started as follows:

`ruby knights_travails.rb`

The user will be prompted with the following:

```
Welcome to the Chess Knight shortest path calculator.

Enter the start and end location of the knight.
Use chess notation and separate the start and end
with a comma.  For example:

  C1,D3

The input is not case sensitive, so 'c1,d3' is also valid.

The shortest path from the start position to the
end position will then be calculated.

```

After entering the positions, i.e. `d8,d7`, the shortest path will be calculated and displayed as follows:

```
You made it in 3 moves! Here's your path:

Raw Path:
[7, 3]
[6, 1]
[4, 2]
[6, 3]

Chess Notation Path:
D8 -> B7 -> C5 -> D7
```

## Additional Information

The Chess Notation Path was added just to make the input and output more readable.

The actual algorithm processes each position as an array of two integers (as seen above in the raw path). Each route is an array of positions, for example:

`[[7, 3], [6, 1], [4, 2], [6, 3]]`

From a given position, new positions can be calculated by checking all possible valid moves. Then new copies of the route array are made for each possible valid move, with its new move pushed on. Each new route is then placed on the queue for further processing. This repeats until a route comes off of the queue that has it's last position be the same as the ending position.
