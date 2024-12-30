*** Settings ***
Library     DataDriver      file=${EXECDIR}/TestData/data.xlsx         sheet_name=TestData
Test Template       Validate User Login Via XLS

*** Test Cases ***
testcase validate user login via xls with ${tst_username} password as ${tst_password} and comment as  ${tst_comment}     Default    UserData

*** Keywords ***
Validate User Login Via XLS
    [Arguments]         ${tst_username}     ${tst_password}         ${tst_comment}
    Log    ${tst_username}
    Log    ${tst_password}
    Log    ${tst_comment}


