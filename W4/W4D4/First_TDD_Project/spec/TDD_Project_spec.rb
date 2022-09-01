require 'TDD_Project'

describe 'my_uniq' do
    let(:array_1) { [1, 2, 1, 3, 3] }

    it "should return unique elements in the order in which they first appeared" do
        expect(my_uniq(array_1)).to eq([1, 2, 3])
    end


    it "should not use the built-in Array#uniq or Array#uniq!" do
        expect(array_1).to_not receive(:uniq)
        expect(array_1).to_not receive(:uniq!)
    end

    #mutation
end

describe 'two_sum' do

    it "should return [] if there are no pairs of elements that sum up to zero" do
        expect(two_sum([4, 5, 6, 7])).to eq([])
    end

    it "should return positions of pairs of numbers that sum up to zero" do
        expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
    end

    it "should return pairs to be sorted by smaller index before bigger index" do
        expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
    end 

end

describe 'my_transpose' do  

    it "should transpose a 2D array where horizontal rows are converted to vertical columns" do
        arr = [
            [0, 1, 2], 
            [3, 4, 5],
            [6, 7, 8]
        ]

        expected_arr = [
            [0, 3, 6], 
            [1, 4, 7],
            [2, 5, 8]
        ]
        expect(my_transpose(arr)).to eq(expected_arr)
    end

    it "should not use the built-in Array#transpose" do
        arr = [
            [0, 1, 2], 
            [3, 4, 5]
        ]
        expect(arr).to_not receive(:transpose)
        my_transpose(arr)
    end
end