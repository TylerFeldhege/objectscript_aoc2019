Class advent2019.Day4 Extends advent2019.Base
{

Parameter InputFile = "input1.txt";

ClassMethod Run(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)

    while 'stream.AtEnd{
        set line = stream.ReadLine()

        w line,!
    }

    return $$$OK
}

}
