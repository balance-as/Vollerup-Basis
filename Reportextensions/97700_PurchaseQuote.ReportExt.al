reportextension 97700 "BAL Purchase Quote Report Ext" extends "Purchase - Quote"
{
    dataset
    {
        add(RoundLoop)
        {
            column(BAL_Description_2; "Purchase Line"."Description 2")
            {

            }
            column(BAL_Quality; "Purchase Line"."BAL Quality")
            {

            }
            column(BAL_Length; "Purchase Line"."BAL Length")
            {

            }
            column(BAL_JobNo; "Purchase Line"."Job No.")
            {

            }
            column(BAL_Total_Length; "Purchase Line"."BAL Total Length")
            { }
            column(BAL_Width; "Purchase Line"."BAL Width")
            { }
        }
    }
}