*** Settings ***
Test Template      Validate Login Functionality


*** Keywords ***
Validate Login Functionality
    [Arguments]      ${username}         ${password}
    Log    ${username}
    Log    ${password}


*** Test Cases ***      test_username           test_password
validate valid usermane and password            Test Troop          Test 123
validate invalid usermane             ${EMPTY}         Test 123
validate invalid password             Test Troop         ${EMPTY}