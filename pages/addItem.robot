*** Settings ***
Documentation
Resource  ../resources/imports.robot

*** Variables ***
&{dictAddItem}
...     textField=xpath=//div[@id='add-item']//input
...     addButton=xpath=//div[@id='add-item']//button

*** Keywords ***
Input Text in Text Field
    [Arguments]     ${text}
    Input Text    ${dictAddItem}[textField]    ${text}

Click Add Button
    Click Element    ${dictAddItem}[addButton]

Input Text Field Should Be Cleared
    ${inputText}=    Get Element Attribute    ${dictAddItem}[textField]    value
    Should Be Empty    ${inputText}

Input Text Field Should Be Shown
    Page Should Contain Element    ${dictAddItem}[textField]

Add Button Should Be Shown
    Page Should Contain Element    ${dictAddItem}[addButton]

