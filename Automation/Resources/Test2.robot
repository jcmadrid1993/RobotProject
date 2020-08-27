*** Settings ***
Library    Selenium2Library    
Library    ExcelLibrary    
Library    ExcelRobot    

*** Variables ***
${Browser}    chrome
${URL}    https://www.google.com/

*** Keywords ***
Open Browser google
    Open Browser    ${url}    ${browser}

Input Text Test
    Log    Enter Text    
    [Arguments]    ${row}
    ${trialText}    Get Column Values    Sheet1    2    
    Log    ${trialText} 
    Input Trial Text    ${trialText}   
    

Input Trial Text
    [Arguments]    ${value}
    Input Text    xpath://input[@class='gLFyf gsfi']    ${value}    
    
Get Current Title Page
    [Arguments]     ${value}
    ${present}    Run Keyword And Return Status    Element Should Be Visible   xpath://img[@alt='Google']
    [return]    ${present}

    