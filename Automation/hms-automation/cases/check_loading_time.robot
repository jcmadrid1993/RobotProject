*** Settings ***
Library  SeleniumLibrary
Library  DateTime

*** Variables ***
${url}  https://hms.entrego.org/
${browser}  chrome

*** Test Cases ***
Loading Page
  ${startTime}  Get Current Date
  Open Browser  ${url}  ${browser}
  Wait Until Page Contains Element  xpath://html/body/div/div/div
  ${finalTime}  Get Current Date
  ${diff}  Subtract Date From Date  ${finalTime}  ${startTime}
  Log  ${diff}
  Should Be True  ${diff} < 12
  Sleep  2
  Close All Browsers