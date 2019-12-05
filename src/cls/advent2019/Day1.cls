Class advent2019.Day1 Extends advent2019.Base
{

Parameter InputFile = "input1.txt";

// w ##class(eshvarov.Advent2019.Day1).Run()

// ClassMethod Run(fn = "input"_..#Day_".txt", verbose = 0) As %Integer

ClassMethod Run(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set totalweight = 0

    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set divided = line/3
        set dividedRounded = $SYSTEM.SQL.FLOOR(divided)
        set moduleweight = dividedRounded - 2

        set totalweight = totalweight + moduleweight

    }

    return totalweight
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    set totalweight = 0

    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set divided = line/3
        set dividedRounded = $SYSTEM.SQL.FLOOR(divided)
        set moduleweight = dividedRounded - 2
        set totalFuelWeight = 0
        set fuelWeight = ..calculateFuel(moduleweight)
        while fuelWeight > 0{
            set totalFuelWeight = totalFuelWeight + fuelWeight
            set fuelWeight = ..calculateFuel(fuelWeight)
        }
        set totalweight = totalweight + moduleweight + totalFuelWeight

    }

    return totalweight
}

ClassMethod calculateFuel(incomingFuel As %Integer) As %Integer
{
    set divided = incomingFuel/3
    set dividedRounded = $SYSTEM.SQL.FLOOR(divided)
    set fuelWeight = dividedRounded - 2
    return fuelWeight
}

}
