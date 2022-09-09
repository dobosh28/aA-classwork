const readline = require("readline")
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

function addNumbers(sum, numsLeft, completionCallback) {

    if (numsLeft > 0) {
        rl.question("Give me number ... ",
            (response) => {
                sum += parseInt(response);
                console.log(`sum is ${sum}`);

                addNumbers(sum, numsLeft-1, completionCallback)
            }
        )
        
    } else if (numsLeft === 0) {
        completionCallback(sum)
    }
}


addNumbers(0, 7, sum => console.log(`Total Sum: ${sum}`));