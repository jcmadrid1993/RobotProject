*** Settings ***
Library    Selenium2Library    
Resource    ../Resources/HMS_Repush.robot
Library    DataDriver    Test Data/HMS_RepushData.xlsx    sheet_name=Sheet1
Library    ExcelLibrary     
Suite Setup    Open HMS
Suite Teardown    Close All Browsers
Test Template    Enter TN


*** Variables ***
${trackingNumber}        
*** Test Cases ***

HMS REPUSH NEW ORDERS TO FAREYE   ${trackingNumber}



*** Keywords ***
Enter TN
    [Arguments]    ${trackingNumber}
    Enter Tracking Number    ${trackingNumber}
    Press Enter
    Select TN
    Push To Fareye
    Capture Screenshot
    




