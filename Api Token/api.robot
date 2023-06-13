*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${profile_icon}    //a[@class="trading-hub-header__setting"]
${api_token}    //a[@id="dc_api-token_link"]
${article}    //article[@class="da-article"]
${checkbox}    //label[@class="dc-checkbox"]
${read}    //*[@name="read"]//parent::label
${trade}    //*[@name="trade"]//parent::label
${payments}    //*[@name="payments"]//parent::label
${trading}    //*[@name="trading_information"]//parent::label
${admin}    //*[@name="admin"]//parent::label
${readchk}    //input[@class="dc-checkbox__input" and @name="read"]
${tradechk}    //input[@class="dc-checkbox__input" and @name="trade"]
${paymentschk}    //input[@class="dc-checkbox__input" and @name="payments"]
${tradingchk}    //input[@class="dc-checkbox__input" and @name="trading_information"]
${adminchk}    //input[@class="dc-checkbox__input" and @name="admin"]
${token_name}    //input[@class="dc-input__field"]   
${error}    //div[@class="dc-field dc-field--error"]
${create_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${token_table}    //tr[@class="da-api-token__table-cell-row"]
${scope_blk}    //div[@class="da-api-token__table-scopes-cell-block"]
${blk}    //div[@class="da-api-token__table-scope-cell"]
${delete_icon}    //*[@class="dc-icon dc-clipboard da-api-token__delete-icon"]
${delete_confirmation}    //div[@class="dc-modal"]
${cancel_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large dc-dialog__button"]
${confirm_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]
${copy_icon}    //*[@class="dc-icon dc-clipboard"]
${copy_reminder}    //div[@class="dc-modal__container dc-modal__container--small dc-modal__container--enter-done"]
${ok_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]

*** Test Cases ***
browser
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    

login
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ******
    Input Password    txtPass  ******
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible    ${profile_icon}    10

navigate to api token
    Click Element    ${profile_icon}
    Wait Until Element Is Visible    ${api_token}    10
    Click Element    ${api_token}
    Wait Until Element Is Visible    ${article}    10

validate checkbox can be clicked
    Click Element    ${read}
    Checkbox Should Be Selected    ${readchk}
    Click Element    ${trade}
    Checkbox Should Be Selected    ${tradechk}
    Click Element    ${payments}
    Checkbox Should Be Selected    ${paymentschk}
    Click Element    ${trading}
    Checkbox Should Be Selected    ${tradingchk}
    Click Element    ${admin}
    Checkbox Should Be Selected    ${adminchk}

validate checkbox can be unchecked
    Click Element    ${read}
    Checkbox Should Not Be Selected    ${readchk}
    Click Element    ${trade}
    Checkbox Should Not Be Selected    ${tradechk}
    Click Element    ${payments}
    Checkbox Should Not Be Selected    ${paymentschk}
    Click Element    ${trading}
    Checkbox Should Not Be Selected    ${tradingchk}
    Click Element    ${admin}
    Checkbox Should Not Be Selected    ${adminchk}
  


check token name
    Wait Until Element Is Visible    ${token_name}    10
    Click Element    ${token_name}
    Input Text    ${token_name}    p
    Element Should Contain    ${error}    Length of token name must be between 2 and 32 characters.
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Click Element    ${token_name}
    Input Text    ${token_name}    ==
    Element Should Contain    ${error}    Only letters, numbers, and underscores are allowed.    
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Click Element    ${token_name}
    Input Text    ${token_name}    pavithraravichanderan1234567890124
    Element Should Contain    ${error}    Maximum 32 characters.
    Press Keys    ${token_name}    CTRL+a+BACKSPACE
    Element Should Contain    ${error}    Please enter a token name.


Generate token without admin scope
    Click Element    ${read}
    Checkbox Should Be Selected    ${readchk}
    Click Element    ${payments}
    Checkbox Should Be Selected    ${paymentschk}
    Click Element    ${trading}
    Checkbox Should Be Selected    ${readchk}
    Checkbox Should Be Selected    ${paymentschk}
    Checkbox Should Be Selected    ${tradingchk}
    Checkbox Should Not Be Selected    ${tradechk}
    Checkbox Should Not Be Selected    ${adminchk}
    Wait Until Element Is Visible    ${token_name}    10
    Click Element    ${token_name}
    Input Text    ${token_name}    Token 1
    Wait Until Element Is Visible    ${create_btn}    10
    Element Should Be Enabled    ${create_btn}
    Click Element    ${create_btn}
    Wait Until Element Is Visible    ${token_table}    10
    Wait Until Element Is Visible    ${scope_blk}    10
    Element Should Contain    ${blk}    Read    Payments    Trading information
    Wait Until Element Is Visible    ${copy_icon}    10
    Click Element    ${copy_icon}
    Wait Until Page Contains    Token copied    20
    Page Should Contain    Token copied 
    Wait Until Element Is Visible    ${delete_icon}    10
    Click Element    ${delete_icon} 
    Wait Until Element Is Visible    ${delete_confirmation}    10
    Wait Until Element Is Visible    ${cancel_btn}    10
    Click Element    ${cancel_btn}
    Click Element    ${delete_icon} 
    Wait Until Element Is Visible    ${delete_confirmation}    10
    Wait Until Element Is Visible    ${confirm_btn}    10
    Click Element    ${confirm_btn}


Generate token with admin scope
    Reload Page
    Wait Until Element Is Visible    ${article}    10
    Click Element    ${payments}
    Checkbox Should Be Selected    ${paymentschk}
    Click Element    ${admin}
    Checkbox Should Not Be Selected    ${readchk}
    Checkbox Should Be Selected    ${paymentschk}
    Checkbox Should Be Selected    ${adminchk}
    Checkbox Should Not Be Selected    ${tradechk}
    Checkbox Should Not Be Selected    ${tradingchk}
    Wait Until Element Is Visible    ${token_name}    10
    Click Element    ${token_name}
    Input Text    ${token_name}    Token 2
    Wait Until Element Is Visible    ${create_btn}    10
    Element Should Be Enabled    ${create_btn}
    Click Element    ${create_btn}
    Wait Until Element Is Visible    ${token_table}    10
    Wait Until Element Is Visible    ${scope_blk}    10
    Element Should Contain    ${blk}    Payments    Admin
    Wait Until Element Is Visible    ${copy_icon}    10
    Click Element    ${copy_icon}
    Wait Until Element Is Visible    ${copy_reminder}    10
    Wait Until Element Is Visible    ${ok_btn}    10
    Click Element    ${ok_btn}
    Wait Until Page Contains    Token copied    20
    Page Should Contain    Token copied  
    Wait Until Element Is Visible    ${delete_icon}    10
    Click Element    ${delete_icon} 
    Wait Until Element Is Visible    ${delete_confirmation}    10
    Wait Until Element Is Visible    ${cancel_btn}    10
    Click Element    ${cancel_btn}
    Click Element    ${delete_icon} 
    Wait Until Element Is Visible    ${delete_confirmation}    10
    Wait Until Element Is Visible    ${confirm_btn}    10
    Click Element    ${confirm_btn}
    


    

    