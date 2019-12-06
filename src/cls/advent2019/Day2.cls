Class advent2019.Day2 Extends advent2019.Base
{

Parameter InputFile = "input2.txt";

ClassMethod Run(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)
    set line = stream.ReadLine()
    set $PIECE(line,",",1+1,1+1)=12
    set $PIECE(line,",",2+1,2+1)=2

    //set line = "1,1,1,4,99,5,6,0,99"
    if verbose = 1{
        w "Original Line: "_line,!
    }

    set currentPoint = 0
    set opcode1 = ..getPosition(line,currentPoint)

    while opcode1 '= "99"
    {
        set opcode1 = ..getPosition(line,currentPoint)
        set opcode2 = ..getPosition(line,currentPoint+1)
        set opcode3 = ..getPosition(line,currentPoint+2)
        set opcode4 = ..getPosition(line,currentPoint+3)

        if verbose = 1
        {
            w "Opcode1: "_opcode1,!
            w "Opcode2: "_opcode2,!
            w "Opcode3: "_opcode3,!
            w "Opcode4: "_opcode4,!
        }

        //Addition
        if opcode1 = "1"
        {
            //Add 1 to opcode4 because Iris arrays start at 1 instead of 0
            set $PIECE(line,",",opcode4+1) = ..getPosition(line,opcode2) + ..getPosition(line,opcode3)
        }
        //Multiplication
        if opcode1 = "2"
        {
            //Add 1 to opcode4 because Iris arrays start at 1 instead of 0
            set $PIECE(line,",",opcode4+1) = ..getPosition(line,opcode2) * ..getPosition(line,opcode3)
        }

        //Halt
        if opcode1 = "99"{
            write "Final Line: "_line,!
            return $$$OK
        }

        set currentPoint = currentPoint + 4
        set opcode1 = ..getPosition(line,currentPoint)
    }
    
    if verbose = 1{
        w "Final Line: ",line,!
    }
    
    return ..getPosition(line,0)
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set noun = 0
    set verb = 0
    
    for noun=0:1:99{
        w "Current Noun: "_noun,!
        for verb=0:1:99{
            set result = ..RunProgram(noun,verb,0)

            if result = "19690720"
            {
                set result = 100*noun + verb
                if verbose = 1
                {
                    w "Noun: "_noun,!
                    w "Verb: "_verb,!
                    w "Result: "_result,!
                }
                return result

            }
        
        }
    }


    //return ..RunProgram(12,2,verbose)
    return $$$OK
}

ClassMethod RunProgram(noun As %Integer, verb As %Integer, verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)
    set initialMemory = stream.ReadLine()
    set $PIECE(initialMemory,",",1+1,1+1)=noun
    set $PIECE(initialMemory,",",2+1,2+1)=verb
    set memory = initialMemory

    //set line = "1,1,1,4,99,5,6,0,99"
    if verbose = 1{
        w "Original Line: "_memory,!
    }

    set instructionPointer = 0
    set opcode1 = ..getPosition(memory,instructionPointer)

    while opcode1 '= "99"
    {
        set opcode1 = ..getPosition(memory,instructionPointer)
        set opcode2 = ..getPosition(memory,instructionPointer+1)
        set opcode3 = ..getPosition(memory,instructionPointer+2)
        set opcode4 = ..getPosition(memory,instructionPointer+3)

        if verbose = 1
        {
            w "Opcode1: "_opcode1,!
            w "Opcode2: "_opcode2,!
            w "Opcode3: "_opcode3,!
            w "Opcode4: "_opcode4,!
        }

        //Addition
        if opcode1 = "1"
        {
            //Add 1 to opcode4 because Iris arrays start at 1 instead of 0
            set $PIECE(memory,",",opcode4+1) = ..getPosition(memory,opcode2) + ..getPosition(memory,opcode3)
        }
        //Multiplication
        if opcode1 = "2"
        {
            //Add 1 to opcode4 because Iris arrays start at 1 instead of 0
            set $PIECE(memory,",",opcode4+1) = ..getPosition(memory,opcode2) * ..getPosition(memory,opcode3)
        }

        set instructionPointer = instructionPointer + 4
        set opcode1 = ..getPosition(memory,instructionPointer)
    }
    
    if verbose = 1{
        w "Final memory: "_memory,!
    }
    
    return ..getPosition(memory,0)
}

ClassMethod getPosition(memory As %String, address As %Integer) As %Integer
{
    return $PIECE(memory,",",address+1)
}

}
