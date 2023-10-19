pageextension 97750 "BAL CDC Purch. List Ext" extends "CDC Purchase List"
{
    //BAL1.01/Vollerup/19102023/AR  : Created

    //BAL1.01/START
    //BAL1.01/STOP

    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            field("BAL Job No."; Rec."BAL Job No.")
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