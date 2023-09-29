pageextension 97748 "BAL PostPuch RecpSubf PageExt" extends "Posted Return Shipment Subform"
{
    layout
    {
        addafter("Description")
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