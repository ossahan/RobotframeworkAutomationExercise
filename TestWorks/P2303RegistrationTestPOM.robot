*** Settings ***
Library  SeleniumLibrary
Library  String
Library  FakerLibrary

Resource   ../Resource/Keywords/P2304RegisterKeywords.robot


*** Variables ***
${Browser}   headlesschrome
${Gender}   F
${firstname}  sican
${lastname}   hasan
${url}   https://demowebshop.tricentis.com/register
${email}  gzertdyekrh@hopkddlk.com
${Password}  hasanfare

*** Test Cases ***
Register Test
   Open my browser    ${url}    ${Browser}
   Mark your gender    ${Gender}
   Enter First Name    ${firstname}
   Enter Last Name    ${lastname}
   Enter Password    ${Password}
   ${fakeEmail}   Free Email
   Enter Email    ${fakeEmail}
  
   Click register Button
   Verify Account Registered
   #Close All Browsers






