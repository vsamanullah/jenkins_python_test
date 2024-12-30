*** Settings ***
Library               RequestsLibrary
Library               OperatingSystem
Library    Collections
Resource              ../TestData/basic_data.robot

*** Variables ***
${base_url}         https://reqres.in

*** Test Cases ***
Validate_get_user_details
    RequestsLibrary.Create Session    reres_session    ${base_url}		verify=False
    ${header_val}=   Create Dictionary      Content-Type=application/json
    ${get_response}=     RequestsLibrary.GET On Session         reres_session           /api/users/2        headers=${header_val}
    RequestsLibrary.Status Should Be    200

    Log    ${get_response.status_code}
    Log    ${get_response.reason}
    Log    ${get_response.text}
    Log    ${get_response.json()}
    
    #------------------------------------
    #Should Be Equal As Numbers    ${get_response.json()}[data][id]    2
    #Should Be Equal As Strings    ${get_response.json()}[data][email]    janet.weaver@reqres.in
    
    ${json_file_path}=      Catenate        SEPARATOR=      ${EXECDIR}/${userdata_2_json_file_name}
    ${json_file_content}=      OperatingSystem.Get File    ${json_file_path}
    ${json_file_content_json}=           Evaluate     json.loads('''${json_file_content}''')    json
    Log    ${json_file_content_json}
    Dictionaries Should Be Equal    ${get_response.json()}[data]     ${json_file_content_json}[data]



Validate_create_user
    RequestsLibrary.Create Session    reqes_create_session    ${base_url}		verify=False
    ${header_val}=   Create Dictionary      Content-Type=application/json

    #--------------  Read json body -----------------------------
    ${json_file_path}=      Catenate        SEPARATOR=      ${EXECDIR}/${Create_User_Request_File}
    ${json_file_content}=      OperatingSystem.Get File    ${json_file_path}
    ${json_file_content_body}=           Evaluate     json.loads('''${json_file_content}''')    json
    #------------------------------------------------------    
    ${response_obj}=     RequestsLibrary.POST On Session        reqes_create_session           /api/users        headers=${header_val}      json=${json_file_content_body}
    RequestsLibrary.Status Should Be    201
    Should Be Equal As Strings    ${response_obj.reason}     Created

    ${actual_response}=    Set Variable         ${response_obj.json()}
    Dictionary Should Contain Key    ${actual_response}    id
    Dictionary Should Contain Key    ${actual_response}    createdAt


    Remove From Dictionary    ${actual_response}        id
    Remove From Dictionary    ${actual_response}        createdAt
    #------------------------------------------------------   
    ${json_file_path}=      Catenate        SEPARATOR=      ${EXECDIR}/${Create_User_Response_File}
    ${json_file_content}=      OperatingSystem.Get File    ${json_file_path}
    ${expexted_response}=           Evaluate     json.loads('''${json_file_content}''')    json
    #-------------------------------------------------
    Dictionaries Should Be Equal    ${actual_response}          ${expexted_response}


Validate_update_user
    RequestsLibrary.Create Session    reqes_create_session    ${base_url}		verify=False
    ${header_val}=   Create Dictionary      Content-Type=application/json

    #--------------  Read json body -----------------------------
    ${json_file_path}=      Catenate        SEPARATOR=      ${EXECDIR}/${Update_User_Request_File}
    ${json_file_content}=      OperatingSystem.Get File    ${json_file_path}
    ${json_file_content_body}=           Evaluate     json.loads('''${json_file_content}''')    json
    #------------------------------------------------------
    ${response_obj}=     RequestsLibrary.PUT On Session        reqes_create_session           /api/users/2        headers=${header_val}      json=${json_file_content_body}
    RequestsLibrary.Status Should Be    200
    Should Be Equal As Strings    ${response_obj.reason}     OK

    ${actual_response}=    Set Variable         ${response_obj.json()}
    Dictionary Should Contain Key    ${actual_response}    updatedAt


    Remove From Dictionary    ${actual_response}        updatedAt
    #------------------------------------------------------
    ${json_file_path}=      Catenate        SEPARATOR=      ${EXECDIR}/${Update_User_Response_File}
    ${json_file_content}=      OperatingSystem.Get File    ${json_file_path}
    ${expexted_response}=           Evaluate     json.loads('''${json_file_content}''')    json
    #-------------------------------------------------
    Dictionaries Should Be Equal    ${actual_response}          ${expexted_response}



Validate_update_user_partially
    RequestsLibrary.Create Session    reqes_create_session    ${base_url}		verify=False
    ${header_val}=   Create Dictionary      Content-Type=application/json

    #--------------  Read json body -----------------------------
    ${json_file_path}=      Catenate        SEPARATOR=      ${EXECDIR}/${UpdateP_User_Request_File}
    ${json_file_content}=      OperatingSystem.Get File    ${json_file_path}
    ${json_file_content_body}=           Evaluate     json.loads('''${json_file_content}''')    json
    #------------------------------------------------------
    ${response_obj}=     RequestsLibrary.PATCH On Session        reqes_create_session           /api/users/2        headers=${header_val}      json=${json_file_content_body}
    RequestsLibrary.Status Should Be    200
    Should Be Equal As Strings    ${response_obj.reason}     OK

    ${actual_response}=    Set Variable         ${response_obj.json()}
    Dictionary Should Contain Key    ${actual_response}    updatedAt


    Remove From Dictionary    ${actual_response}        updatedAt
    #------------------------------------------------------
    ${json_file_path}=      Catenate        SEPARATOR=      ${EXECDIR}/${UpdateP_User_Response_File}
    ${json_file_content}=      OperatingSystem.Get File    ${json_file_path}
    ${expexted_response}=           Evaluate     json.loads('''${json_file_content}''')    json
    #-------------------------------------------------
    Dictionaries Should Be Equal    ${actual_response}          ${expexted_response}


    
Validate_delete_user
    RequestsLibrary.Create Session    delete_session    ${base_url}		verify=False
    ${header_val}=   Create Dictionary      Content-Type=application/json
    ${response_object}=     RequestsLibrary.DELETE On Session         delete_session           /api/users/2        headers=${header_val}
    RequestsLibrary.Status Should Be    204

    Log    ${response_object.status_code}
    Log    ${response_object.reason}
    Log    ${response_object.text}


Validate_heard_operation
    RequestsLibrary.Create Session    head_session    ${base_url}		verify=False
    ${header_val}=   Create Dictionary      Content-Type=application/json
    ${response_object}=     RequestsLibrary.HEAD On Session        head_session           /api/users/2        headers=${header_val}
    RequestsLibrary.Status Should Be    200

    Log    ${response_object.status_code}
    Log    ${response_object.reason}
    Log    ${response_object.headers}

Validate_Basic_Auth
    RequestsLibrary.Create Session    get_session    https://postman-echo.com		verify=False

    ${username}=    Set Variable    postman
    ${password}=    Set Variable    password
    ${credentials}=      Set Variable    ${username}:${password}
    ${Base64Encoded}=    Evaluate    str(base64.b64encode('${credentials}'.encode('utf-8')), 'utf-8')    modules=base64

    ${header_val}=   Create Dictionary      Content-Type=application/json       Authorization=Basic ${Base64Encoded}
    ${response_object}=     RequestsLibrary.GET On Session        get_session           /basic-auth      headers=${header_val}
    RequestsLibrary.Status Should Be    200

    Log    ${response_object.json()}














