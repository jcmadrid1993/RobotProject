*** Settings *** 
Suite Teardown      
Library    Collections    
Library    Selenium2Library    
Library    requests       
Library    ExcelLibrary    


*** Variables ***
${path}     C:/Users/ENTREGO/eclipse-workspace/Automation/Test Data/ExcelTest.xlsx


*** Test Cases ***
Excel Test
    
    Open Excel File
    Create list store value and loop to response status
    
*** Keywords ***
Open Excel File
    Open Excel Document    ${path}    doc_id=doc_id
Create list store value and loop to response status
    
    @{ListExcel}=    Create List    
    :FOR    ${i}    IN RANGE    2    6
    \    ${data}    Read Excel Cell    Sheet1    A${i}
    \    Exit For Loop If    '${data}'=='${EMPTY}'
    \    Append To List    ${ListExcel}    ${data}
    Log    ${ListExcel}
    
    Open Excel Document    ${path}    doc_id=doc_id
    ${linkitem_lenght}    Get Length    ${ListExcel}
    :FOR    ${INDEX}    IN RANGE    ${linkitem_lenght}
    \    Log    ${INDEX}
    \    Create List    TestExisting    ${ListExcel[${INDEX}]}
    \    ${response}    Get    TestExisting    /
    \    ${curIndex}=    Evaluate    2+${INDEX}
    \    Run Keyword If    '${response.status_code}'!='200'    Write Excel Cell    ${curIndex}    2    FAIL
    \    Run Keyword If    '${response.status_code}'=='200'    Write Excel Cell    ${curIndex}    2    PASS        

    Save Excel Document    filename=ExcelTest2.xlsx           
    Close All Excel Documents                           
    

