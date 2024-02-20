# frozen_string_literal: true

def generate_next_moves(route)
  # Possible ways a Knight can move in chess relative
  # to the current position.
  next_moves_offset = [[1, -2], [1, 2], [2, -1], [2, 1],
                       [-1, -2], [-1, 2], [-2, -1], [-2, 1]]
  new_routes = []

  next_moves_offset.each do |offset|
    next_move = [route.last[0] + offset[0], route.last[1] + offset[1]]

    next unless valid_position?(next_move)

    # Knight cannot visit a square on the board more than once
    next if route.include?(next_move)

    new_routes.push(route.clone.push(next_move))
  end

  new_routes
end

# Converts an input string that contains a position
# in chess using chess notation to an array of 2
# integers.
#
# Examples:
#
#   convert_from_notation('A1') => [0, 0]
#   convert_from_notation('A8') => [7, 0]
#   convert_from_notation('H1') => [0, 7]
#   convert_from_notation('E2') => [1, 4]
def convert_from_notation(position_notation)
  return nil unless /^[A-H][1-8]$/.match(position_notation)

  column, row = position_notation.split('')

  [row.to_i - 1, column.ord - 'A'.ord]
end

# Converts an array of 2 integers that contains
# a position in chess to chess notation.
#
# Examples:
#
#   convert_to_notation([0,0]) => 'A1'
#   convert_to_notation([7,0]) => 'A8'
#   convert_to_notation([0,7]) => 'H1'
#   convert_to_notation([1,4]) => 'E2'
def convert_to_notation(position)
  return nil unless valid_position?(position)

  row = position.first
  column = position.last

  "#{(column + 'A'.ord).chr}#{row + 1}"
end

def valid_position?(position)
  return false unless position in [Integer, Integer]

  row = position.first
  column = position.last

  row.between?(0, 7) && column.between?(0, 7)
end

def user_prompt
  instructions

  start_end = ''

  loop do
    start_end = gets.chomp.strip.upcase
    break start_end if /^[A-H][1-8]\W*,\W*[A-H][1-8]$/.match(start_end)

    puts "\n'#{start_end}' is not valid, try again.\n\n"
    puts 'Enter something that looks like: [A-H][1-8],[A-H][1-8]'
    puts "For example: E4,E5\n\n"
  end

  start_end.split(/\W*,\W*/)
end

def instructions
  puts "\nWelcome to the Chess Knight shortest path calculator.\n\n"
  puts 'Enter the start and end location of the knight.'
  puts 'Use chess notation and separate the start and end'
  puts "with a comma.  For example:\n\n"
  puts "  C1,D3\n\n"
  puts "The input is not case sensitive, so 'c1,d3' is also valid.\n\n"
  puts 'The shortest path from the start position to the'
  puts "end position will then be calculated.\n\n"
end
