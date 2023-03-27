*** Settings ***
Library    SeleniumLibrary
Variables    ../web_locators/header_navigation.py
*** Keywords ***
Verify Log Out Link Appears
    Element Should Be Visible    ${logout_link}

Click On Login Link
    Click Element    ${login_link}

Click On My Account Link
    Click Element    ${myaccount_link}

Click On Logout Link
    Click Element    ${logout_link}