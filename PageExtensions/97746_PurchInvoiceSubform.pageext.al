pageextension 97746 "BAL PostedPuchInv Subf PageExt" extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("Description 2")
        {
            field("BAL Quality"; Rec."BAL Quality")
            {
                ApplicationArea = all;
            }
            field("BAL Length"; Rec."BAL Length")
            {
                ApplicationArea = all;
            }
            field("BAL Total Length";Rec."BAL Total Length")
            {
                ApplicationArea = All;
                BlankZero = true;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}