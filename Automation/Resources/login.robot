*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${url}    https://hms.entrego.org/
${browser}    chrome

*** Keywords ***
Login to HMS
  [Arguments]  ${email}  ${password}
  Open Browser    ${url}    ${browser}
  Maximize Browser Window
  Title Should Be  LMS
  Wait Until Page Contains  LMS
  Log  Title
  Set Browser Implicit Wait  10
  Click Element  xpath://button[contains(@class,'my-4 px-4')] 
  Sleep  2
  Select Window  NEW
  Sleep  2
  Input Text  id:identifierId  ${email}
  Sleep  2
  Click Element  class:VfPpkd-RLmnJb
  Sleep  2
  Input Text  dom:document.querySelectorAll(".whsOnd, .zHQkBf")[0];  ${password}
  Sleep  3
  Click Element  class:VfPpkd-RLmnJb
  Sleep  10
  Switch Window  MAIN
  Sleep  5