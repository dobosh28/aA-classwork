class Piece
    attr_reader :color
    attr_accessor :pos
    
    COLORS = [:white, :black]

    def initialize(color, pos, board)
        raise 'Invalid color' if !COLORS.include?(color)
        raise 'Invalid position' if !board.valid_pos?(pos)

        @color = color
        @pos = pos
    end 

    def symbol
        raise NotImplementedError
    end

    def to_s
        " #{symbol} "
    end

    def empty?
        false
    end
end

# class Rook < Piece
#     def symbol
        
#     end
# end

# rook = Rook.new
# puts rook