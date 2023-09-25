tableextension 97710 "BAL Purch. Rcpt.Line table ext" extends "Purch. Rcpt. Line"
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