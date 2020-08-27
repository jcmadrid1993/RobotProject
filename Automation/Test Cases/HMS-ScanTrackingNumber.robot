*** Settings ***
Library    Selenium2Library    
Resource    ../Resources/HMS.robot
Library    DataDriver    Test Data/HMS_Data.xlsx    sheet_name=Sheet1
Library    ExcelLibrary     
Suite Setup    Open HMS
Suite Teardown    Close All Browsers
Test Template    Enter TN


*** Variables ***
${trackingNumber}        
*** Test Cases ***

HMS Search Tracking Number Detail   ${trackingNumber}



*** Keywords ***
Enter TN
    [Arguments]    ${trackingNumber}
    Enter Tracking Number    ${trackingNumber}
    Press Enter
    Select TN
    Capture Screenshot
    




