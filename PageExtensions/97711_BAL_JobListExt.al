pageextension 97711 "BAL Job List Ext" extends "Job List"
{
    layout
    {

        addafter("% Invoiced")
        {
           
            field(DB; DB)
            {
                ApplicationArea = All;
                DecimalPlaces = 0 : 2;
                BlankZero = True;
            }
            field("Avance Pct"; "Avance Pct")
            {
                ApplicationArea = All;
                DecimalPlaces = 0 : 2;
                BlankZero = True;
            }
            
        }
    }

    actions
    {
        modify("&Job")
        {
            Caption = '&Job';
        }


    }
    trigger OnAfterGetRecord()
    var
        Jobtask: Record "Job Task";
    begin
        jobtask.SetRange("Job No.", rec."No.");
        if jobtask.findlast then begin
            jobtask.CalcFields("Usage (Total Cost)", "Contract (Total Price)");
            DB := Jobtask."Contract (Total Price)" - Jobtask."Usage (Total Cost)";
            if Jobtask."Contract (Total Price)" = 0 then
                "Avance Pct" := 0
            else
                "Avance Pct" := DB / Jobtask."Contract (Total Price)" * 100;
        end else begin
            DB := 0;
            "Avance pct" := 0;
        end;

    end;

    var
        DB: Decimal;
        "Avance Pct": Decimal;
      
}
