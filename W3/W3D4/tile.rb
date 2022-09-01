
class Tile
    attr_accessor :bombed, :flagged, :revealed

    def initialize
        @bombed = false
        @flagged = false
        @revealed = false
    end

    def make_bomb
        @bombed = true
    end

end