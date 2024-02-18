*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:9083

*** Keywords ***

Get Plus JSON
    [Arguments]    ${num1}    ${num2}
    ${resp}=     GET    ${BASE_URL}/plus/${num1}/${num2}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}

*** Test Cases ***


Test Plus Numbers 4 and 2 (Before Using Keywords)

    ${resp}=     GET    ${BASE_URL}/plus/4/2

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable  ${resp.json()}

    ${expected_result}=    Evaluate    {'result': 6}

    Should Be Equal    ${json_resp}    ${expected_result}
Test Plus Numbers 5 and 6 (Before Using Keywords)

    ${resp}=     GET    ${BASE_URL}/plus/-5/-6

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable  ${resp.json()}

    ${expected_result}=    Evaluate    {'result': -11}

    Should Be Equal    ${json_resp}    ${expected_result}

Test Plus Numbers 10000000 and 15000000 (Before Using Keywords)

    ${resp}=     GET    ${BASE_URL}/plus/10000000/15000000

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable  ${resp.json()}

    ${expected_result}=    Evaluate    {'result': 25000000}

    Should Be Equal    ${json_resp}    ${expected_result}