Class advent2019.Day2 Extends advent2019.Base
{

Parameter InputFile = "input1.txt";

ClassMethod Run(verbose = 0) As %Integer
{
   set stream=..GetInput(..#InputFile)

    w "Hit Func",1
    set totalweight = 0

    while 'stream.AtEnd{
        set line = stream.ReadLine()
        set divided = line/3
        set dividedRounded = $SYSTEM.SQL.FLOOR(divided)
        set moduleweight = dividedRounded - 2
        w "Module Weight: "_moduleweight,!
        set totalFuelWeight = 0
        set fuelWeight = ..calculateFuel(moduleweight)
        w "Extra Fuel Weight:"_fuelWeight,!
        while fuelWeight > 0{
            set totalFuelWeight = totalFuelWeight + fuelWeight
            set fuelWeight = ..calculateFuel(fuelWeight)
            w "Extra Fuel Weight:"_fuelWeight,!
        }
        w "Total Fuel Weight:"_totalFuelWeight,!
        set totalweight = totalweight + moduleweight + totalFuelWeight

    }

    return totalweight
}

// Hard Solution that didn't work

ClassMethod Run2(verbose = 0) As %Integer
{
    set day1Fuel = ##class(advent2019.Day1).Run()
    w "Day 1 Fuel "_day1Fuel,!

    set fuelToCalculate = 1969 //day1Fuel
    set totalFuelWeight = 0

    set left = ..calculateFuel(fuelToCalculate)
    w left,!
    while left > 0{
        set totalFuelWeight = totalFuelWeight + left
        set left = ..calculateFuel(left)
        w left,!
    }

    set totalWeight = day1Fuel + totalFuelWeight

    w "Day 1 Fuel: "_day1Fuel,!
    w "Extra Fuel Needed: "_totalFuelWeight,!
    w "Total: "_totalWeight,!

    return totalWeight
}

ClassMethod calculateFuel(incomingFuel As %Integer) As %Integer
{
    set divided = incomingFuel/3
    set dividedRounded = $SYSTEM.SQL.FLOOR(divided)
    set fuelWeight = dividedRounded - 2
    return fuelWeight
}

}
