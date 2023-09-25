tableextension 97711 "BAL Purch. Inv.Line table ext" extends "Purch. Inv. Line"
{
    fields
    {
        field(97700; "BAL Quality"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Quality';
            TableRelation = "BAL Qualtity";
        }
        field(97701; "BAL Length"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Length';
        }
    }

    var
        myInt: Integer;
}