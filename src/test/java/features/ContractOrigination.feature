#Author: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: Contract Origination
#Scenario: #NA
Feature: Contract Origination 
Background:
    Given User launches the Vast application "http://vnbaxmqaapp.vnb.internal:8080/bpc/"
    And user enters text "adeep" in textbox "Username"
    And user enters text "test" in textbox "Password"
	And user clicks on button "Environment"
	And user clicks on button "VAST_Jack_Henry_QAT"
    And user clicks on button "Login"
    And user waits for page to load
    And user is on "Dashboard_page"    
 	
@Smoke @Regression	 @TC007
Scenario Outline: Validate the user is able to apply for Easy Checking Product for Person
	Given user is on "Dashboard_page" 
	And user clicks on button "Contract"
	And user clicks on button "Origination"
    And user waits for "5" seconds
	And user enters text "<Customer number>" in textbox "Customer_number"
	And user clicks on button "Search_Customer"
    And user waits for "5" seconds
    And user validates "Client_data" with expected value "<Customer number>"
	And user clicks on "Product_type" and selects "<Product type>" from "all_Product_types"
	And user selects "<Sub Product type>" card
	And user clicks on button "Next"
    And user waits for "5" seconds
    And user validates value in "Account_type" with expected value "<Sub Product type>"
    And user enters text "<Opening amount>" in textbox "Opening_amount"
    And user clicks on "Account_ownership" and selects "<Account ownership>" from "all_Account_ownerships"
    And user clicks on "Opened_by_Officer_ID" and selects "<Opened by (Officer ID)>" from "all_Opened_by_Officer_ID"
    And user clicks on "*Branch" and selects "<Branch>" from "*all_Branches"
    And user clicks on button "Next"
    And user waits for "5" seconds
    #And Verify account no is not empty
    And user clicks on button "Add_Relationships"
    And user clicks on "Type_of_Relationship" and selects "<Type of Relationship>" from "all_Type_of_Relationship"	
    And user enters text "<Customer number>" in textbox "*Customer"
    And user clicks on button "Save_Relation"
	And user clicks on button "Save_Relation"
	And user clicks on button "Next"
	And user is on "Show_check_results_screen"  

    Examples: 
	|	Customer number	|	Product type	|	Sub Product type	|	Opening amount	|	Account ownership	|  Opened by (Officer ID) |	Branch	|	Type of Relationship	|			|	Zip code	|	Phone type	|	Phone number	|	Email address	|	ID type				|	Number	|	Issuing authority	|	ID state	|	Issuance date	|	Expiration date	|	Employer	|	Job title	| Salary	|	Officer code	|	Branch	| Name | Address |
	|	333333332		|	Checking		|	Easy Checking		|	1000			|	Individual			|	 DIR				  |	Bixby	|	Attorney-in-Fact    	|	Oklahoma	|	12345		|	Cell		|	987-654-3210	|	abc@abc.com		|	Driver's License	|	DMV1234	|	DMV					|	Texas		|	Jun 07, 2016	|	Jun 05, 2022	|	ABC LLC		|	Tester		| 50000	|	RBS |	Tulsa - Yale	|	Andrew Lopez | 1234 Main St, Tulsa, OK 12345 |	
	

	