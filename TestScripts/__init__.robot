*** Settings ***
Library     SeleniumLibrary
Resource    ../ProjectConfig/config.robot

Suite Setup         perfrom_setup_operation
Suite Teardown      perfrom_teardown_operation

*** Variables ***


*** Keywords ***
perfrom_setup_operation
    Log    perfroming suite setup
    IF    '${testing_type}' == 'web'
        SeleniumLibrary.Open Browser      ${application_url}            ${browser_type}
        SeleniumLibrary.Maximize Browser Window
        SeleniumLibrary.Set Selenium Implicit Wait    10S
        SeleniumLibrary.Set Selenium Timeout    10S
    END
    IF    '${testing_type}' == 'api'
        Log    perfroming suite setup for api testing
    END

    
perfrom_teardown_operation
    Log    perfroming suite teardown
    IF    '${testing_type}' == 'web'
        SeleniumLibrary.Close All Browsers
    END
    
    