*** Settings ***
Documentation
Resource    ../resources/imports.robot

*** Variables ***
&{dictCompleted}
...     completedItem=xpath=//div[@id="completed"]//span[contains(text(),'$text')]
...     deleteButton=xpath=//div[@id="completed"]//span[contains(text(),'$text')]/../button
...     listOfCompletedTasks=xpath=//ul[@id='completed-tasks']//li

*** Keywords ***
Completed Item Is Shown
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictCompleted}[completedItem]    $text    ${text}
    SeleniumLibrary.Page Should Contain Element    ${locator}

Delete Button Is Shown
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictCompleted}[deleteButton]    $text    ${text}
    SeleniumLibrary.Page Should Contain Element    ${locator}

Completed Item Is Not Shown
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictCompleted}[completedItem]    $text    ${text}
    SeleniumLibrary.Page Should Not Contain Element    ${locator}

Delete Button Is Not Shown
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictCompleted}[deleteButton]    $text    ${text}
    SeleniumLibrary.Page Should Not Contain Element    ${locator}

Click Delete Button
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictCompleted}[deleteButton]    $text    ${text}
    SeleniumLibrary.Click Element    ${locator}

Number of Completed Tasks Should Be ${value}
    ${value}=       Convert To Number    ${value}
    ${numberOfIncompleteTasks}=     SeleniumLibrary.Get Element Count    ${dictCompleted}[listOfCompletedTasks]
    BuiltIn.Should Be Equal    ${value}    ${numberOfIncompleteTasks}