*** Settings ***
Library     DatabaseLibrary
Resource        ../TestData/basic_data.robot

*** Test Cases ***
verify employee details
        DatabaseLibrary.Connect To Database
    ...    pymysql
    ...    db_name=test_troop
    ...    db_user=root
    ...    db_password=${db_password}
    ...    db_host=127.0.0.1
    ...    db_port=3306
    ...    alias=mysql

    #${rows}=    DatabaseLibrary.Query    select * from test_troop.employee_details      alias=mysql
    #DatabaseLibrary.Check Query Result	select * from test_troop.employee_details	contains	Donna       row=5	col=1
    #DatabaseLibrary.Check Row Count     select * from test_troop.employee_details	==	12
    #DatabaseLibrary.Row Count Is Equal To X	     select * from test_troop.employee_details      12
    DatabaseLibrary.Execute Sql String	INSERT INTO employee_details (employee_id,first_name,last_name,age,gender,birth_date) VALUES (13,'Leslie_a','Knope_a', 44,'Female_a','1979-09-25');

    DatabaseLibrary.Disconnect From Database

