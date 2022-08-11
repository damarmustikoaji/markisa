*** Settings ***
Force Tags      Stockbit    Register
Resource        ${EXECDIR}/resources/browser.robot
Resource        ${EXECDIR}/page_objects/common.robot
Resource        ${EXECDIR}/page_objects/register.robot
Resource        ${EXECDIR}/data/register.robot

Suite Teardown      Close All Browsers
Test Setup          Open Chrome

*** Test Cases ***
Verify Successful Register on Valid Data
    [documentation]     User melakukan register dengan valid data
    [tags]  Positive
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonRegister}
    Click Element   ${buttonRegister}
    Wait Until Element Is Visible  ${buttonRegisterWithEmail}
    Click Element   ${buttonRegisterWithEmail}
    Wait Until Element Is Visible  ${buttonSubmitRegister}
    Input Text      ${fullnameField}            ${fullnameValid}
    Input Text      ${emailField}               ${emailValid}
    Input Text      ${usernameField}            ${usernameValid}
    Input Text      ${passwordField}            ${passwordValid}
    Input Text      ${passwordConfirmField}     ${passwordValid}
    Sleep           1
    Click Element   ${buttonSubmitRegister}
    Wait Until Element Is Visible  ${buttonSendCode}
    Close Browser

Verify UnSuccessful Register on Email Format
    [documentation]     User melakukan register dengan invalid format email
    [tags]  Negative
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonRegister}
    Click Element   ${buttonRegister}
    Wait Until Element Is Visible  ${buttonRegisterWithEmail}
    Click Element   ${buttonRegisterWithEmail}
    Wait Until Element Is Visible  ${buttonSubmitRegister}
    Input Text      ${fullnameField}       ${fullnameValid}
    Input Text      ${emailField}       asd.123
    Input Text      ${usernameField}       ${usernameValid}
    Input Text      ${passwordField}       ${passwordValid}
    Input Text      ${passwordConfirmField}       ${passwordValid}
    Sleep           1
    Click Element   ${buttonSubmitRegister}
    Wait Until Page Contains   Format email salah
    Close Browser

Verify UnSuccessful Register on Username Already Exist
    [documentation]     User melakukan register dengan username tidak tersedia
    [tags]  Negative
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonRegister}
    Click Element   ${buttonRegister}
    Wait Until Element Is Visible  ${buttonRegisterWithEmail}
    Click Element   ${buttonRegisterWithEmail}
    Wait Until Element Is Visible  ${buttonSubmitRegister}
    Input Text      ${fullnameField}       ${fullnameValid}
    Input Text      ${emailField}       ${emailValid}
    Input Text      ${usernameField}       ${usernameAlreadyExist}
    Input Text      ${passwordField}       ${passwordValid}
    Input Text      ${passwordConfirmField}       ${passwordValid}
    Sleep           1
    Click Element   ${buttonSubmitRegister}
    Wait Until Page Contains   username tidak tersedia
    Close Browser

Verify UnSuccessful Register on Username Minimal Characters
    [documentation]     User melakukan register dengan username minimal karakter
    [tags]  Negative
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonRegister}
    Click Element   ${buttonRegister}
    Wait Until Element Is Visible  ${buttonRegisterWithEmail}
    Click Element   ${buttonRegisterWithEmail}
    Wait Until Element Is Visible  ${buttonSubmitRegister}
    Input Text      ${fullnameField}       ${fullnameValid}
    Input Text      ${emailField}       ${emailValid}
    Input Text      ${usernameField}       asd
    Input Text      ${passwordField}       ${passwordValid}
    Input Text      ${passwordConfirmField}       ${passwordValid}
    Sleep           1
    Click Element   ${buttonSubmitRegister}
    Wait Until Page Contains   value harus terdiri dari minimal 4 karakter
    Close Browser

Verify UnSuccessful Register on Confirm Password
    [documentation]     User melakukan register dengan confirm password tidak match
    [tags]  Negative
    Go To    ${url}
    Wait Until Element Is Visible  ${buttonRegister}
    Click Element   ${buttonRegister}
    Wait Until Element Is Visible  ${buttonRegisterWithEmail}
    Click Element   ${buttonRegisterWithEmail}
    Wait Until Element Is Visible  ${buttonSubmitRegister}
    Input Text      ${fullnameField}       ${fullnameValid}
    Input Text      ${emailField}       ${emailValid}
    Input Text      ${usernameField}       ${usernameValid}
    Input Text      ${passwordField}       ${passwordValid}
    Input Text      ${passwordConfirmField}       markisa12345766
    Sleep           1
    Click Element   ${buttonSubmitRegister}
    Wait Until Page Contains   Password dan Confirm Password tidak cocok
    Close Browser
