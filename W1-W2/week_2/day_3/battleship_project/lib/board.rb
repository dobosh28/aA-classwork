class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def size
        @size
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship'
            true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        total_ships = @size * 0.25

        while self.num_ships < total_ships 
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            pos = [rand_row, rand_col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S 
                    :N 
                else
                    ele
                end
            end
        end
    end
    
    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
