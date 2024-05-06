*** Settings ***
Documentation
Resource    ../resources/imports.robot
Library    XML

*** Variables ***
&{dictToDoTasks}
...     checkbox=//ul[@id="incomplete-tasks"]/descendant::span[contains(@id,'text-') and contains(text(),'$text')]
...     deleteButton=//ul[@id="incomplete-tasks"]/descendant::span[contains(@id,'text-') and contains(text(),'$text')]/../../button
...     listOfIncompleteTasks=//ul[@id='incomplete-tasks']//li


*** Keywords ***
Checkbox Is Shown
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictToDoTasks}[checkbox]    $text    ${text}
    SeleniumLibrary.Page Should Contain Element    ${locator}

Delete Button Is Shown
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictToDoTasks}[deleteButton]    $text    ${text}
    SeleniumLibrary.Page Should Contain Element    ${locator}

Checkbox Is Not Shown
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictToDoTasks}[checkbox]    $text    ${text}
    SeleniumLibrary.Page Should Not Contain Element    ${locator}

Delete Button Is Not Shown
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictToDoTasks}[deleteButton]    $text    ${text}
    SeleniumLibrary.Page Should Not Contain Element    ${locator}

Click Checkbox
    [Arguments]     ${text}
    ${checkboxLocator}=     Replace String      ${dictToDoTasks}[checkbox]      $text      ${text}
    SeleniumLibrary.Click Element    ${checkboxLocator}
    
Click Delete Button
    [Arguments]     ${text}
    ${locator}=     Replace String    ${dictToDoTasks}[deleteButton]    $text    ${text}
    SeleniumLibrary.Click Element    ${locator}

Number of Incomplete Tasks Should Be ${value}
    ${value}=       Convert To Number    ${value}
    ${numberOfIncompleteTasks}=     SeleniumLibrary.Get Element Count    ${dictToDoTasks}[listOfIncompleteTasks]
    BuiltIn.Should Be Equal    ${value}    ${numberOfIncompleteTasks}