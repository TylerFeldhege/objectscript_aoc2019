Class advent2019.Day4 Extends advent2019.Base
{

Parameter InputFile = "input3.txt";

ClassMethod Run(verbose = 0) As %Integer
{
    w "Start: "_$ZDT($H),!
    set stream=..GetInput(..#InputFile)

    set wire1Input = stream.ReadLine()
    set wire2Input = stream.ReadLine()

    //set wire1Input = "R75,D30,R83,U83,L12,D49,R71,U7,L72"
    //set wire2Input = "U62,R66,U55,R34,D71,R55,D58,R83"

    //set wire1Input = "R8,U5,L5,D3"
    //set wire2Input = "U7,R6,D4,L4"

    //w "Wire 1: "_wire1Input,!
    //w "Wire 2: "_wire2Input,!

    set wire1List = ..DirectionsToPointList(wire1Input)
    set wire2List = ..DirectionsToPointList(wire2Input)
    //w $Listtostring(wire1List),!
    //w $Listtostring(wire2List),!

    set matchListCount = 0
    for index=0:1:$Listlength(wire1List){
        set currentWire1Position = $LISTGET(wire1List,index)
        if $LISTFIND(wire2List,currentWire1Position){
            set matchListCount = matchListCount+1
            set $LIST(matchList,matchListCount)=currentWire1Position
        }
    }

    w "Matchlist: "_matchList,!

    set smallestSize = 0
    set smallestPosition = 0

    set smallestCheckCount =0
    for index=0:1:$Listlength(matchList){
        set currentSmallestCheckPosition = $Listget(matchList,index)
        set currentSmallestX = $PIECE(currentSmallestCheckPosition,"|",1)
        set currentSmallestY = $PIECE(currentSmallestCheckPosition,"|",2)
        set currentSmallestSize = $ZABS(currentSmallestX) + $ZABS(currentSmallestY)

        if smallestSize = 0{
            set smallestSize = currentSmallestSize
            set smallestPosition = currentSmallestCheckPosition
        }

        if currentSmallestSize < smallestSize{
            set smallestSize = currentSmallestSize
            set smallestPosition = currentSmallestCheckPosition
        }

    }

    w $Listtostring(matchList),!
    w "End: "_$ZDT($H),!

    return smallestSize
}

ClassMethod DirectionsToPointList(directions As %String) As %ListOfObjects
{
    set directionCount = $LENGTH(directions,",")
    
    set currentX = 0
    set currentY = 0

    set listCount = 0
    for index=1:1:directionCount
    {
        set currentInstruction = $PIECE(directions,",",index)
        set currentDirection = $E(currentInstruction,1,1)
        set currentLength = $E(currentInstruction,2,$LENGTH(currentInstruction))

        set xModifier = 0
        set yModifier = 0

        if currentDirection = "U"{
            set yModifier = 1
        }
        if currentDirection = "D"{
            set yModifier = -1
        }

        if currentDirection = "R"{
            set xModifier = 1
        }
        if currentDirection = "L"{
            set xModifier = -1
        }

        for index2=1:1:currentLength
        {
            set currentX=currentX+xModifier
            set currentY=currentY+yModifier
            set listCount = listCount + 1
            set $LIST(list,listCount)=currentX_"|"_currentY
        }

    }
 
    return list
}

ClassMethod Run2(verbose = 0) As %Integer
{
    w "Start: "_$ZDT($H),!
    set stream=..GetInput(..#InputFile)

    set wire1Input = stream.ReadLine()
    set wire2Input = stream.ReadLine()

    //set wire1Input = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51"
    //set wire2Input = "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"

    //set wire1Input = "R8,U5,L5,D3"
    //set wire2Input = "U7,R6,D4,L4"

    //w "Wire 1: "_wire1Input,!
    //w "Wire 2: "_wire2Input,!

    set wire1List = ..DirectionsToPointList2(wire1Input)
    set wire2List = ..DirectionsToPointList2(wire2Input)
    //w $Listtostring(wire1List),!
    //w $Listtostring(wire2List),!

    set matchListCount = 0

    set shortestLength = 0

    for index=0:1:$Listlength(wire1List){
        set currentWire1Position = $LISTGET(wire1List,index)
        for index2=0:1:$Listlength(wire2List){
            set currentWire2Position = $LISTGET(wire2List,index2)
            set currentWire1XY = $P(currentWire1Position,"|",1)_"|"_$P(currentWire1Position,"|",2)
            set currentWire2XY = $P(currentWire2Position,"|",1)_"|"_$P(currentWire2Position,"|",2)
            if currentWire1XY = currentWire2XY{
                w "Wire 1: "_currentWire1Position,!
                w "Wire 2: "_currentWire2Position,!
                set currentWire1Length = $P(currentWire1Position,"|",3)
                set currentWire2Length = $P(currentWire2Position,"|",3)
                set totalWireLength = currentWire1Length + currentWire2Length
                if ((shortestLength = 0)||(totalWireLength < shortestLength)){
                    set shortestLength = totalWireLength
                }
            }
        }
    }

    w "Length: "_shortestLength,!

    w "End: "_$ZDT($H),!
    return shortestLength
}

ClassMethod DirectionsToPointList2(directions As %String) As %ListOfObjects
{
    set directionCount = $LENGTH(directions,",")
    
    set currentX = 0
    set currentY = 0
    set currentWireLength = 0

    set listCount = 0
    for index=1:1:directionCount
    {
        set currentInstruction = $PIECE(directions,",",index)
        set currentDirection = $E(currentInstruction,1,1)
        set currentLength = $E(currentInstruction,2,$LENGTH(currentInstruction))

        set xModifier = 0
        set yModifier = 0

        if currentDirection = "U"{
            set yModifier = 1
        }
        if currentDirection = "D"{
            set yModifier = -1
        }

        if currentDirection = "R"{
            set xModifier = 1
        }
        if currentDirection = "L"{
            set xModifier = -1
        }

        for index2=1:1:currentLength
        {
            set currentX=currentX+xModifier
            set currentY=currentY+yModifier
            set listCount = listCount + 1
            set currentWireLength = currentWireLength + 1
           
            set $LIST(list,listCount)=currentX_"|"_currentY_"|"_currentWireLength

        }

    }
 
    return list
}

}
