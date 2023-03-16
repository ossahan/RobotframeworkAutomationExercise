*** Settings ***
Suite Setup   Log To Console    Opening browser
Suite Teardown  Log To Console    Closing browser

Test Setup  Log To Console    login to application
Test Teardown  Log To Console    Logout from application

*** Test Cases ***
TC1 Prepaid recharge
    Log To Console    This is prepaid recharge testcase
    
TC2 Postpaid recharge 
    Log To Console    This is postpaid recharge testcase
    
TC3 Search
    Log To Console    This is Search test case
    
TC4 Advanced Search
    Log To Console    This is adv search test case        
