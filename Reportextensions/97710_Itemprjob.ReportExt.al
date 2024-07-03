reportextension 97710 "BAL ItemprJob" extends "Items per Job"
{
    dataset
    {
        add(Integer)
        {
            column(BALLength;TempJobBuffer."BAL Length")
            {}
            column(BALWidth;TempJobBuffer."BAL Width")
            {}
            column(BALQuality;TempJobBuffer."BAL Quality")
            {}
            column(BALTotalLength;TempJobBuffer."BAL Total Length")
            {}
        }
    }
    
    requestpage
    {
        // Add changes to the requestpage here
    }
    /*
    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }
    */
}