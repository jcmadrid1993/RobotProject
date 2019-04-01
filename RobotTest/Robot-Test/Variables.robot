*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    I am inside test suite setup
Suite Teardown    Log    I am inside test suite teardown
Test Setup    Log    I am inside test setup
Test Teardown    Log    I am inside test teardown

Default Tags    Sanity        

*** Test Cases ***
MyFirstTest
    [Tags]    Smoooke
    Log    Hello World...   

FirstSeleniumTest
    [Tags]    Smoke 2
    Open Browser    https://app.salarium.com/    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Sleep    5    
    Close Browser    
    Log    Test Completed
    Log    This test was exectuted by %{username} on %{os}     
    
*** Variables ***
${URL}    https://app.salarium.com/
@{CREDS}    johnecis.madrid@entrego.com.ph    JohnecisMadrid1993
&{LoginData}    username=johnecis.madrid@entrego.com.ph    password=JohnecisMadrid1993

*** Keywords ***
LoginKW
    Input Text    name=email    @{CREDS}[0]
    Input Password    name=password    &{LoginData}[password]
    Click Button    class=btn-form-custom  


 
    

    