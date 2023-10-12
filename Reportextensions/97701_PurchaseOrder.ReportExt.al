reportextension 97701 "BAL Purchase order Report Ext" extends "Standard Purchase - Order"
{
    dataset
    {
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
            column(BAL_Total_Length; "BAL Total Length")
            { }
            column(BAL_Width; "BAL Width")
            { }
        }
    }
}