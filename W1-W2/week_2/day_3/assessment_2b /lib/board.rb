class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(n)
        Array.new(n) { Array.new(0) }
    end

    def initialize(num_stacks, max_height)
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
        if num_stacks < 4 || @max_height < 4
            raise 'rows and cols must be >= 4'
        end
    end

    def max_height
        @max_height
    end

    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.any? { |stack| stack.all?(token) && stack.length == @max_height }
    end

    def horizontal_winner?(token)
        (0..@max_height).each do |i|
            return true if @stacks.all? { |stack| stack[i] == token }
        end
        return false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

end
