*** Settings ***
Resource  ./Resources/CommonFunctionality.robot
Resource  ./Resources/NewRelicUserDefinedKeywords.robot
Variables  ./Resources/WebElements.py
Test Setup  CommonFunctionality.Start TestCase 
Test Teardown  CommonFunctionality.Finish TestCase

*** Variables ***
${EMAIL}            ****
${PASSWORD}         ****
${API_KEY}          ****
${APPLICATION_KEY}  ****

*** Test Cases ***
Verify that you can enter the APIs
    [Documentation]  Test plan for Dashport
    NewRelicUserDefinedKeywords.Login New Relic  ${EMAIL}  ${PASSWORD} 
    NewRelicUserDefinedKeywords.Open App
    NewRelicUserDefinedKeywords.Verify Open App
    NewRelicUserDefinedKeywords.Select Frame App
    ${Api_On_Page}=  Get Value  ${HomePageSeachInputApiKey}
    Run Keyword If   '${Api_On_Page}' == '0e4bd3....'   NewRelicUserDefinedKeywords.App True Keyword   ${API_KEY}   ${APPLICATION_KEY}   
    ...   ELSE   NewRelicUserDefinedKeywords.App False Keyword   ${API_KEY}   ${APPLICATION_KEY} 
    Sleep  2 seconds  
    Wait Until Element Is Visible   ${HomePageSeachButtonDelete}  timeout=5s   error=Found Button
    NewRelicUserDefinedKeywords.Select Button Fetch
    NewRelicUserDefinedKeywords.Select Menus     
    NewRelicUserDefinedKeywords.Unselect Frame App





