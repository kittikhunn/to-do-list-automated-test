*** Settings ***
Documentation
Resource    ../resources/imports.robot
Resource    ../pages/mainNav.robot
Resource    ../pages/addItem.robot
Resource    ../pages/toDoTasks.robot
Resource    ../pages/completed.robot

Suite Setup     Open Browser    https://abhigyank.github.io/To-Do-List/   Chrome
Suite Teardown  Close All Browsers

*** Keywords ***
Task Is Shown In To-Do
    [Arguments]     ${text}
    toDoTasks.Checkbox Is Shown    text=${text}
    toDoTasks.Delete Button Is Shown    text=${text}
    
Task Is Not Shown In To-Do
    [Arguments]     ${text}
    toDoTasks.Checkbox Is Not Shown    text=${text}
    toDoTasks.Delete Button Is Not Shown    text=${text}
    
Task Is Shown In Completed
    [Arguments]     ${text}
    completed.Completed Item Is Shown    text=${text}
    completed.Delete Button Is Shown    text=${text}

Task Is Not Shown In Completed
    [Arguments]     ${text}
    completed.Completed Item Is Not Shown    text=${text}
    completed.Delete Button Is Not Shown    text=${text}

*** Test Cases ***
TC01 - Default UI Elements Must Be Displayed Correctly
    mainNav.Header Displays Correctly
    addItem.Input Text Field Is Shown
    addItem.Add Button Is Shown

    mainNav.Click To-Do Tasks Button
    toDoTasks.Number of Incomplete Tasks Should Be 0

    mainNav.Click Completed Button
    completed.Number of Completed Tasks Should Be 0


TC02 - User Can Add To-Do Task Successfully
    mainNav.Click Add Item Button
    addItem.Input Text in Text Field    text=Test1
    addItem.Click Add Button
    addItem.Input Text Field Is Cleared

    addItem.Input Text in Text Field    text=Test2
    addItem.Click Add Button
    addItem.Input Text Field Is Cleared

    mainNav.Click To-Do Tasks Button
    Task Is Shown In To-Do    text=Test1
    Task Is Shown In To-Do    text=Test2
    
TC03 - User Can Make Incomplete Task as Completed
    mainNav.Click To-Do Tasks Button
    toDoTasks.Click Checkbox    text=Test1
    Task Is Not Shown In To-Do    text=Test1
    Task Is Shown In To-Do    text=Test2
    
    mainNav.Click Completed Button
    Task Is Shown In Completed    text=Test1
    Task Is Not Shown In Completed    text=Test2
    
TC04 - User Can Delete Incomplete Tasks
    mainNav.Click To-Do Tasks Button
    Task Is Shown In To-Do    text=Test2
    toDoTasks.Click Delete Button    text=Test2
    Task Is Not Shown In To-Do    text=Test1
    Task Is Not Shown In To-Do    text=Test2
    
    mainNav.Click Completed Button
    Task Is Shown In Completed    text=Test1
    Task Is Not Shown In Completed    text=Test2

TC05 - User Can Delete Completed Tasks
    mainNav.Click Completed Button
    completed.Click Delete Button    text=Test1
    Task Is Not Shown In Completed    text=Test1
    Task Is Not Shown In Completed    text=Test2
