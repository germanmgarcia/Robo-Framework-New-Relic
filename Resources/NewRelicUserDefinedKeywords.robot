*** Settings ***
Library  SeleniumLibrary
Variables  ./WebElements.py

*** Keywords ***
Login New Relic
    [Arguments]  ${EMAIL}  ${PASSWORD}
    Wait Until Element Is Visible   ${HomePageSearchEmail}  timeout=20s   error=Found Email
    Input Text  id:login_email  ${EMAIL}    
    Click Element  id:login_submit
    Wait Until Page Contains Element  ${HomePageSearchPassword}
    Input Text  id:login_password  ${PASSWORD}
    Click Element  id:login_submit

Open App
    Wait Until Element Is Visible   ${HomePageSearchButtonApp}  timeout=20s   error=Found App
    Sleep  2 seconds
    Click Element   ${HomePageSearchButtonApp}
    Wait Until Element Is Visible   ${HomePageSearchApps}  timeout=20s   error=Found Apps
    Sleep  2 seconds
    Click Element   ${HomePageSearchApp}

Verify Open App
    Sleep  2 seconds
    Select Frame App
    Sleep  2 seconds
    Wait Until Page Contains   Datadog API setup  timeout=30s   error=Found Text
    Page Should Contain  Datadog API setup
    Unselect Frame App

Select Frame App
    Select Frame  ${HomePageSeachIframe}

Unselect Frame App
    Unselect Frame  

App True Keyword
    [Arguments]  ${API_KEY}  ${APPLICATION_KEY}
    Log  true
    Click Element  ${HomePageSeachButtonSave}
    Unselect Frame App
    Wait Until Element Is Visible   ${HomePageSeachModal}  timeout=5s   error=Found Modal
    Click Button   ${HomePageSeachModal}
    Select Frame App
    Input Text   ${HomePageSeachInputApiKey}  ${API_KEY}
    Input Text   ${HomePageSeachInputApplicationKey}  ${APPLICATION_KEY}
    Click Element  ${HomePageSeachButtonSave}   

App False Keyword
    [Arguments]  ${API_KEY}  ${APPLICATION_KEY}
    Log  false
    Input Text  ${HomePageSeachInputApiKey}  ${API_KEY}
    Input Text  ${HomePageSeachInputApplicationKey}  ${APPLICATION_KEY}
    Click Element  ${HomePageSeachButtonSave}

Select Button Fetch
    Click Element  ${HomePageSeachButtonFetch}  
    Wait Until Element Is Visible   ${HomePageSeachPageDatadog}  timeout=200s   error=Found Fetch
    Sleep  1 seconds

Select Menus
    Click Element  ${HomePageSeachPageAlerts}
    Sleep  1 seconds 
    Click Element  ${HomePageSeachPageInfrastructure}
    Sleep  1 seconds 
    Click Element  ${HomePageSeachPageLogs}
    Sleep  1 seconds 
    Click Element   ${HomePageSeachPageMetrics}
    Sleep  1 seconds 
    Click Element   ${HomePageSeachPageSynthetics}
    Sleep  1 seconds 
    Click Element   ${HomePageSeachPageAccounts}
    Sleep  1 seconds 
    Click Element  ${HomePageSeachPageMigration}
    Sleep  1 seconds 
    Click Element  ${HomePageSeachPageStatus}
    Sleep  1 seconds 
     
