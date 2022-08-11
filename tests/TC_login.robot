*** Settings ***
Force Tags      Stockbit    Login
Resource        ${EXECDIR}/resources/browser.robot
Resource        ${EXECDIR}/page_objects/login.robot
Resource        ${EXECDIR}/page_objects/common.robot
Resource        ${EXECDIR}/data/login.robot

Suite Teardown      Close All Browsers
Test Setup          Open Chrome

*** Test Cases ***
Verify Successful Login using username valid
    [documentation]     User melakukan login dengan username dan password valid
    [tags]  Positive
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonMasuk}
    Click Element   ${buttonMasuk}
    Wait Until Element Is Visible  ${buttonSubmitLogin}
    Input Text  ${usernameField}  ${usernameValid}
    Input Text  ${passwordField}  ${passwordValid}
    Click Element   ${buttonSubmitLogin}
    Wait Until Element Is Visible  ${profileTab}
    Close Browser

Verify Successful Login using email valid
    [documentation]     User melakukan login dengan email dan password valid
    [tags]  Positive
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonMasuk}
    Click Element   ${buttonMasuk}
    Wait Until Element Is Visible  ${buttonSubmitLogin}
    Input Text  ${usernameField}  ${emailValid}
    Input Text  ${passwordField}  ${passwordValid}
    Click Element   ${buttonSubmitLogin}
    Wait Until Element Is Visible  ${profileTab}
    Close Browser

Verify UnSuccessful Login using wrong password
    [documentation]     User melakukan login dengan password salah
    [tags]  Negative
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonMasuk}
    Click Element   ${buttonMasuk}
    Wait Until Element Is Visible  ${buttonSubmitLogin}
    Input Text  ${usernameField}  ${usernameValid}
    Input Text  ${passwordField}  asd123zxc
    Click Element   ${buttonSubmitLogin}
    Wait Until Page Contains   Username atau password salah. Mohon coba lagi.
    Close Browser

Verify UnSuccessful Login using username not found
    [documentation]     User melakukan login dengan email belum terdatar
    [tags]  Negative
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonMasuk}
    Click Element   ${buttonMasuk}
    Wait Until Element Is Visible  ${buttonSubmitLogin}
    Input Text  ${usernameField}  ${usernameNotFound}
    Input Text  ${passwordField}  ${passwordValid}
    Click Element   ${buttonSubmitLogin}
    Wait Until Page Contains   Username atau password salah. Mohon coba lagi.
    Close Browser

Verify UnSuccessful Login using email not found
    [documentation]     User melakukan login dengan email belum terdatar
    [tags]  Negative
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonMasuk}
    Click Element   ${buttonMasuk}
    Wait Until Element Is Visible  ${buttonSubmitLogin}
    Input Text  ${usernameField}  ${emailNotFound}
    Input Text  ${passwordField}  ${passwordValid}
    Click Element   ${buttonSubmitLogin}
    Wait Until Page Contains   Username atau password salah. Mohon coba lagi.
    Close Browser

Verify UnSuccessful Login using invalid data
    [documentation]     User melakukan login dengan invalid data email
    [tags]  Negative
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonMasuk}
    Click Element   ${buttonMasuk}
    Wait Until Element Is Visible  ${buttonSubmitLogin}
    Input Text  ${usernameField}  ${emailInvalid}
    Input Text  ${passwordField}  ${passwordInvalid}
    Click Element   ${buttonSubmitLogin}
    Wait Until Page Contains   Username atau password salah. Mohon coba lagi.
    Close Browser