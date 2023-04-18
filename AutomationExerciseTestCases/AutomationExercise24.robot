*** Comments ***
#1. Launch browser
#2. Navigate to url 'http://automationexercise.com'
#3. Verify that home page is visible successfully
#4. Add products to cart
#5. Click 'Cart' button
#6. Verify that cart page is displayed
#7. Click Proceed To Checkout
#8. Click 'Register / Login' button
#9. Fill all details in Signup and create account
#10. Verify 'ACCOUNT CREATED!' and click 'Continue' button
#11. Verify ' Logged in as username' at top
#12.Click 'Cart' button
#13. Click 'Proceed To Checkout' button
#14. Verify Address Details and Review Your Order
#15. Enter description in comment text area and click 'Place Order'
#16. Enter payment details: Name on Card, Card Number, CVC, Expiration date
#17. Click 'Pay and Confirm Order' button
#18. Verify success message 'Your order has been placed successfully!'
#19. Click 'Download Invoice' button and verify invoice is downloaded successfully.
#20. Click 'Continue' button
#21. Click 'Delete Account' button
#22. Verify 'ACCOUNT DELETED!' and click 'Continue' button




*** Settings ***
Library         SeleniumLibrary
Library         Collections

Library         OperatingSystem
Library         String
Library         FakerLibrary

Variables       ..//PageObjects/AutomationExercise.py



*** Variables ***
${url}          https://automationexercise.com/
${browser}      gc


*** Test Cases ***
Test Case 24: Download Invoice after purchase order
    Homepage should be visible
    After adding some products Cart Page should be visible
    Verify Account created



*** Keywords ***
Homepage should be visible
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

    ${homeColor}    SeleniumLibrary.Get Element Attribute    ${AutExerHome}    style
    Should Contain    ${homeColor}    orange

After adding some products Cart Page should be visible
    ${addToCartElements}    Get WebElements    ${addToCards}
    ${CartElementsLength}    Get Length    ${addToCartElements}
    ${ClickableCartElements}    Create List
    Set Selenium Speed    1

    FOR    ${indexNo}    IN RANGE    0    ${CartElementsLength}    2
        ${eachProductLocator}    Get From List    ${addToCartElements}    ${indexNo}
        Append To List    ${ClickableCartElements}    ${eachProductLocator}
#    ${d}    Get Text    ${c}
#    Log To Console    ${d}
    END
    Log To Console    ${CartElementsLength}
    ${g}    Get Length    ${ClickableCartElements}

    ${os}    Create List
    FOR    ${counter}    IN RANGE    0    5    1
        ${randomNumber}    Random Int    1    33
        ${randomProduct}    Get From List    ${ClickableCartElements}    ${randomNumber}
       # Scroll Element Into View     ${randomProduct}
        Click Element    ${randomProduct}
        Click Element    ${continueShopping}
        Append To List    ${os}    ${randomNumber}
    END
    Set Selenium Speed    0

#    ${d}    Get From List    ${ClickableCartElements}    15
#    Click Element    ${d}

    Click Element    ${goToCart}
    SeleniumLibrary.Element Text Should Be    ${ShoppingCart}    Shopping Cart
    Log To Console    ${os}

