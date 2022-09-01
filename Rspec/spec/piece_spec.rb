require "piece"

describe Piece do

    subject(:piece) { Piece.new(:white, [0, 0], board) }
    let(:board) { double("Board", valid_pos?: true) }

    describe '#initialize' do

        context 'with valid arguments' do
            it "instantiates a piece correctly" do
                #piece = Piece.new(:white, [0, 0])
                expect(piece.color).to eq(:white)
                expect(piece.pos).to eq([0, 0])
            end
        end
        
        context 'with invalid arguments' do
            it "raises an error when provided with an invalid color" do
                expect {Piece.new(:blue, [0, 0], board)}.to raise_error("Invalid color")
            end

            it "raises an error when provided with invalid position" do
                allow(board).to receive(:valid_pos?).and_return(false)
                expect {Piece.new(:white, [0, 8], board)}.to raise_error("Invalid position")
            end

            it "calls on the valid_pos? method on the board instance" do
                expect(board).to receive(:valid_pos?)
                Piece.new(:white, [0, 0], board)
            end
        end
    end

    describe '#pos=' do
        it "correctly reassigns a piece's position" do
            #piece = Piece.new(:white, [0, 0])
            piece.pos = [1, 2]
            expect(piece.pos).to eq([1, 2])
        end
    end

    describe '#symbol' do
        it "raises an error" do 
            expect {piece.symbol}.to raise_error(NotImplementedError)
        end
    end

    describe '#to_s' do
        it "returns a formatted string" do
            allow(piece).to receive(:symbol).and_return('♖')
            expect(piece.to_s).to eq(' ♖ ')
        end
    end

    describe '#empty?' do
        it "returns false" do
            expect(piece.empty?).to eq(false)
        end
    end
end

