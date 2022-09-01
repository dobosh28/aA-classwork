require_relative "tile.rb"

class Board
    def initialize
        @grid = Array.new(9) { Array.new(9, Tile.new) }

    end

    def populate
        while num_bombs < 10
            @grid[rand(0..8)] [rand(0..8)].make_bomb
            # print_board
        end
    end

    def num_bombs
        @grid.flatten.count { |x| x.bombed == true }
    end

    def print_board
        @grid.each do |row|
            puts row.map { |tile| tile.bombed }.join(" ")
        end
    end
    
end

board = Board.new
board.populate
# board.num_bombs
board.print_board
