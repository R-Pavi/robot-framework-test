*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${profile_icon}    //a[@class="trading-hub-header__setting"]
${account_closing}    //div[@id="/account/closing-account"]
${closeacc_btn}    //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
${financial}    //*[@name="financial-priorities"]//parent::label
${financial_chk}    //input[@class="dc-checkbox__input" and @name="financial-priorities"]
${stoptrading}    //*[@name="stop-trading"]//parent::label
${stoptrading_chk}    //input[@class="dc-checkbox__input" and @name="stop-trading"]
${notinterested}    //*[@name="not-interested"]//parent::label
${notinterested_chk}    //input[@class="dc-checkbox__input" and @name="not-interested"]
${anotherweb}    //*[@name="another-website"]//parent::label
${anotherweb_chk}    //input[@class="dc-checkbox__input" and @name="another-website"]
${notfriendly}    //*[@name="not-user-friendly"]//parent::label
${notfriendly_chk}    //input[@class="dc-checkbox__input" and @name="not-user-friendly"]
${difficult}    //*[@name="difficult-transactions"]//parent::label
${difficult_chk}    //input[@class="dc-checkbox__input" and @name="difficult-transactions"]
${lackfeature}    //*[@name="lack-of-features"]//parent::label
${lackfeature_chk}    //input[@class="dc-checkbox__input" and @name="lack-of-features"]
${unsatisfy}    //*[@name="unsatisfactory-service"]//parent::label
${unsatisfy_chk}    //input[@class="dc-checkbox__input" and @name="unsatisfactory-service"]
${other}    //*[@name="other-reasons"]//parent::label
${other_chk}    //input[@class="dc-checkbox__input" and @name="other-reasons"]
${continue_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${error_msg}    //p[@class="dc-text closing-account-reasons__error"]
${trading_platform_imp}    //textarea[@name="other_trading_platforms"]
${improve_imp}    //textarea[@name="do_to_improve"]
${warning}    //div[@class="account-closure-warning-modal"]
${close_btn}    //*[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]//button[2]
${goback_btn}    //*[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]//button[1]
${closing_msg}    //p[@class="dc-text account-closed"]
${deriv_login}    //button[@id="dm-nav-login-button"]
${start_btn}    //button[@id="btnGrant"]
${prof_icn}    //a[@class="account-settings-toggle"]
${close_title}    //p[@class="dc-text closing-account-reasons__title"]
${bck_btn}    //div[@class="dc-form-submit-button dc-form-submit-button--relative"]//button[1]
${cancel_btn}    //div[@class="closing-account__buttons-container"]//button[1]

*** Test Cases ***
browser
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    
    

login
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    pavithra@besquare.com.my
    Input Password    txtPass  291299Pavi
    Click Element    //button[@name="login"]
   

navigate to account closing
    Wait Until Element Is Visible    ${profile_icon}    10
    Click Element    ${profile_icon}
    Wait Until Element Is Visible    ${account_closing}    10
    Click Element    ${account_closing}
    Wait Until Page Contains    Are you sure?    10
    Reload Page
    Wait Until Element Is Visible    ${closeacc_btn}    10
    Click Element    ${closeacc_btn}
    Wait Until Element Is Visible    ${close_title}    10

Checkbox validation click 1 checkbox
    Wait Until Element Is Visible    ${continue_btn}    10
    Element Should Be Disabled    ${continue_btn}
    Wait Until Element Is Visible    ${financial}    15
    Click Element    ${financial}
    Checkbox Should Be Selected    ${financial_chk}
    Checkbox Should Not Be Selected    ${stoptrading_chk}
    Checkbox Should Not Be Selected    ${notinterested_chk}
    Checkbox Should Not Be Selected    ${anotherweb_chk}
    Checkbox Should Not Be Selected    ${notfriendly_chk}
    Checkbox Should Not Be Selected    ${difficult_chk}
    Checkbox Should Not Be Selected    ${lackfeature_chk}
    Checkbox Should Not Be Selected    ${unsatisfy_chk}
    Checkbox Should Not Be Selected    ${other_chk}
    Wait Until Element Is Visible    ${continue_btn}    10
    Element Should Be Enabled    ${continue_btn}

Click no checkbox
    Wait Until Element Is Visible    ${financial}    15
    Click Element    ${financial}
    Checkbox Should Not Be Selected    ${financial_chk}
    Checkbox Should Not Be Selected    ${stoptrading_chk}
    Checkbox Should Not Be Selected    ${notinterested_chk}
    Checkbox Should Not Be Selected    ${anotherweb_chk}
    Checkbox Should Not Be Selected    ${notfriendly_chk}
    Checkbox Should Not Be Selected    ${difficult_chk}
    Checkbox Should Not Be Selected    ${lackfeature_chk}
    Checkbox Should Not Be Selected    ${unsatisfy_chk}
    Checkbox Should Not Be Selected    ${other_chk}
    Wait Until Element Is Visible    ${error_msg}    10
    Element Should Contain    ${error_msg}    Please select at least one reason
    

Checkbox validation click 2 checkbox
    Wait Until Element Is Visible    ${continue_btn}    10
    Wait Until Element Is Visible    ${financial}    15
    Click Element    ${stoptrading}
    Click Element    ${difficult}
    Checkbox Should Be Selected    ${difficult_chk}
    Checkbox Should Be Selected    ${stoptrading_chk}
    Checkbox Should Not Be Selected    ${financial_chk}
    Checkbox Should Not Be Selected    ${notinterested_chk}
    Checkbox Should Not Be Selected    ${anotherweb_chk}
    Checkbox Should Not Be Selected    ${notfriendly_chk}
    Checkbox Should Not Be Selected    ${lackfeature_chk}
    Checkbox Should Not Be Selected    ${unsatisfy_chk}
    Checkbox Should Not Be Selected    ${other_chk}
    Wait Until Element Is Visible    ${continue_btn}    10
    Element Should Be Enabled    ${continue_btn}


Checkbox validation click 3 checkbox
    Wait Until Element Is Visible    ${continue_btn}    10
    Wait Until Element Is Visible    ${financial}    15
    Click Element    ${stoptrading}
    Click Element    ${difficult}
    Click Element    ${notfriendly}
    Click Element    ${other}
    Click Element    ${lackfeature}
    Checkbox Should Be Selected    ${notfriendly_chk}
    Checkbox Should Be Selected    ${other_chk}
    Checkbox Should Be Selected    ${lackfeature_chk}
    Checkbox Should Not Be Selected    ${financial_chk}
    Checkbox Should Not Be Selected    ${difficult_chk}
    Checkbox Should Not Be Selected    ${stoptrading_chk}
    Checkbox Should Not Be Selected    ${notinterested_chk}
    Checkbox Should Not Be Selected    ${anotherweb_chk}    
    Checkbox Should Not Be Selected    ${unsatisfy_chk}    
    Wait Until Element Is Visible    ${continue_btn}    10
    Element Should Be Enabled    ${continue_btn}

Check if checkboxes are Disabled
    Element Should Be Disabled    ${financial_chk}
    Element Should Be Disabled    ${difficult_chk}
    Element Should Be Disabled    ${stoptrading_chk}
    Element Should Be Disabled    ${notinterested_chk}
    Element Should Be Disabled    ${anotherweb_chk}
    Element Should Be Disabled    ${unsatisfy_chk}


Input text into what other trading platform
    Wait Until Element Is Visible    ${trading_platform_imp}    10
    Input Text    ${trading_platform_imp}    $!@
    Wait Until Element Is Visible    ${error_msg}    10
    Element Should Contain    ${error_msg}    Must be numbers, letters, and special characters . , ' -
    Press Keys    ${trading_platform_imp}    CTRL+a+BACKSPACE
    Input Text    ${trading_platform_imp}    My Trading

Input text into what improvement
    Wait Until Element Is Visible    ${improve_imp}    10
    Input Text    ${improve_imp}    $!@
    Wait Until Element Is Visible    ${error_msg}    10
    Element Should Contain    ${error_msg}    Must be numbers, letters, and special characters . , ' -
    Press Keys    ${improve_imp}    CTRL+a+BACKSPACE
    Input Text    ${improve_imp}    Make it easier to withdraw money


Close account
    Wait Until Element Is Visible    ${continue_btn}    10
    Click Element    ${continue_btn}
    Wait Until Element Is Visible    ${warning}    10
    Wait Until Element Is Visible    ${close_btn}    10
    Click Element    ${close_btn}

Verify account is closed    
    Wait Until Element Is Visible    ${closing_msg}    10
    Element Should Contain    ${closing_msg}    We’re sorry to see you leave. Your account is now closed.
    

Reactivation
    Wait Until Element Is Visible    ${deriv_login}    40
    Wait Until Element Is Enabled    ${deriv_login}    40
    Click Element    ${deriv_login}
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    pavithra@besquare.com.my
    Input Password    txtPass  291299Pavi
    Click Element    //button[@name="login"]
    Wait Until Element Is Visible    ${start_btn}    15
    Click Element    ${start_btn}
    Wait Until Element Is Visible    ${prof_icn}    20

Check the redirection of back buttons
    Reload Page
    Wait Until Element Is Visible    ${prof_icn}    20
    Click Element    ${prof_icn}
    Wait Until Element Is Visible    ${account_closing}    10
    Click Element    ${account_closing}
    Wait Until Page Contains    Are you sure?    10
    Reload Page
    Wait Until Element Is Visible    ${closeacc_btn}    10
    Click Element    ${closeacc_btn}
    Wait Until Element Is Visible    ${close_title}    10
    Wait Until Element Is Visible    ${continue_btn}    10
    Element Should Be Disabled    ${continue_btn}
    Wait Until Element Is Visible    ${financial}    15
    Click Element    ${financial}
    Wait Until Element Is Visible    ${continue_btn}    10
    Element Should Be Enabled    ${continue_btn}
    Click Element    ${continue_btn}
    Wait Until Element Is Visible    ${warning}    10
    Wait Until Element Is Visible    ${goback_btn}    10
    Click Element    ${goback_btn}
    Wait Until Element Is Visible    ${close_title}    10
    Wait Until Element Is Visible    ${bck_btn}    10
    Click Element    ${bck_btn}
    Wait Until Page Contains    Are you sure?    15
    Wait Until Element Is Visible    ${cancel_btn}    10
    Click Element    ${cancel_btn}
    Wait Until Element Is Visible    ${prof_icn}    10