Verify Account created

    Click Element    ${ProceedToCheckout}
    Click Element    ${RegisterLoginOnCheckoutPopup}
    #Click Element    ${RegisterLogin}
    ${Name}    First Name Female
    ${ab}    Last Name
    ${b}    Email
    Input Text    name    ${Name}
    Input Text    ${SignupEmailBox}    ${b}
    Click Button    Signup
    Click Element    ${idGender}
    ${c}    Password
    Input Text    password    ${c}
    Select From List By Index    days    10
    Select From List By Index    months    1
    Select From List By Value    years    1980

    Input Text    first_name    ${Name}
    Input Text    last_name    ${ab}
    ${street}    Street Address
    Input Text    address1    ${street}
    Select From List By Index    country    5
    Input Text    state    Gaziantep
    Input Text    city    Körkun
    Input Text    zipcode    27000
    Input Text    mobile_number    +905418585525
    #Press Key    mobile_number    ENTER
    #Scroll Element Into View    ${CreateAccountButton}
    #Execute Javascript    document.getElementsByTagName('button')[0].click
    Execute Javascript    window.scrollTo(0, 1400);
    #Set Selenium Speed    100
    #Wait Until Element Is Enabled    ${CreateAccountButton}
    ${Cr}  Log Location
    Click Button    ${CreateAccountButton}

    Wait Until Element Is Visible    ${AccountCreatedText}
    ${expectedAccountCreatedText}    Set Variable    ACCOUNT CREATED!
    ${ActualAccountCreatedText}    Get Text    ${AccountCreatedText}
    ${ActualAccountCreatedText}    Convert To Upper Case    ${ActualAccountCreatedText}
    Log To Console    ${ActualAccountCreatedText}

    Element Should Contain    ${AccountCreatedText}    ${expectedAccountCreatedText}
    Click Element    ${ContinueButton}


    ${iframe1Statement}    Run Keyword And Return Status    Element Should Be Visible    ad_iframe
    IF    ${iframe1Statement}    Select Frame    ad_iframe

    ${iframe2Statement}    Run Keyword And Return Status    Element Should Be Visible    aswift_1
    IF    ${iframe2Statement}    Select Frame    aswift_1

    ${iframe3Statement}    Run Keyword And Return Status    Element Should Be Visible    ${iframeAd}
    IF    ${iframe3Statement}    Select Frame    ${iframeAd}

    ${iframeAd1Statement}    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    ${dismissButton2}
    IF    ${iframeAd1Statement}
        Click Element    ${dismissButton2}
    END

    ${iframeAd1Statement}    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    ${dismissButton}
    IF    ${iframeAd1Statement}
        Click Element    ${dismissButton}
    END

    Unselect Frame

    set selenium speed    1
    #${ExpectedLoggedInText}    Catenate    Logged in as

    #${ExpectedLoggedInText}    Catenate    ${ExpectedLoggedInText}    ${aa}
    #Log To Console    ${ExpectedLoggedInText}
    ${actualLoggedInText}    Get Text    ${loggedInAsUsername}
    Log To Console    ${actualLoggedInText}
    Element Should Contain    ${loggedInAsUsername}    Logged in as ${Name}

    Click Element    ${viewCart}
    #Execute Javascript    window.scrollTo(0,1200);
    Scroll Element Into View     ${proceedToCheckOut}
    Click Element    ${proceedToCheckOut}
    Scroll Element Into View    ${PlaceOrderButton}

    ${additionalInformation}  Text  200
    Input Text    ${OrderTextArea}  ${additionalInformation}
    Execute Javascript    window.scrollTo(0,1200);

    Click Element    ${PlaceOrderButton}
    ${CardName}  Name
    ${CardNumber}  Credit Card Number
    ${CardCVC}  Credit Card Security Code
    ${CardExpiration}  Credit Card Expire
    Input Text    name=name_on_card    ${CardName}
    Input Text    name=card_number    ${CardNumber}
    Input Text    name=cvc    ${CardCVC}
    Input Text    name=expiry_month    09
    Input Text    name=expiry_year    2030


    Click Element    id=submit
    ${sh}  Get Text    ${PaymentSuccessAleert}
    Log To Console    ${sh}


    ${Succesfull}  Get Text   ${OrderSuccesfull}

    Log To Console  ${Succesfull}
    Element Should Contain    ${OrderSuccesfull}   ${Succesfull}
    Click Element    ${DownloadInvoice}
    Click Element    ${ContinueButton}
    Click Element    ${DeleteAccount}
    ${accountDeleted}  Get Text    ${AccountDeletedText}
    Log To Console     ${accountDeleted}
    Element Should Contain    ${AccountDeletedText}    ACCOUNT DELETED!








