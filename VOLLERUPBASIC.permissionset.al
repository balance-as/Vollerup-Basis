permissionset 97700 "VOLLERUP BASIC"
{
    Assignable = true;
    Permissions = tabledata "BAL Job Buffer"=RIMD,
        tabledata "BAL Qualtity"=RIMD,
        table "BAL Job Buffer"=X,
        table "BAL Qualtity"=X,
        report "BAL Items per Job"=X,
        codeunit "BAL Vollerup Func"=X,
        page "BAL Quality"=X;
}