#Author: akash.deep@prodigylabs.net
#ModifiedBy: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: Person Origination
#Scenario: #NA
Feature: Person Origination 
Background:
    Given User launches the Vast application "http://vnbaxmqaapp.vnb.internal:8080/bpc/"
    And user enters text "adeep" in textbox "Username"
    And user enters text "test" in textbox "Password"
	And user clicks on button "Environment"
	And user clicks on button "VAST_Jack_Henry_QAT"
    And user clicks on button "Login"
    And user waits for "5" seconds
    And user is on "Dashboard_page"    
 	
@Smoke @Regression	 @TC006
Scenario Outline: Validate the user is able to create new record for person in VAST system when no customer is retreived from the system
	Given user is on "Dashboard_page" 
	And user clicks on button "Customer"
	And user clicks on button "Person_Origination"
	And user enters text "<TIN (SSN/EIN)>" in textbox "TIN_SSN_EIN"
	And user clicks on button "Search"
	And user waits for page to load
	And user clicks on button "Create_Person"
	And user clicks on "Title" and selects "<Title>" from "all_Titles"
	And user enters text "<First name>" in textbox "First_name"
	And user enters text "<Last name>" in textbox "Last_name"
	And user clicks on "Gender" and selects "<Gender>" from "all_Genders"
	And user enters text "<Birth Date>" in textbox "Birth_Date"
	And user enters text "<Street address>" in textbox "Street_address"
	And user enters text "<City>" in textbox "City"
	And user clicks on "State" and selects "<State>" from "all_States"
	And user enters text "<Zip code>" in textbox "Zip_code"
	And user clicks on button "Add_Phone_number"
	And user clicks on "Phone_type" and selects "<Phone type>" from "all_Phone_types"
	And user enters text "<Phone number>" in textbox "Phone_number" using javascript
	And user clicks on button "Save_Phone_Number"
	And user validates "Phone_type_column" with expected value "<Phone type>"
	And user validates "Phone_Number_column" with expected value "<Phone number>"
	And user clicks on button "Add_Email_address"
	And user enters text "<Email address>" in textbox "Email_address"
	And user clicks on button "Save_Email_address"
	And user validates "Email_address_column" with expected value "<Email address>"
	And user clicks on "ID_type" and selects "<ID type>" from "all_ID_types"
	And user enters text "<Number>" in textbox "Number"	
	And user enters text "<Issuing authority>" in textbox "Issuing_authority"
	And user clicks on "ID_State" and selects "<ID state>" from "all_ID_States"
	And user enters text "<Issuance date>" in textbox "Issuance_date"	
	And user enters text "<Expiration date>" in textbox "Expiration_date"	
	And user enters text "<Employer>" in textbox "Employer"	
	And user enters text "<Job title>" in textbox "Job_title"
	And user enters text "<Salary>" in textbox "Salary"
	And user clicks on "Officer_code" and selects "<Officer code>" from "all_officer_codes"
	And user clicks on "Branch" and selects "<Branch>" from "all_Branches"	
	And user clicks on button "Next"
	And user is on "Show_check_results_screen"  
	And user clicks on button "Next"
	And user is on "Capture_relationships_screen"  
	And user clicks on button "Next"
	And user is on "Add_customer_screen" 
	And user clicks on button "Confirm"
	And user is on "Display_customer_screen" 
	And user validates text "actual_customer_no" with expected value "<TIN (SSN/EIN)>"
	And user validates text "actual_name" with expected value "<Name>"
	And user validates text "actual_Birth_Date" with expected value "<Birth Date>"
	And user validates text "actual_Email_address" with expected value "<Email address>"
	And user validates text "actual_address" with expected value "<Address>"
	And user clicks on button "Exit"

    Examples: 
	|	TIN (SSN/EIN)	|	Title	|	First name	|	Last name	|	Gender	|	Birth Date	|	Street address	|	City	|	State		|	Zip code	|	Phone type	|	Phone number	|	Email address	|	ID type				|	Number	|	Issuing authority	|	ID state	|	Issuance date	|	Expiration date	|	Employer	|	Job title	| Salary	|	Officer code	|	Branch	| Name | Address |
	|	333333354		|	Mr.		|	Andrew		|	Lopez		|	Male	| Oct 20, 1991  |	1234 Main St	|	Tulsa	|	Oklahoma	|	12345		|	Cell		|	987-654-3210	|	abc@abc.com		|	Driver's License	|	DMV1234	|	DMV					|	Texas		|	Jun 07, 2016	|	Jun 05, 2022	|	ABC LLC		|	Tester		| 50000	|	RBS |	Tulsa - Yale	|	Andrew Lopez | 1234 Main St, Tulsa, OK 12345 |	
	

	