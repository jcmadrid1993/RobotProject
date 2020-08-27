*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Library  Collections
Resource  ../resources/login.robot
Resource  ../resources/tracking_number.robot
Suite Setup  Login to HMS  johnecis.madrid@entrego.com.ph  @EntregoMadrid0804
Suite Teardown  Close All Browsers

*** Variables ***
${excelFile}  C:\\Users\\ENTREGO\\eclipse-workspace\\hms-automation\\data\\tracking_number.xlsx
${rowCounter}  ${2}  # Default to (2) as header value is equals to (1)

*** Test Cases ***
Print Waybill from Excel File
  Open Excel Document  ${excelFile}  document
  ${trackingNumberList}=  Read Excel Column  col_num=1
  Remove values from list  ${trackingNumberList}  Tracking Number  # Remove Column Headers
  FOR  ${trackingNumber}  IN  @{trackingNumberList}
    ${status}=  Run Keyword And Return Status  Search Tracking Number  ${trackingNumber}
    Run Keyword If  ${status} == True  Run Keywords  Print Waybill  AND  Write Excel Cell  ${rowCounter}  ${2}  Pass
    ...  ELSE  Write Excel Cell  ${rowCounter}  ${2}  Fail
    ${rowCounter}=  Evaluate  ${rowCounter}+1  # Increment row counter
  END
  Save Excel Document  ${excelFile}
  Close Current Excel Document