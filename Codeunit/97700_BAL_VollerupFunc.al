codeunit 97730 "BAL Vollerup Func"
{
    trigger OnRun()
    begin

    end;

   
    [EventSubscriber(ObjectType::Report, Report::"Create Time Sheets", 'OnResourceOnAfterGerRecordOnAfterTimeSheetHeaderInserted', '', false, false)]
    local procedure CreateTimeSheetRecord(TimeSheetHeader: Record "Time Sheet Header"; Resource: Record Resource)
    var
        TimeSheetLine: record "Time Sheet Line";
    begin
        TimeSheetLine.init;
        TimeSheetLine."Time Sheet No." := TimeSheetHeader."No.";
        TimeSheetLine."Line No." := 10000;
        TimeSheetLine.Type := TimeSheetLine.Type::Job;
        if TimeSheetLine.insert then;
    end;

    var
        myInt: Integer;
}