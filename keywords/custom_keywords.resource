*** Settings ***
Library    String
Library    DateTime
Resource    ../browser/browser.resource
Resource    ../page_objects/register_page.resource
Resource    ../page_objects/login_page.resource
Resource    ../page_objects/header_navigation.resource
Variables    ../test_data/default_account.py

*** Keywords ***
# Generate Random Email Address
#     ${random_str}=    Generate Random String    8    [LOWER]
#     ${random_email}=    Catenate     SEPARATOR=    ${random_str}    @mailinator.com
#     RETURN    ${random_email}

Generate Random Email Based On DateTime
    ${current_time}=    Get Current Date
    ${conver_time}=    Convert Date    ${current_time}    epoch
    Log To Console    ${conver_time}
    ${random_email}=    Catenate    SEPARATOR=    ${conver_time}    @mailinator.com
    RETURN    ${random_email}

Register New User Then Login
    Open The Register Page
    ${register_email}=    Generate Random Email Based On DateTime
    Register New User With Required Data    ${default_firstName}    ${default_lastName}  
    ...    ${register_email}    ${default_pwd}    ${default_pwd}
    Click Continue Button After Registered
    Wait Until Element Is Enabled    ${login_link}
    Click On Login Link
    Login With    ${register_email}    ${default_pwd}