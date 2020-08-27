*** Settings ***
Library           Selenium2Library
Library           DateTime    

*** Variable ***
${url}    http://hms.entrego.org/      #any url you want measure loading page
${browser}    chrome
*** Test cases ***
Loading page
    ${starttime} =  Get Current Date    
    Open Browser    ${url}    ${browser}
    Wait Until Page Contains Element        xpath://html/body/div/div/div    
    ${finaltime} =   Get Current Date      
    ${different} =   Subtract Date From Date     ${finaltime}     ${starttime}           #unit (s)
    Log    ${different}
    Should Be True    ${different}<12                #check this condition which depend you on 
    Sleep    2    
    Close All Browsers


