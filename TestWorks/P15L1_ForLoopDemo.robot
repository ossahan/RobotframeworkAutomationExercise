*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
ForLoop
        ForLoop6WithExit
*** Keywords ***
ForLoop1
      FOR        ${i}           IN RANGE      1    10
      log to console  ${i}
      END

ForLoop2
        FOR        ${i}      IN  1    2    3    4  5    6    7    8
        log to console    ${i}
        exit for loop if    ${i}==3
        END

ForLoop3WithList
        @{items}    create list    1   2  3  4  5
        FOR     ${i}    IN     @{items}
        log to console    ${i}
        END

ForLoop4
        FOR     ${i}    IN     osman    fadime    saime    zahide
        log to console    ${i}
        END

ForLoop5
        @{namesList}    create list    osman    fadime    saime    zahide
        FOR     ${i}    IN     @{namesList}
        log to console    ${i}
        END

ForLoop6WithExit

     @{items}    create list    1   2  3  4  5

        FOR    ${i}    IN    @{items}
        log to console     ${i}
        exit for loop if    ${i}==3
        END




