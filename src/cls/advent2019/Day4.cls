Class advent2019.Day4 Extends advent2019.Base
{

Parameter InputFile = "input1.txt";

ClassMethod Run(verbose = 0) As %Integer
{
    set passwordCount = 0

    for currentPassword=128392:1:643281
    {
        set twoAdjacent = 0
        set neverDecrease = 0

        set pos1 = $E(currentPassword,1)
        set pos2 = $E(currentPassword,2)
        set pos3 = $E(currentPassword,3)
        set pos4 = $E(currentPassword,4)
        set pos5 = $E(currentPassword,5)
        set pos6 = $E(currentPassword,6)

        if ((pos1=pos2)||(pos2=pos3)||(pos3=pos4)||(pos4=pos5)||(pos5=pos6))
        {
            set twoAdjacent = 1
        }

        if ((pos1<=pos2)&&(pos2<=pos3)&&(pos3<=pos4)&&(pos4<=pos5)&&(pos5<=pos6))
        {
            set neverDecrease = 1
        }

        if ((twoAdjacent)&&(neverDecrease)){
            set passwordCount = passwordCount + 1
            w "Current Password Count:"_passwordCount,!
            w "Current Password: "_currentPassword,!
        }
    }
    return passwordCount
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set passwordCount = 0

    for currentPassword=128392:1:643281
    {
        set twoAdjacent = 0
        set neverDecrease = 0
        set neverDecreaseTwoDigits = 0

        set pos1 = $E(currentPassword,1)
        set pos2 = $E(currentPassword,2)
        set pos3 = $E(currentPassword,3)
        set pos4 = $E(currentPassword,4)
        set pos5 = $E(currentPassword,5)
        set pos6 = $E(currentPassword,6)

        //Two Adjacent
        if ((pos1=pos2)&&(pos2'=pos3)){
            set twoAdjacent = 1
        }

        if ((pos2=pos3)&&(pos1'=pos2)&&(pos3'=pos4)){
            set twoAdjacent = 1
        }

        if ((pos3=pos4)&&((pos2'=pos3)&&(pos4'=pos5))){
            set twoAdjacent = 1
        }

        if ((pos4=pos5)&&((pos3'=pos4)&&(pos5'=pos6))){
            set twoAdjacent = 1
        }

        if ((pos5=pos6)&&(pos4'=pos5)){
            set twoAdjacent = 1
        }

        if ((pos1<=pos2)&&(pos2<=pos3)&&(pos3<=pos4)&&(pos4<=pos5)&&(pos5<=pos6))
        {
            set neverDecrease = 1
        }

        if ((twoAdjacent)&&(neverDecrease)){
            set passwordCount = passwordCount + 1
            w "Current Password Count:"_passwordCount,!
            w "Current Password: "_currentPassword,!
        }
    }
    return passwordCount
}

}
