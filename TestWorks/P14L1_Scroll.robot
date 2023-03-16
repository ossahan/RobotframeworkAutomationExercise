*** Settings ***
Library      SeleniumLibrary

*** Test Cases ***
ScrollingTest
        open browser    https://en.wikipedia.org/wiki/Finland    edge
        maximize browser window
        set selenium speed      1
        execute javascript      window.scrollTo(0,3500)

        # we define the horizontal value with first argument (like 0) if page can move to right-left==>>
        # we define the vertical value with second argument (like 3500) if page can move to up-down==>>


        scroll element into view    xpath://*[@id="mw-content-text"]/div[1]/div[64]/div/div[1]/div/div[1]/a/img     #we can move  until what we want to view
        execute javascript     window.scrollTo(0,document.body.scrollHeight)    #this script takes us to the end of the page

        close browser
