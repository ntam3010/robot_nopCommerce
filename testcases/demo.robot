*** Settings ***
Library    String
Resource    ../browser/browser.resource
Resource    ../keywords/common_keywords.resource

*** Test Cases ***
Test01
    Register New User Then Login
    Sleep    3s