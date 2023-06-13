*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${deposit_btn}    //*[text()="Deposit"]//parent::button
${reset_balance}    //*[text()="Reset Balance"]//parent::button
${dropdown}    dropdown-display


*** Test Cases ***
account
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ************
    Input Password    txtPass  **********
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible    ${deposit_btn}    10
    Wait Until Page Contains Element    ${dropdown}    10
    Click Element    ${dropdown}
    Wait Until Element Is Visible   demo    10
    Click Element    demo
    Wait Until Element is Visible    ${reset_balance}    10 
    