*** Settings ***
Library    SeleniumLibrary
Variables    ../web_locators/login_page.py

*** Keywords ***
Verify Page Title of Login Page
    Element Text Should Be    ${page_title}    Welcome, Please Sign In!

Input Email To Login
    [Arguments]    ${login_email}
    Input Text    ${email_txt}    ${login_email}

Input Password To Login
    [Arguments]    ${login_pwd}
    Input Text    ${password_txt}    ${login_pwd}

Click Login Button
    Click Button    ${login_btn}

Login With
    [Arguments]    ${login_email}    ${login_pwd}
    Input Email To Login    ${login_email}
    Input Password To Login    ${login_pwd}
    Click Login Button

Verify Error Message When Password Is Incorrect
    Element Text Should Be    ${login_error_msg}    The credentials provided are incorrect