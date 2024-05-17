pageextension 97703 "BAL Item Jnl Lines PageExt" extends "Item Journal Lines"
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
}