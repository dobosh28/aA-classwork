class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size) }
    end

    def size
        @size
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def complete_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def complete_diag?(mark)
        lr = (0...@grid.length).all? do |i|
            position = [i, i]
            self[position] == mark
        end

        rl = (0...@grid.length).all? do |i|
            r = i 
            c = @grid.length - 1 - i 
            position = [r, c]
            self[position] == mark
        end

        lr || rl
    end

    def winner?(mark)
        self.complete_col?(mark) || self.complete_row?(mark) || self.complete_diag?(mark)
    end
end
