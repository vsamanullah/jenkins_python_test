*** Settings ***
Library     DataDriver      file=${EXECDIR}/TestData/data1.csv
Test Template       Validate User Login

*** Test Cases ***
testcase validate user login with ${tst_username} and password as ${tst_password}       dummy_user      dummy_password

*** Keywords ***
Validate User Login
    [Arguments]         ${tst_username}     ${tst_password}
    Log    ${tst_username}
    Log    ${tst_password}



