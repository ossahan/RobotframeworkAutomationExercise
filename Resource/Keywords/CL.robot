*** Settings ***

Resource    P1302_Resources.robot

*** Variables ***
${URL}  https://www.google.com/

*** Test Cases ***
Get Match Info
  launchBrowser   ${URL}  chrome
  
  ${present}  Run Keyword And Return Status    Element Should Be Enabled     xpath=//*[@id='L2AGLb'] 
  Run Keyword If    ${present}    Click Element    xpath=//*[@id='L2AGLb']
  Input Text    q    in which city Champions League final 2023
  Click Element    xpath=(//input[@name='btnK'])[2]
  


  Sleep    60
  