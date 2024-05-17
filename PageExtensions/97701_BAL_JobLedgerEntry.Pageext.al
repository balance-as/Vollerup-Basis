pageextension 97701 "BAL Job Ledg Entry PageExt" extends "Job Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("BAL Quality"; Rec."BAL Quality")
            {
                ApplicationArea = all;
            }
            field("BAL Length"; Rec."BAL Length")
            {
                ApplicationArea = all;
            }
            field("BAL Total Length"; Rec."BAL Total Length")
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
   var
   ItemJnlPostLine:Codeunit "Item Jnl.-Post Line";
rep1013:Report 1013;
}