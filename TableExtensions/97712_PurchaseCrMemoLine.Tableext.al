tableextension 97712 "BAL Purch CrMemoLine table ext" extends "Purch. Cr. Memo Line"
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