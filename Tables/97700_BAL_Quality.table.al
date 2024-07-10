table 97700 "BAL Qualtity"
{
    DataClassification = ToBeClassified;
    LookupPageId = "BAL Quality";
    DrillDownPageId= "BAL Quality";
    
    
    fields
    {
  field(1;Code; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
            
        }
        field(10; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }    }
    
    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}