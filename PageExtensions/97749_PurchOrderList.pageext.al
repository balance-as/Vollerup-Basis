pageextension 97749 "BAL Puch Order List PageExt" extends "Purchase Order List"
{
    //BALVersionTag/Vollerup/29092023/JNI  : Description
    
    //BALVersionTag/START
    //BALVersionTag/STOP
    
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("BAL Job No."; Rec."BAL Job No.")
            {
                ApplicationArea = All;
            }
            field("BAL Job Task"; Rec."BAL Job Task")
            {
                ApplicationArea = All;
            }
            field("BAL Job Description"; Rec."BAL Job Description")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}