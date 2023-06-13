*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${deposit_btn}    //*[text()="Deposit"]//parent::button
${reset_balance}    //*[text()="Reset Balance"]//parent::button
${dropdown}    dropdown-display
${open_btn}    //a[@href="/"]
${underlying}    //span[@class="ic-icon cq-symbol-dropdown"]
${volatility50}    //div[@class="sc-mcd__item sc-mcd__item--R_50 "]
${tradetab}    //div[@class="contract-type-widget__display"]
${multiplier}    //div[@id="dt_contract_multiplier_item"]
${stake}    //div[@class="trade-container__fieldset-header trade-container__fieldset-header--inline"]
${amount}    //div[@class="dc-input-field trade-container__amount"]
${inputamt}    //input[@id="dt_amount_input"]
${maxError}    //*[contains(text(),"Maximum stake allowed is 2000.0")]
${minError}    //*[contains(text(),"Please enter a stake amount that's at least 1.00")]
${up}    //button[@id="dt_purchase_multup_button"]
${down}    //button[@id="dt_purchase_multdown_button"]
${multioptions}    //span[@class="dc-text dc-dropdown__display-text" and @name="multiplier"]
${multimenu}    //div[@class="dc-list dc-list--left"]
${20}    //div[@id="20"]
${40}    //div[@id="40"]
${60}    //div[@id="60"]
${100}    //div[@id="100"]
${200}    //div[@id="200"]
${durationtab}    //span[@class="dc-text dc-dropdown__display-text" and @name="cancellation_duration"]
${durationmenu}    //div[@class="dc-themed-scrollbars dc-themed-scrollbars__autohide"]
${addbtn}    //button[@id="dt_amount_input_add"]
${minusbtn}    //button[@id="dt_amount_input_sub"]
${dealcancel}    //label[@class="dc-checkbox"]
${dealcancelchk}    //input[@id="dt_cancellation-checkbox_input"]
${takeprofit}    //label[@class="dc-checkbox take_profit-checkbox__input"]
${takeprofitchk}    //input[@id="dc_take_profit-checkbox_input"]
${stoploss}    //label[@class="dc-checkbox stop_loss-checkbox__input"]
${stoplosschk}    //input[@id="dc_stop_loss-checkbox_input"]
${fee}    //span[@class="trade-container__price-info-currency"]



*** Test Cases ***
Open the Browser
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024

Login
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ******
    Input Password    txtPass  ******
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible    ${deposit_btn}    10

Change to Demo Account
    Wait Until Page Contains Element    ${dropdown}    10
    Click Element    ${dropdown}
    Wait Until Element Is Visible   demo    10
    Click Element    demo
    Wait Until Page Contains Element    ${reset_balance}    10 

Open Deriv Trader
    Wait Until Page Contains Element    ${open_btn}    10
    Click Element    ${open_btn}

Choose Underlying
    Wait Until Page Contains Element    ${underlying}    20
    Click Element    ${underlying}
    Wait Until Page Contains Element    ${volatility50}    10
    Wait Until Element Is Visible    ${volatility50}    10
    Click Element    ${volatility50}    
    Wait Until Page Contains Element    ${tradetab}    10

Selecting Multiplier
    Click Element    ${tradetab}
    Wait Until Page Contains Element    ${multiplier}    10
    Click Element    ${multiplier}
    Wait Until Element Is Visible    ${stake}    10
    Page Should Not Contain    Payout

Amount Validation
    Press Keys     ${amount}    CTRL+a+BACKSPACE
    Input Text     ${inputamt}    2001
    Wait Until Element Is Visible    ${maxError}    10
    Page Should Contain Element    ${maxError}
    Element Should Be Disabled    ${up}
    Element Should Be Disabled    ${down}
    Press Keys     ${amount}    CTRL+a+BACKSPACE
    Input Text     ${inputamt}    0
    Wait Until Element Is Visible    ${minError}    10
    Page Should Contain Element    ${minError}
    Element Should Be Disabled    ${up}
    Element Should Be Disabled    ${down}

