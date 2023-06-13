*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${deposit_btn}    //*[text()="Deposit"]//parent::button
${reset_balance}    //*[text()="Reset Balance"]//parent::button
${dropdown}    dropdown-display
${open_btn}    //a[@href="/"]
${underlying}    //span[@class="ic-icon cq-symbol-dropdown"]
${volatility}    //div[@class="sc-mcd__item sc-mcd__item--1HZ10V " ]
${ticks}    //button[@id="dc_t_toggle_item"]
${slider}    //input[@value="5"]
${stake}    //button[@id="dc_stake_toggle_item"]
${svalue}    //input[@value="10"]
${rise}    //button[@id="dt_purchase_call_button"]
${contract_result}    //a[@class="dc-result__caption-wrapper"]

*** Test Cases ***
contract
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ******
    Input Password    txtPass  ******
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible    ${deposit_btn}    10
    Wait Until Page Contains Element    ${dropdown}    10
    Click Element    ${dropdown}
    Wait Until Element Is Visible   demo    10
    Click Element    demo
    Wait Until Page Contains Element    ${reset_balance}    10 
    Wait Until Page Contains Element    ${open_btn}    10
    Click Element    ${open_btn}
    Wait Until Page Contains Element    ${underlying}    20
    Click Element    ${underlying}
    Wait Until Element Is Visible    ${volatility}    10
    Click Element    ${volatility}
    Wait Until Page Contains Element    ${ticks}    10
    Wait Until Element Is Visible    ${ticks}    10
    Wait Until Element is Visible    ${slider}    10
    # Click Element    ${slider}
    Wait Until Element Is Visible    ${stake}    10
    Wait Until Element Is Visible    ${svalue}    10
    Wait Until Element Is Visible    ${rise}    10
    Click Element    ${rise}
    Wait Until Element Is Visible    ${contract_result}    40
