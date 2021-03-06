*** Settings ***
Library    Selenium2Library    
Library    ScreenCapLibrary
    

*** Variables ***
${URL}    https://hms.entrego.org/
${Browser}    chrome
${trackingNumber}    using ${trackingNumber}
*** Keywords ***
Open HMS
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Title Should Be    LMS    
    Wait Until Page Contains    LMS    
    Log Title
    Set Browser Implicit Wait    10
    Click Element    xpath://button[contains(@class,'my-4 px-4')] 
    Sleep    2    
    Select Window    NEW
    Sleep    2    
    Input Text    id:identifierId    johnecis.madrid@entrego.com.ph
    Sleep    2   
    Click Element    class:VfPpkd-RLmnJb  
    Sleep    2    
    Input Text    xpath://html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div[1]/div[1]/div/div/div/div/div[1]/div/div[1]/input    @EntregoMadrid0804
    Sleep    3    
    Click Element    class:VfPpkd-RLmnJb
    Sleep    10
    Switch Window   MAIN
    Sleep    5    
        
Enter Tracking Number
    [Arguments]    ${trackingNumber}
    Wait Until Page Contains    Orders
    Wait Until Page Contains    Search        
    Selenium2Library.Input Text    xpath://div[contains(@class,'search-control control')]//input[1]    ${trackingNumber}
    Sleep    3        
Press Enter
    Press Keys    dom:document.querySelectorAll('input')[2];    RETURN
    Sleep    5    
Select TN       
    Click Element    xpath://html/body/div/div/div[2]/div/div[3]/div[2]/table/tbody/tr/td[1]/span
    Sleep    3    
    
Print Waybill
    Log    Print Waybill    
    Click Element    xpath://html/body/div[2]/div[3]/div/div[1]/div[2]/div/div/div[2]/button    
    Sleep    2          
    Click Element    xpath://html/body/div[3]/div[3]/div/div[3]/button[2]  
    Sleep    3      
        
Capture Screenshot
    ScreenCapLibrary.Set Screenshot Directory    C:/Users/ENTREGO/eclipse-workspace/Automation/Screenshots
    Take Screenshot    WayBill
    Press Keys    None    ESC  
    Sleep    3 
             

