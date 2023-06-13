*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${deposit_btn}    //*[text()="Deposit"]//parent::button
${reset_balance}    //*[text()="Reset Balance"]//parent::button
${dropdown}    dropdown-display
${open_btn}    //a[@href="/"]
${underlying}    //span[@class="ic-icon cq-symbol-dropdown"]
${forex}    //span[@class="ic-icon ic-forex"]
${aud/usd}    //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
${tradetype}    //div[@id="dt_contract_dropdown"]
${high/low}    //div[@id="dt_contract_high_low_item"]
${duration}    //button[@id="dc_duration_toggle_item"]
${datetab}    //div[@class="dc-input dc-datepicker__input dc-datepicker__input--has-leading-icon"]
${payout}    //button[@id="dc_payout_toggle_item"]
${barrier}    //input[@id="dt_barrier_1_input"]
${moneytab}    //input[@id="dt_amount_input"]
${lower}    //button[@id="dt_purchase_put_button"]
${barrierError}    //*[contains(text(),"Contracts more than 24 hours in duration would need an absolute barrier")]


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
    Wait Until Element Is Visible    ${forex}    10
    Click Element    ${forex}
    Wait Until Page Contains Element    ${aud/usd}    10
    Click Element    ${aud/usd}
    Wait Until Element Is Visible    ${tradetype}    10
    Click Element    ${tradetype}
    Wait Until Element Is Visible    ${high/low}    10
    Click Element    ${high/low}
    Wait Until Element Is Visible    ${duration}    10
    Click Element    ${duration}
    Wait Until Element Is Visible    ${datetab}    10
    Click Element    ${datetab}
    Press Keys     ${datetab}    CTRL+a+BACKSPACE
    Press Keys     ${datetab}    2
    Wait Until Element Is Visible    ${payout}    10
    Click Element    ${payout}
    Press Keys     ${moneytab}    CTRL+a+BACKSPACE
    Input Text     ${moneytab}    10    
     Wait Until Element Is Visible    ${barrier}    10
    Press Keys     ${barrier}    CTRL+a+BACKSPACE
    Input Text     ${barrier}    -0.2   
    Wait Until Page Contains Element    ${barrierError}    10
    Wait Until Element Is Visible    ${lower}    10
    Element Should Be Disabled    ${lower}
    
    
