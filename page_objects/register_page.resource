*** Settings ***
Library    SeleniumLibrary
Variables    ../web_locators/register_page.py

*** Keywords ***
Verify Page Title Of Register Page
    Element Text Should Be    ${page_title}    Register

Input First Name
    [Arguments]    ${first_name_value}
    Input Text    ${firstName_txt}    ${first_name_value}

Input Last Name
    [Arguments]    ${last_name_value}
    Input Text    ${lastName_txt}    ${last_name_value}

Input Email
    [Arguments]    ${email_value}
    Input Text    ${email_txt}    ${email_value}

Input Password Value
    [Arguments]    ${pwd_value}
    Input Password    ${pwd_txt}    ${pwd_value}

Input Confirm Password Value
    [Arguments]    ${confirm_pwd}
    Input Password    ${confirm_pwd_txt}    ${confirm_pwd}

Click Register Button
    Click Button    ${register_btn}

Verify Successful Registration
    Element Should Be Visible    ${register_complete_msg}

Click Continue Button After Registered
    Click Element    ${register_continue_btn}

Register New User With Required Data
    [Arguments]    ${first_name_value}  ${last_name_value}  ${email_value}  ${pwd_value}  ${confirm_pwd}
    Input First Name    ${first_name_value}
    Input Last Name    ${last_name_value}
    Input Email    ${email_value}
    Input Password Value    ${pwd_value}
    Input Confirm Password Value    ${confirm_pwd}
    Click Register Button