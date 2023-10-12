pageextension 97745 "BAL Puch Reciept Subf PageExt" extends "Posted Purchase Rcpt. Subform"
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
            field("BAL Width"; Rec."BAL Width")
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