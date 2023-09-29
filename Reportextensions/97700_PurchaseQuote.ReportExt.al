reportextension 97700 "BAL Purchase Quote Report Ext" extends "Purchase - Quote"
{
    dataset
    {
        add(RoundLoop)
        {
        }
        add("Purchase Line")
        {
            column(BAL_Description_2; "Description 2")
            {

            }
            column(BAL_Quality; "BAL Quality")
            {

            }
            column(BAL_Length; "BAL Length")
            {

            }
            column(BAL_JobNo; "Job No.")
            {

            }
            column(BAL_Total_Length; "BAL Total Length")
            { }
        }
    }
}