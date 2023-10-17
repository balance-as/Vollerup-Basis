codeunit 97730 "BAL Vollerup Func"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeInsertEvent', '', true, true)]
    local procedure TablePurchaseLineOnBeforeInsertEvent(var Rec: Record "Purchase Line"; RunTrigger: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        if rec.IsTemporary then
            exit;
        if Rec."Quantity Received" > 0 then
            exit;
        if Rec.Type = Rec.Type::" " then
            exit;
        PurchaseHeader := Rec.GetPurchHeader();
        if PurchaseHeader."BAL Job No." = '' then
            exit;
        Rec.SuspendStatusCheck(true);
        Rec.validate("Job No.", PurchaseHeader."BAL Job No.");
        Rec.Validate("Job Task No.", PurchaseHeader."BAL Job Task");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeConfirmPostProcedure', '', true, true)]
    local procedure CodeunitPurchPostYesNoOnBeforeConfirmPostProcedure(var DefaultOption: Integer; var PurchaseHeader: Record "Purchase Header")
    begin
        If PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then
            SetPurchasePosting(DefaultOption);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post + Print", 'OnBeforeConfirmPostProcedure', '', true, true)]
    local procedure CodeunitPurchPostPrintOnBeforeConfirmPostProcedure(var DefaultOption: Integer; var PurchHeader: Record "Purchase Header")
    begin
        If PurchHeader."Document Type" = PurchHeader."Document Type"::Order then
            SetPurchasePosting(DefaultOption);
    end;

    local procedure SetPurchasePosting(var DefaultOption: Integer)
    begin
        DefaultOption := 1;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateEvent', 'Quantity', true, true)]
    local procedure TablePurchaseLineOnBeforeValidateEventQuantity(var Rec: Record "Purchase Line")
    begin
        UpdateTotalLength(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateEvent', 'BAL Length', true, true)]
    local procedure TablePurchaseLineOnBeforeValidateEventBalLength(var Rec: Record "Purchase Line")
    begin
        UpdateTotalLength(Rec);
    end;

    local procedure UpdateTotalLength(var Rec: Record "Purchase Line")
    begin
        if (Rec."BAL Length" = 0) or (Rec.Quantity = 0) then
            exit;
        Rec."BAL Total Length" := Rec."BAL Length" * Rec.Quantity;

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

    [EventSubscriber(ObjectType::Page, Page::"Payment Journal", 'OnAfterActionEvent', 'ExportPaymentsToFile', true, true)]
    local procedure SetExported(var Rec: Record "Gen. Journal Line")
    var
        GenJnlLine: Record "Gen. Journal Line";
        ConfirmTxt: label 'Is the payments exported correctly?';

    begin
        GenJnlLine.SetRange("Journal Template Name", rec."Journal Template Name");
        GenJnlLine.setrange("Journal Batch Name", rec."Journal Batch Name");
        if Confirm(confirmtxt, true) then
            GenJnlLine.modifyall("Check Transmitted", true);
    end;

}