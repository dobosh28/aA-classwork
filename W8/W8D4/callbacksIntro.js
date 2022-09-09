class Clock {
    constructor() {
        // 1. Create a Date object.
        const date = new Date()

        // 2. Store the hours, minutes, and seconds.
        this.hour = date.getHours()
        this.minute = date.getMinutes()
        this.second = date.getSeconds()
        
        // 3. Call printTime.
        this.printTime() 

        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000)
        //this is the instance (2nd this is by itself, so passes in the instance attributes)
    } // this._tick.bind(this) returns a function where "this" is corrected
    // setInterval invokes the function

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        console.log(`${this.hour}:${this.minute}:${this.second}`)
    }

    _tick() {
        // 1. Increment the time by one second.
        this.second ++
        if (this.second === 60) {
            this.second = 0;
            this.minute ++;
        }
        if (this.minute === 60) {
            this.minute = 0;
            this.hour ++;
        }
        if (this.hour === 24) {
            this.hour = 0
            this.minute = 0;
            this.second = 0;
        }
        // 2. Call printTime. 
        this.printTime()  
    }

    
}

// const clock = new Clock();

// const date = new Date()
// console.log(date)

// console.log(date.getHours())
// console.log(date.getMinutes())
// console.log(date.getSeconds())


