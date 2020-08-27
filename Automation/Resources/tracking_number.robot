*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Search Tracking Number
  [Arguments]  ${trackingNumber}
  Wait Until Page Contains  Orders
  Wait Until Page Contains  Search
  Input Text  xpath://div[contains(@class,'search-control control')]//input[1]  ${trackingNumber}
  Sleep  3
  Press Keys  dom:document.querySelectorAll('input')[2];  RETURN
  Sleep  5
  Click Element  xpath://html/body/div/div/div[2]/div/div[3]/div[2]/table/tbody/tr/td[1]/span
  Sleep  3
  
Print Waybill
  Click Element  xpath://html/body/div[2]/div[3]/div/div[1]/div[2]/div/div/div[2]/button
  Sleep    2    
  Click Element  xpath://html/body/div[3]/div[3]/div/div[3]/button[2]
  Sleep    3    
  Press Keys    None    ESC
  Wait Until Page Contains  Orders
  Sleep    3    
  Wait Until Page Contains  Search