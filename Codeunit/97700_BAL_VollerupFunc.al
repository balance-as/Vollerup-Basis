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

    //cu22

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromPurchLine, '', true, true)]
    local procedure DatabaseItemJournalLineOnAfterCopyItemJnlLineFromPurchLine(PurchLine: Record "Purchase Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine."BAL Quality" := PurchLine."BAL Quality";
        ItemJnlLine."BAL Width" := PurchLine."BAL Width";
        ItemJnlLine."BAL Length" := PurchLine."BAL Length";
        ItemJnlLine."BAL Total Length" := PurchLine."BAL Total Length";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', true, true)]
    local procedure CodeunitItemJnlPostLineOnAfterInitItemLedgEntry(ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry."BAL Quality" := ItemJournalLine."BAL Quality";
        NewItemLedgEntry."BAL Width" := ItemJournalLine."BAL Width";
        NewItemLedgEntry."BAL Length" := ItemJournalLine."BAL Length";
        NewItemLedgEntry."BAL Total Length" := ItemJournalLine."BAL Total Length";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", OnAfterFromPurchaseLineToJnlLine, '', true, true)]
    local procedure CodeunitJoBTransferLineOnAfterFromPurchaseLineToJnlLine(var JobJnlLine: Record "Job Journal Line"; PurchLine: Record "Purchase Line")
    begin
        JobJnlLine."BAL Quality" := PurchLine."BAL Quality";
        JobJnlLine."BAL Width" := PurchLine."BAL Width";
        JobJnlLine."BAL Length" := PurchLine."BAL Length";
        JobJnlLine."BAL Total Length" := PurchLine."BAL Total Length";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", OnAfterFromJnlLineToLedgEntry, '', true, true)]
    local procedure CodeunitJobTransferLineOnAfterFromJnlLineToLedgEntry(var JobLedgerEntry: Record "Job Ledger Entry"; JobJournalLine: Record "Job Journal Line")
    var

    begin
        JobLedgerEntry."BAL Quality" := JobJournalLine."BAL Quality";
        JobLedgerEntry."BAL Width" := JobJournalLine."BAL Width";
        JobLedgerEntry."BAL Length" := JobJournalLine."BAL Length";
        JobLedgerEntry."BAL Total Length" := JobJournalLine."BAL Total Length";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Job Buffer", 'OnReportJobItemOnBeforeUpsertJobBuffer', '', true, true)]
    local procedure DatabaseJobBufferOnReportJobItemOnBeforeUpsertJobBuffer(JobLedgerEntry: Record "Job Ledger Entry"; Item: Record Item; var TempJobBuffer: array[2] of Record "Job Buffer")
    begin
        TempJobBuffer[1]."BAL Width" := JobLedgerEntry."BAL Width";
        TempJobBuffer[1]."BAL Length" := JobLedgerEntry."BAL Length";
        TempJobBuffer[1]."BAL Quality" := JobLedgerEntry."BAL Quality";
        TempJobBuffer[1]."BAL Total Length" := JobLedgerEntry."BAL Total Length";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Job Buffer", 'OnReportJobItemOnBeforeModifyJobBuffer', '', true, true)]
    local procedure DatabaseJobBufferOnReportJobItemOnBeforeModifyJobBuffer(var TempJobBuffer: array[2] of Record "Job Buffer"; JobLedgerEntry: Record "Job Ledger Entry")
    begin
        TempJobBuffer[2]."BAL Width" :=
                             TempJobBuffer[2]."BAL Width" + TempJobBuffer[1]."BAL Width";
        TempJobBuffer[2]."BAL Length" :=
                              TempJobBuffer[2]."BAL Length" + TempJobBuffer[1]."BAL Length";
        TempJobBuffer[2]."BAL Total Length" :=
                             TempJobBuffer[2]."BAL Total Length" + TempJobBuffer[1]."BAL Total Length";
    end;

}