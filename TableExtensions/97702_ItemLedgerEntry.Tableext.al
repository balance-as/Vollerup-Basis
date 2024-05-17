tableextension 97702 "BAL Item Ledg Entry table ext" extends "Item Ledger Entry"
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
        field(97703; "BAL Width"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Width';
            DecimalPlaces = 0 : 5;
            BlankZero = true;
        }
    }
}