Multiplier Validation
    Wait Until Element Is Visible    ${multioptions}    10
    Click Element    ${multioptions}
    Wait Until Element Is Visible    ${multimenu}    10
    Page Should Contain Element    ${20}
    Page Should Contain Element    ${40}
    Page Should Contain Element    ${60}
    Page Should Contain Element    ${100}
    Page Should Contain Element    ${200}
    Click Element    ${multioptions}

Duration Vaalidation
    Wait Until Element Is Visible    ${dealcancel}    10
    Click Element    ${dealcancel}
    Wait Until Element Is Visible    ${durationtab}    10
    Click Element    ${durationtab}
    Wait Until Element Is Visible    ${durationmenu}    10
    Element Should Contain    ${durationmenu}    5 minutes    10 minutes    15 minutes
    Element Should Contain    ${durationmenu}    30 minutes    60 minutes
    Click Element    ${durationtab}

Change Amount Validation
    Press Keys     ${amount}    CTRL+a+BACKSPACE
    Input Text    ${inputamt}    10
    ${value}    Get Value    ${inputamt}
    Click Element    ${addbtn}
    Wait Until Element Is Visible    ${inputamt}    10
    ${updatedval}    Get Value    ${inputamt}
    ${expectedval_high}    Evaluate    ${value} + 1
    Should Be True    ${expectedval_high} == ${updatedval}
    ${value}    Get Value    ${inputamt}
    Click Element    ${minusbtn}
    Wait Until Element Is Visible    ${inputamt}    10
    ${updatedval}    Get Value    ${inputamt}
    ${expectedval_low}    Evaluate    ${value} - 1
    Should Be True    ${expectedval_low} == ${updatedval}

Checkbox Validation
    Click Element    ${takeprofit}
    Checkbox Should Be Selected    ${takeprofitchk}
    Checkbox Should Not Be Selected    ${stoplosschk}
    Checkbox Should Not Be Selected    ${dealcancelchk}

    Click Element    ${stoploss}
    Checkbox Should Be Selected    ${takeprofitchk}
    Checkbox Should Be Selected    ${stoplosschk}
    Checkbox Should Not Be Selected    ${dealcancelchk}

    Click Element    ${dealcancel}
    Checkbox Should Not Be Selected    ${takeprofitchk}
    Checkbox Should Not Be Selected    ${stoplosschk}
    Checkbox Should Be Selected    ${dealcancelchk}

    Click Element    ${stoploss}
    Checkbox Should Not Be Selected    ${takeprofitchk}
    Checkbox Should Be Selected    ${stoplosschk}
    Checkbox Should Not Be Selected    ${dealcancelchk}

    Click Element    ${takeprofit}
    Checkbox Should Be Selected    ${takeprofitchk}
    Checkbox Should Be Selected    ${stoplosschk}
    Checkbox Should Not Be Selected    ${dealcancelchk}
    

Deal Cancelation Fee
    Click Element    ${dealcancel}
    Press Keys     ${amount}    CTRL+a+BACKSPACE
    Input Text     ${inputamt}    1
    Wait Until Element Is Visible    ${fee}    10
    ${cancel_fee}    Get Text    ${fee}
    ${cancel_fee}    Set Variable    ${cancel_fee[:-4]}
    Log To Console    ${cancel_fee}
    Press Keys     ${amount}    CTRL+a+BACKSPACE
    Input Text     ${inputamt}    2
    Wait Until Element Is Visible    ${fee}    20
    ${updated_fee}    Get Text    ${fee}
    ${updated_fee}    Set Variable    ${updated_fee[:-4]}
    Log To Console    ${updated_fee}   
    Should Be True    ${updated_fee} > ${cancel_fee}
    
    





        
  

   
    


    
    
   