*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PAGE}  https://login.newrelic.com/login

*** Keywords ***
Start TestCase
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage  #disable page crash of chrome
    Call Method    ${chrome_options}    add_argument    --no-sandbox  #disable sandbox mode
    Call Method    ${chrome_options}    add_argument    --headless  #run with no web browser
    Create Webdriver    driver_name=Chrome    alias=google    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    Set Window Size    1200    1000  #run on docker can't use Maximize Browser Window
    Go To    ${PAGE}
    Wait Until Page Contains   Log in to your account   10s

Finish TestCase
    Sleep  5 seconds
    Close browser 

