Test Case 23: Verify address details in checkout page
1. Launch browser
2. Navigate to url 'http://automationexercise.com'
3. Verify that home page is visible successfully
4. Click 'Signup / Login' button
5. Fill all details in Signup and create account
6. Verify 'ACCOUNT CREATED!' and click 'Continue' button
7. Verify ' Logged in as username' at top
8. Add products to cart
9. Click 'Cart' button
10. Verify that cart page is displayed
11. Click Proceed To Checkout
12. Verify that the delivery address is same address filled at the time registration of account
13. Verify that the billing address is same address filled at the time registration of account
14. Click 'Delete Account' button
15. Verify 'ACCOUNT DELETED!' and click 'Continue' button
*** Settings ***
Library   SeleniumLibrary
Library    XML
Library    Collections
Library    FakerLibrary
Variables    ..//PageObjects/AutomationExercise.py

*** Variables ***
${url}   https://automationexercise.com/
${browser}   edge


*** Test Cases ***
Test Case 24: Download Invoice after purchase order
    Homepage should be visible
    After adding some products Cart Page should be visible

*** Keywords ***
Homepage should be visible
  Open Browser    ${url}   ${browser}
  Maximize Browser Window
  Set Selenium Speed    2
  ${homeColor}  SeleniumLibrary.Get Element Attribute    ${AutExerHome}    style
  Should Contain    ${homeColor}   orange

After adding some products Cart Page should be visible
  ${addToCartElements}  Get WebElements    ${addToCards}
  ${CartElementsLength}   Get Length    ${addToCartElements}
  ${ClickableCartElements}  Create List

  FOR    ${indexNo}    IN RANGE    0   ${CartElementsLength}    2
  ${eachProductLocator}  Get From List   ${addToCartElements}     ${indexNo}
  Append To List    ${ClickableCartElements}   ${eachProductLocator}
#   ${d}   Get Text     ${c}
#   Log To Console     ${d}
     
       
  END
  Log To Console    ${CartElementsLength}
  ${g}  Get Length    ${ClickableCartElements} 

  ${os}  Create List
  FOR    ${counter}    IN RANGE    0    5    1
  ${randomNumber}  Random Int  1  34
       ${randomProduct}  Get From List    ${ClickableCartElements}    ${randomNumber}
        Click Element    ${randomProduct}
        Click Element    ${continueShopping}
        Append To List    ${os}  ${randomNumber}

  END

#  ${d}  Get From List    ${ClickableCartElements}    15
#  Click Element    ${d}

  Click Element    ${goToCart}
  SeleniumLibrary.Element Text Should Be    ${ShoppingCart}    Shopping Cart
  Log To Console    ${os}

  


