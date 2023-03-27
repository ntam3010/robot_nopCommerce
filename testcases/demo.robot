*** Settings ***
Library    String
Library    DateTime
Resource    ../browser/browser.resource
Resource    ../keywords/common_keywords.resource

*** Test Cases ***
Test01
    ${current_date}=    Get Current Date

    ${current_date2}=    Convert Date    ${current_date}    epoch

    Log To Console    ---------- ${current_date} -----------
    Log To Console    ---------- ${current_date2} -----------


    Sleep    3s