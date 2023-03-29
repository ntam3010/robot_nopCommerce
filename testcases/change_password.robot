*** Settings ***
Resource    ../browser/browser.resource
Resource    ../page_objects/header_navigation.resource
Resource    ../page_objects/register_page.resource
Resource    ../page_objects/login_page.resource
Resource    ../page_objects/change_password_page.resource
Resource    ../page_objects/my_account_page.resource
Resource    ../keywords/custom_keywords.resource

Variables    ../test_data/default_account.py

Test Setup    Open The Register Page
Test Teardown    Close Browser Window
*** Test Cases ***
Successfully changed password then re-login
    [Documentation]    
    ...        1. Successfully changed password    
    ...        2. Verify the Change Password Success Message totally disappear
    ...        3. Not able to login with old password
    ...        4. Able to login with new password
    ${register_email}=    Generate Random Email Based On DateTime
    Register New User With Required Data    ${default_firstName}    ${default_lastName}  
    ...    ${register_email}    ${default_pwd}    ${default_pwd}
    Click Continue Button After Registered
    Click On Login Link
    Login With    ${register_email}    ${default_pwd}
    Verify Log Out Link Appears
    Click On My Account Link
    Click On Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${default_pwd}    ${changed_pwd_01}    ${changed_pwd_01}
    Verify Change Password Success Message
    Close Change Password Success Message
    # The message disappears slowly after clicking on the X button
    Wait Until Keyword Succeeds    5s    0.5s    Verify Change Password Success Message Disappear
    Click On Logout Link
    Click On Login Link
    Login With    ${register_email}    ${default_pwd}
    Verify Error Message When Password Is Incorrect
    Login With    ${register_email}    ${changed_pwd_01}
    Verify Log Out Link Appears

Unable to change password twice in a row
    [Documentation]    User is redirected to Login page when trying to change password twice in a row
    ${register_email}=    Generate Random Email Based On DateTime
    Register New User With Required Data    ${default_firstName}    ${default_lastName}  
    ...    ${register_email}    ${default_pwd}    ${default_pwd}
    Click Continue Button After Registered
    Click On Login Link
    Login With    ${register_email}    ${default_pwd}
    Verify Log Out Link Appears
    Click On My Account Link
    Click On Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${default_pwd}    ${changed_pwd_01}    ${changed_pwd_01}
    Verify Change Password Success Message
    Input Old And New Password Then Click Change Password Button  
    ...    ${changed_pwd_01}    ${changed_pwd_02}    ${changed_pwd_02}
    Verify Page Title of Login Page

Unable to change back password to the recent used
    ${register_email}=    Generate Random Email Based On DateTime
    Register New User With Required Data    ${default_firstName}    ${default_lastName}  
    ...    ${register_email}    ${default_pwd}    ${default_pwd}
    Click Continue Button After Registered
    Click On Login Link
    Login With    ${register_email}    ${default_pwd}
    Verify Log Out Link Appears
    Click On My Account Link
    Click On Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${default_pwd}    ${changed_pwd_01}    ${changed_pwd_01}
    Verify Change Password Success Message
    Close Change Password Success Message
    # The message disappears slowly after clicking on the X button
    Wait Until Keyword Succeeds    5s    0.5s    Verify Change Password Success Message Disappear
    Click On Logout Link
    Click On Login Link
    Login With    ${register_email}    ${changed_pwd_01}
    Click On My Account Link
    Click On Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${changed_pwd_01}    ${default_pwd}    ${default_pwd}
    Verify Error If Password Is Recent Used