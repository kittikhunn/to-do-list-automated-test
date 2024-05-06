*** Settings ***
Documentation
Resource  ../resources/imports.robot

*** Variables ***
&{dictAddItem}
...     textField=xpath=//div[@id='add-item']//input
...     addButton=xpath=//div[@id='add-item']//button

*** Keywords ***
Text Field Is Shown

Input Text in Text Field
    [Arguments]     ${text}
    SeleniumLibrary.Input Text    ${dictAddItem}[textField]    ${text}

Click Add Button
    SeleniumLibrary.Click Element    ${dictAddItem}[addButton]

Input Text Field Is Cleared
    ${inputText}=    SeleniumLibrary.Get Element Attribute    ${dictAddItem}[textField]    value
    BuiltIn.Should Be Empty    ${inputText}

Input Text Field Is Shown
    SeleniumLibrary.Page Should Contain Element    ${dictAddItem}[textField]

Add Button Is Shown
    SeleniumLibrary.Page Should Contain Element    ${dictAddItem}[addButton]