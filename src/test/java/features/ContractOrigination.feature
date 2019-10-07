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
    And user waits for "3" seconds
    And user is on "Dashboard_page"    
 	
@Regression	 @TC007
Scenario Outline: Validate the user is able to apply for Easy Checking Product for Person
	Given user is on "Dashboard_page" 
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "2" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "2" seconds
    And user validates "Client_data" with expected value "<Customer number>"
	And user clicks on "Product_type" and selects "<Product type>" from "all_Product_types"
	And user selects "<Sub Product type>" card
	And user clicks on button "Next"
    And user waits for "3" seconds
    And user is on "Account_origination_Account_details"
    And user enters text "<Opening amount>" in textbox "Opening_amount"
    And user clicks on "Account_ownership" and selects "<Account ownership>" from "all_Account_ownerships"
    And user clicks on "Opened_by_Officer_ID" and selects "<Opened by (Officer ID)>" from "all_Opened_by_Officer_ID"
    And user clicks on "*Branch" and selects "<Branch>" from "*all_Branches"
    And user clicks on button "Next"
    And user waits for "2" seconds
    And user is on "Account_origination_Relationships" 
    And user validates text "Contracted_Product" with expected value "<Sub Product type>"
    And user validates that "Account_Number" is displayed
    And user clicks on button "Add_Relationships"
    And user clicks on "Type_of_Relationship" and selects "<Type of Relationship>" from "all_Type_of_Relationship"	
    And user enters text "<Customer number>" in textbox "*Customer"
    And user clicks on button "Save_Relation"
	And user clicks on button "Save_Relation"
	And user waits for page to load
	And user clicks on button "Next"
	And user waits for page to load
	And user is on "Account_origination_Checks"
	And user waits for page to load
	And user clicks on button "Next"
    And user is on "Account_origination_Card_Origination"  
	And user clicks on button "Next"
    And user is on "Account_origination_E-statement"  
	And user clicks on button "Next"
    And user is on "Account_origination_Mobile_Deposit"  
	And user clicks on button "Next"
    And user is on "Account_origination_Online_Banking"  
	And user clicks on button "Next"
    And user is on "Account_origination_Confirmation"    
    And user clicks on button "Confirm"
    And user waits for "25" seconds
	And user waits for page to load
    And user is on "Account_origination_Signature"  
    And user clicks on button "Printed_Signed"
    And user clicks on button "Submit"

    Examples: 
	|	Customer number	|	Product type	|	Sub Product type	|	Opening amount	|	Account ownership	|  Opened by (Officer ID) |	Branch	|	Type of Relationship	|	
	|	111441441		|	Checking		|	Easy Checking		|	1000			|	Individual			|	 DIR				  |	Bixby	|	Attorney-in-Fact    	|	
	
@Smoke @Regression	 @TC007
Scenario Outline: Validate the user is able to apply for Easy Checking Product for Person
	Given user is on "Dashboard_page" 
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "3" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "5" seconds
    And user validates "Client_data" with expected value "<Customer number>"
	And user clicks on "Product_type" and selects "<Product type>" from "all_Product_types"
	And user selects "<Sub Product type>" card
	And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_Account_details"
    And user enters text "<Opening amount>" in textbox "Opening_amount"
    And user clicks on "Account_ownership" and selects "<Account ownership>" from "all_Account_ownerships"
    And user clicks on "Opened_by_Officer_ID" and selects "<Opened by (Officer ID)>" from "all_Opened_by_Officer_ID"
    And user clicks on "*Branch" and selects "<Branch>" from "*all_Branches"
    And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_Relationships" 
    And user validates text "Contracted_Product" with expected value "<Sub Product type>"
    And user validates that "Account_Number" is displayed
    And user clicks on button "Add_Relationships"
    And user clicks on "Type_of_Relationship" and selects "<Type of Relationship>" from "all_Type_of_Relationship"	
    And user enters text "<Customer number>" in textbox "*Customer"
    And user clicks on button "Save_Relation"
    And user waits for page to load
	And user clicks on button "Save_Relation"
	And user waits for page to load
	And user clicks on button "Next"
	And user waits for page to load
	And user is on "Account_origination_Checks"
	And user waits for page to load
	And user clicks on button "Next"
    And user is on "Account_origination_Card_Origination"  
	And user clicks on button "Next"
    And user is on "Account_origination_E-statement"  
	And user clicks on button "Next"
    And user is on "Account_origination_Mobile_Deposit"  
	And user clicks on button "Next"
    And user is on "Account_origination_Online_Banking"  
	And user clicks on button "Next"
    And user is on "Account_origination_Confirmation"    
    And user clicks on button "Confirm"
    And user waits for "25" seconds
    And user is on "Account_origination_Signature"  
    And user clicks on button "Printed_Signed"
    And user clicks on button "Submit"

    Examples: 
	|	Customer number	|	Product type	|	Sub Product type	|	Opening amount	|	Account ownership	|  Opened by (Officer ID) |	Branch	|	Type of Relationship	|	
	|	333333353		|	Checking		|	Easy Checking		|	1000			|	Individual			|	 DIR				  |	Bixby	|	Attorney-in-Fact    	|	
	
	