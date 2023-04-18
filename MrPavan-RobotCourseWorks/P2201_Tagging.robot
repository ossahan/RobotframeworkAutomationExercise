*** Settings ***
#robot -i regression -i sanity  TestCases/P2201_Tagging.robot  --bu sekilde yazinca multiple taglar execute edilmis olur
#robot -i regression  TestCases/P2201_Tagging.robot  --bu sekilde yazinca tum regression taginde olanlari calistirir
#robot -e regression  TestCases/P2201_Tagging.robot --bu sekilde yazinca regression taginde olanlar haric diger taglarin tumunu execute et demis oluruz
*** Test Cases ***
TC1 User registration test
    [Tags]   sanity
    Log To Console    This is user registration test
    Log To Console    User registration test is over

TC2 Login Test
    [Tags]  regression   sanity  #Bu sekilde bir test case multiple tag ile isaretlendirilebilir
    Log To Console    This is login test
    Log To Console    Login test is over

TC3 Change user settings
    [Tags]  regression
    Log To Console    This is changing user settings test
    Log To Console    Change user settings test is over

TC4 Logout Test
    [Tags]   sanity
    Log To Console    This is logout test
    Log To Console    Logout test is over