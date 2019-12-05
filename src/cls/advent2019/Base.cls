Class advent2019.Base
{

Parameter Folder = "/irisdev/app/src/cls/advent2019/Files/";

ClassMethod GetInput(fn) As %Stream
{
   
    set fn=..#Folder_fn
    set stream = ##Class(%Stream.FileCharacter).%New()
    set sc=stream.LinkToFile(fn)
    return stream
}

}
