pageextension 97731 "BAL Puch order PageExt" extends "Purchase order"
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
}