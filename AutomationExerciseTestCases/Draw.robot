*** Settings ***
Library    FakerLibrary
Library  String
Library    Collections

*** Test Cases ***
Drawing
   ${MobileNumber}  Generate Random String  7  123456789
   Log To Console    +903422${MobileNumber}

   ${as}  Create List   A  B  C  D
   FOR    ${index}    ${element}    IN ENUMERATE    ${as}
     #  Log To Console  ${index}: ${element}
       IF     ${index}== 0
           Log To Console   ${element}

       END



   END