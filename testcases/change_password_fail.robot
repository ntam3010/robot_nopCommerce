*** Settings ***
Library    DataDriver    file=../test_data/change_pwd_fail_data.csv
Resource    ../keywords/common_keywords.resource
Resource    ../page_objects/my_account_page.resource
Resource    ../page_objects/change_password_page.resource

Test Template    Invalid change password Scenarios

Suite Setup    Register New User Then Login
Suite Teardown    Close Browser Window

*** Test Cases ***
Verify change password fail with invalid cred    ${testcase_id}  ${old_pwd}  ${new_pwd}  ${confirm_pwd}  
...  ${summary_error_message}  ${old_pwd_error_message}  ${new_pwd_error_message}  ${confirm_pwd_error_message}
*** Keywords ***
Invalid change password Scenarios
    [Arguments]    ${testcase_id}  ${old_pwd}  ${new_pwd}  ${confirm_pwd}  
    ...  ${summary_error_message}  ${old_pwd_error_message}  ${new_pwd_error_message}  ${confirm_pwd_error_message}
    Click On My Account Link
    Click On Change Password Link
    Input Old And New Password Then Click Change Password Button    ${old_pwd}  ${new_pwd}  ${confirm_pwd}
    Run Keyword If    '${testcase_id}' == 'ChangePWD_10'  Run Keywords  
    ...    Verify Error Message Of Old Password    ${old_pwd_error_message}  
    ...    AND    Verify Error Message Of New Password    ${new_pwd_error_message}  
    ...    AND    Verify Error Message Of Confirm New Password    ${confirm_pwd_error_message}  
    ...    ELSE IF    '${testcase_id}' == 'ChangePWD_11'  
    ...    Verify Error Message Of Old Password    ${old_pwd_error_message}  
    ...    ELSE IF    '${testcase_id}' == 'ChangePWD_12'    Run Keywords    
    ...    Click Change Password Button
    ...    AND    Verify Error Message Of New Password    ${new_pwd_error_message}  
    ...    ELSE IF    '${testcase_id}' == 'ChangePWD_13'  
    ...    Verify Error Message Of Confirm New Password    ${confirm_pwd_error_message}  
    ...    ELSE IF    '${testcase_id}' == 'ChangePWD_14'  
    ...    Verify Summary Error Message    ${summary_error_message}  
    ...    ELSE IF    '${testcase_id}' == 'ChangePWD_04'  
    ...    Verify Error Message Of New Password    ${new_pwd_error_message}