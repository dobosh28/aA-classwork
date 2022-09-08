Array.prototype.uniq = function() {
    let unique = [];
    for (let i = 0; i < this.length; i++ ) {
        let num = this[i]
        if (!unique.includes(num)) {
            unique.push(num)
        }
    }
    return unique
}

console.log([1,2,2,3,3,3].uniq())

Array.prototype.twoSum = function() {
    let pairs = []
    for (let i = 0; i < this.length; i++ ) {
        for (let j = i + 1; j < this.length; j++ ) {
            if (this[i] + this[j] === 0) {
                pairs.push([i, j])
            }
        }
    }
    return pairs
}

console.log([1,3,-1,5,10,-5].twoSum())

Array.prototype.transpose = function() {
    let transposed = Array.from({length: this[0].length}, function() { 
        return Array.from({length: 0})
    })
    
    for (let i = 0; i < this.length; i++) {
        row = this[i];

        for (let j = 0; j < row.length; j++) {
            ele = row[j];
            transposed[j].push(ele);
        }
    }

    return transposed;
}
console.log([[1,1,1],[2,2,2],[3,3,3]].transpose())