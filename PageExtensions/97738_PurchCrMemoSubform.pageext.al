pageextension 97738 "BAL Puch CrMemoSubf PageExt" extends "Purch. Cr. Memo Subform"
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
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}