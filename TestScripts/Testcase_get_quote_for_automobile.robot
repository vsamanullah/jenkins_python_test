*** Settings ***
Test Setup          perfrom_test_setup
Test Teardown       perfrom_test_teardown

Resource    ../BusinessLogic/home_page.robot
Resource    ../BusinessLogic/enter_vehicle_data.robot
Resource    ../TestData/basic_data.robot
Resource    ../Utilities/basic_web_operation.robot

*** Keywords ***
perfrom_test_setup
    ${log_message}=         Catenate        SEPARATOR=             executing the test case       ${SPACE}        ${TEST_NAME}
    Log     ${log_message}

perfrom_test_teardown
    ${log_message}=         Catenate        SEPARATOR=             test execution for the test       ${SPACE}        ${TEST_NAME}    ${SPACE}  is completed
    Log     ${log_message}

*** Test Cases ***
get_quote_for_automobile
    select_vericle_type_from_home_page      ${vericle_type_automobile_value}
    verify_select_insurance_type            ${vericle_type_automobile_value}
    select_an_item_in_list          ${vehicle_make_value}           ${vehicle_make}         ${vehicle_options}
    clear_text_box_and_input_text       ${vehicle_engineperformance_value}          ${vehicle_engineperformance}
    clear_text_box_and_input_text       ${vehicle_dateofmanufacture_value}      ${vehicle_dateofmanufacture}
    select_an_item_in_list          ${vehicle_numberofseats_value}           ${vehicle_numberofseats}         ${vehicle_options}
    select_an_item_in_list          ${vehicle_fuel_value}          ${vehicle_fuel}         ${vehicle_options}
    clear_text_box_and_input_text       ${vehicle_listprice_value}          ${vehicle_listprice}
    clear_text_box_and_input_text       ${vehicle_license_plate_value}          ${vehicle_license_plate}
    clear_text_box_and_input_text       ${vehicle_annual_milage_value}          ${vehicle_annual_milage}
    capture_screen_shot
    submit_the_form         ${vehicle_insurancedata_next}






