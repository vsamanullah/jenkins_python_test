*** Settings ***
Library     XML
Library     RequestsLibrary
Resource        ../TestData/basic_data.robot


*** Variables ***
${base_url}        http://www.dneonline.com/
${E_SubtractResult}      7

*** Test Cases ***
Validate_Subtract_Soap_Service
    ${request_xml_ob}=      XML.Parse Xml    ${Subtract_Request}
    ${request_xml_str}=     XML.Element To String    ${request_xml_ob}
    
    RequestsLibrary.Create Session    soap_subtract    ${base_url}

    ${hearder_val}=     Create Dictionary      Content-Type=text/xml; charset=utf-8         SOAPAction=http://tempuri.org/Subtract

    ${response_object}=     RequestsLibrary.POST On Session     soap_subtract       /calculator.asmx    
                            ...     headers=${hearder_val}          data=${request_xml_str}

    Log    ${response_object.status_code}
    Log    ${response_object.content}

    ${A_SubtractResult}=      XML.Get Element Text   ${response_object.content}     .//SubtractResult
    Should Be Equal As Numbers    ${E_SubtractResult}    ${A_SubtractResult}












