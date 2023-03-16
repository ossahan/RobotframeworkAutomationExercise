*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
LoginTC
    open browser    https://secure.login.gov/    edge
    maximize browser window
    input text    id:user_email    osmosahanen@heti.fr
    input text    name:user[password]    hop12345
#    capture element screenshot    id:new_user    C:/development/robot-scripts/Automation/results/loginBox.jpg    #slash isareti normalde test geliyor copy yapiyorsak burada duzeltmemiz gerekiyor
#    capture page screenshot     C:/development/robot-scripts/Automation/results/Page.jpg

#We can write also only file name which we want to give and its extension like logo.png or logo.jpg. ==>>
#When you do it this way, the photo will be automatically saved in the project.
    capture element screenshot    id:new_user    loginBox.jpg    #slash isareti normalde ters geliyor copy yapiyorsak burada duzeltmemiz gerekiyor
    capture page screenshot     Page.jpg
    close browser