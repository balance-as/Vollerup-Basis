reportextension 97702 "BAL Purchase Invoice Rep Ext" extends "Purchase - Invoice"
{
    dataset
    {
        add("Purch. Inv. Line")
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