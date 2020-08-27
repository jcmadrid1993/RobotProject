*** Settings ***
Library    Selenium2Library    
Resource    ../Resources/HMS_PrintWayBill.robot
Library    DataDriver    Test Data/HMS_WaybillData.xlsx    sheet_name=Sheet1
Library    ExcelLibrary     
Suite Setup    Open HMS
Suite Teardown    Close All Browsers
Test Template    Enter TN


*** Variables ***
${trackingNumber}        
*** Test Cases ***

HMS PRINT WAYBILL STICKER   ${trackingNumber}



*** Keywords ***
Enter TN
    [Arguments]    ${trackingNumber}
    Enter Tracking Number    ${trackingNumber}
    Press Enter
    Select TN
    Print Waybill
    Capture Screenshot
    




