*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${selectedinsurance}            xpath://span[@id='selectedinsurance']
${vehicle_make}                 xpath://select[@id='make']
${vehicle_options}              //option[@value=
${vehicle_engineperformance}    xpath://input[@id='engineperformance']
${vehicle_dateofmanufacture}      xpath://input[@id='dateofmanufacture']
${vehicle_numberofseats}            xpath://select[@id='numberofseats']
${vehicle_fuel}            xpath://select[@id='fuel']
${vehicle_listprice}            xpath://input[@id='listprice']
${vehicle_license_plate}            xpath://input[@id='licenseplatenumber']
${vehicle_annual_milage}            xpath://input[@id='annualmileage']
${vehicle_insurancedata_next}       xpath://button[@id='nextenterinsurantdata']



# Test data
${selectedinsurance_automobile}         Automobile Insurance
${vehicle_make_value}                   BMW
${vehicle_engineperformance_value}      100
${vehicle_dateofmanufacture_value}        11/20/2019
${vehicle_numberofseats_value}           7
${vehicle_fuel_value}                   Petrol
${vehicle_listprice_value}              8000
${vehicle_license_plate_value}          NL-22-JA-2000
${vehicle_annual_milage_value}          20000

*** Keywords ***
verify_select_insurance_type
    [Arguments]     ${vehicle_type}

    IF    "${vehicle_type}" == "Automobile"
        SeleniumLibrary.Wait Until Element Is Visible    ${selectedinsurance}
        ${ret_text}=        Get Text    ${selectedinsurance}
        Should Be Equal As Strings    ${ret_text}    Automobile Insurance
    END


