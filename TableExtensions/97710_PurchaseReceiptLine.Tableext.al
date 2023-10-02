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
        field(97701; "BAL Length"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Length';
            DecimalPlaces = 0 : 5;
            BlankZero = true;
        }
        field(97702; "BAL Total Length"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total Length';
            DecimalPlaces = 0 : 5;
            BlankZero = true;
        }
    }
}