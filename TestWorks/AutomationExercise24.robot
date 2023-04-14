1. Launch browser
2. Navigate to url 'http://automationexercise.com'
3. Verify that home page is visible successfully
4. Add products to cart
5. Click 'Cart' button
6. Verify that cart page is displayed
7. Click Proceed To Checkout
8. Click 'Register / Login' button
9. Fill all details in Signup and create account
10. Verify 'ACCOUNT CREATED!' and click 'Continue' button
11. Verify ' Logged in as username' at top
12.Click 'Cart' button
13. Click 'Proceed To Checkout' button
14. Verify Address Details and Review Your Order
15. Enter description in comment text area and click 'Place Order'
16. Enter payment details: Name on Card, Card Number, CVC, Expiration date
17. Click 'Pay and Confirm Order' button
18. Verify success message 'Your order has been placed successfully!'
19. Click 'Download Invoice' button and verify invoice is downloaded successfully.
20. Click 'Continue' button
21. Click 'Delete Account' button
22. Verify 'ACCOUNT DELETED!' and click 'Continue' button
*** Settings ***
Library   SeleniumLibrary
Library    XML
Library    Collections
Library    FakerLibrary
Variables    ..//Resource/Locators/AutomationExercise.py

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
  Log To Console    ${homeColor}
  Should Contain    ${homeColor}   orange

After adding some products Cart Page should be visible
  ${addToCartElements}  Get WebElements    ${addToCards}
  ${CartElementsLength}   Get Length    ${addToCartElements}
  ${ClickableCartElements}  Create List
  FOR    ${indexNo}    IN RANGE    0   ${CartElementsLength}    2
  ${eachProduct}  Get From List   ${addToCartElements}     ${indexNo}
  Append To List    ${ClickableCartElements}   ${c}
#   ${d}   Get Text     ${c}
#   Log To Console     ${d}
     
       
  END
  Log To Console    ${CartElementsLength}


  FOR    ${counter}    IN RANGE    0    3    1
  ${e}  Random Number  1  74
       ${d}  Get From List    ${ClickableCartElements}    ${e}
        Click Element    ${d}
        Click Element    ${continueShopping}

  END

#  ${d}  Get From List    ${ClickableCartElements}    15
#  Click Element    ${d}

  Click Element    ${goToCart}
  SeleniumLibrary.Element Text Should Be    ${ShoppingCart}    Shopping Cart

  


