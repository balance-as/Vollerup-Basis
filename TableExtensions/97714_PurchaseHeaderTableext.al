tableextension 97714 "BAL Purchase Header Ext" extends "Purchase Header"
{
    //BAL1.01/Vollerup/29092023/JNI  : Created

    //BAL1.01/START
    //BAL1.01/STOP

    fields
    {
        field(97700; "BAL Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = CustomerContent;
            TableRelation = Job;
        }
        field(97701; "BAL Job Task"; Code[20])
        {
            Caption = 'Job Task';
            DataClassification = CustomerContent;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("BAL Job No."));
        }

        field(97702; "BAL Job Description"; Text[100])
        {
            Caption = 'Job Description';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Job.Description where("No." = field("BAL Job No.")));
        }
    }
}