*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
select_an_item_in_list
    [Arguments]         ${Item_Value}     ${Parent_Loc}       ${Child}

    SeleniumLibrary.Wait Until Element Is Visible    ${Parent_Loc}
    SeleniumLibrary.Click Element    ${Parent_Loc}

    #//option[@value='BMW']
    ${new_locator}=     Catenate      SEPARATOR=         ${Child}        '      ${Item_Value}       ']
    SeleniumLibrary.Click Element       ${new_locator}

clear_text_box_and_input_text
    [Arguments]         ${Item_Value}     ${Input_Locator}

     SeleniumLibrary.Wait Until Element Is Visible          ${Input_Locator}
     SeleniumLibrary.Input Text    ${Input_Locator}      ${Item_Value}      clear=True
     
submit_the_form
    [Arguments]         ${Submit_Locator}    
    SeleniumLibrary.Wait Until Element Is Visible          ${Submit_Locator}
    SeleniumLibrary.Click Element    ${Submit_Locator}
    
capture_screen_shot
    Set Screenshot Directory    ${OUTPUT_DIR}${/}Screenshot
    SeleniumLibrary.Capture Page Screenshot


