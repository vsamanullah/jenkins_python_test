*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${vehivle_type_automobile}          id:nav_automobile
${vehivle_type_truck}               id:nav_truck

*** Keywords ***
select_vericle_type_from_home_page
    [Arguments]     ${vehicle_type}
    
    IF    "${vehicle_type}" == "Automobile"
          SeleniumLibrary.Wait Until Element Is Visible    ${vehivle_type_automobile} 
          SeleniumLibrary.Click Element    ${vehivle_type_automobile}
    END
    IF    "${vehicle_type}" == "Truck"
          SeleniumLibrary.Wait Until Element Is Visible    ${vehivle_type_truck}
          SeleniumLibrary.Click Element    ${vehivle_type_truck}
    END

