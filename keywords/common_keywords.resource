*** Settings ***
Library    String
Resource    ../browser/browser.resource
Resource    ../page_objects/register_page.resource
Resource    ../page_objects/login_page.resource
Resource    ../page_objects/header_navigation.resource

*** Keywords ***
Generate Random Email Address
    ${random_str}=    Generate Random String    8    [LOWER]
    ${random_email}=    Catenate     SEPARATOR=    ${random_str}    @mailinator.com
    RETURN    ${random_email}

Register New User Then Login
    Open The Register Page
    ${register_email}=    Generate Random Email Address
    Register New User With Required Data    ${default_firstName}    ${default_lastName}  
    ...    ${register_email}    ${default_pwd}    ${default_pwd}
    Click On Login Link
    Login With    ${register_email}    ${default_pwd}