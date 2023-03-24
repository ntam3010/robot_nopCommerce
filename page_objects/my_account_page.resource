*** Settings ***
Library    SeleniumLibrary
Variables    ../web_locators/my_account_page.py

*** Keywords ***
Click On Change Password Link
    Click Element    ${change_password_link}