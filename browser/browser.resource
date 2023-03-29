*** Settings ***
Library    SeleniumLibrary
Variables    ../configuration_data.py

*** Keywords ***
Open The Home Page
    Open Browser    ${base_url}    ${selected_browser}
    Maximize Browser Window
    Set Selenium Speed    0.05s

Close Browser Window
    Close Browser

Open The Login Page
    Open Browser    ${base_url}${login_path}    ${selected_browser}
    Maximize Browser Window
    Set Selenium Speed    0.05s

Open The Register Page
    Open Browser    ${base_url}${register_path}    ${selected_browser}
    Maximize Browser Window
    Set Selenium Speed    0.05s