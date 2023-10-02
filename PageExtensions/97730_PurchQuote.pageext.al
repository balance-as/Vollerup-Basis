pageextension 97730 "BAL Puch Quote PageExt" extends "Purchase Quote"
{
    layout
    {
        // Add changes to page layout here
        addafter(General)
        {
            group(VollerupFields)
            {
                Caption = 'Vollerup Fields';
                field("BAL Job No.";Rec."BAL Job No.")
                {
                    ApplicationArea = All;
                }
                field("BAL Job Task";Rec."BAL Job Task")
                {
                    ApplicationArea = All;
                }
                field("BAL Job Description";Rec."BAL Job Description")
                {
                    ApplicationArea = All;
                }
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