#Author: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: Contract Origination
#Scenario: #NA
Feature: Person Contract Origination 
Background:
    Given User launches the Vast application "http://vnbaxmqaapp.vnb.internal:8080/bpc/"
    And user enters text "adeep" in textbox "Username"
    And user enters text "test" in textbox "Password"
	And user clicks on button "Environment"
	And user clicks on button "VAST_Jack_Henry_QAT"
    And user clicks on button "Login"
    And user waits for "3" seconds
    And user is on "Dashboard_page"    
 	
@Smoke @Regression	 @TC007
Scenario Outline: Validate the user is able to apply for Easy Checking Product for Individual account with default values
	Given user is on "Dashboard_page" 
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "4" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "4" seconds
    And user validates "Client_data" with expected value "<Customer number>"
	And user clicks on "Product_type" and selects "<Product type>" from "all_Product_types"
	And user selects "<Sub Product type>" from "Product_card"
	And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_make_decission_new_process"
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
	And user clicks on button "Next"
	And user waits for page to load
	And user is on "Account_origination_Checks"
	And user waits for page to load
	And user validates "Does_the_customer_require_checks?" with expected value "<Does the customer require checks?>"
	And user clicks on button "Next"
    And user is on "Account_origination_Card_Origination"  
    And user validates "Does_the_customer_want_to_have_a_card?" with expected value "<Does the customer want to have a card?>"
	And user clicks on button "Next"
    And user is on "Account_origination_E-statement"  
    And user validates "Does_the_customer_want_an_e-statement?" with expected value "<Does the customer want an e-statement?>"
	And user clicks on button "Next"
    And user is on "Account_origination_Mobile_Deposit"  
    And user validates "Does_the_customer_want_to_setup_mobile_deposit?" with expected value "<Does the customer want to setup mobile deposit?>"
	And user clicks on button "Next"
    And user is on "Account_origination_Online_Banking" 
    And user validates "Does_the_customer_want_to_access_online_banking?" with expected value "<Does the customer want to access online banking?>"
	And user clicks on button "Next"
    And user is on "Account_origination_Confirmation"   
    And user validates text "Contracted_Product_On_Confirmation_Screen" with expected value "<Sub Product type>" 
    And user validates that "Account_Number_On_Confirmation_Screen" is displayed
    And user validates text "Interest_Rate" with expected value "<Interest Rate>" 
    And user validates text "APY" with expected value "<APY>" 
    And user clicks on button "Confirm"
    And user waits for "30" seconds
	And user waits for page to load
    And user is on "Account_origination_Signature"  
  #  And user clicks on button "Printed_Signed"    Commenting as this piece is under development
  #  And user clicks on button "Submit"

    Examples: 
	| Customer number |	Product type |	Sub Product type |	Opening amount	|	Account ownership	|  Opened by (Officer ID) |	Branch	| Does the customer require checks? | Does the customer want to have a card? | Does the customer want an e-statement? | Does the customer want to setup mobile deposit? |Does the customer want to access online banking?| Interest Rate | APY   | 	
	| 444985592 	  |	Checking     |	Easy Checking    |	1000			|	Individual			|	 DIR				  |	Bixby	| NO 								| NO 									 | YES 									  | YES 										    | YES 											 |  0.00%		 | 0.00% |
	
@Smoke @Regression	 @TC008
Scenario Outline: Validate the user is able to apply for Rewards Checking Product for Joint account by adding relationship with another customer and requesting card for both
	Given user is on "Dashboard_page" 
	And user clicks on button "Contract"
	And user clicks on button "Origination"
	And user waits for "4" seconds
	And user enters text "<Customer number>" in textbox "Customer_number" using javascript
	And user clicks on button "Search_Customer"
	And user waits for "4" seconds
    And user validates "Client_data" with expected value "<Customer number>"
	And user clicks on "Product_type" and selects "<Product type>" from "all_Product_types"
	And user selects "<Sub Product type>" from "Product_card"
	And user clicks on button "Next"
    And user waits for "4" seconds
    And user is on "Account_origination_make_decission_new_process"
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
    And user enters text "<Customer>" in textbox "*Customer"
    And user clicks on button "Save_Relation"
    And user waits for page to load
    And user enters text "<Percentage>" in textbox "Percentage"
	And user clicks on button "Save_Relation"
	And user waits for page to load
	And Verify "<Customer>" is available in "Customer_Number_Column"
	And Verify "<Type of Relationship>" is available in "Type_Of_Relationship_Column"
	And Verify "<Percentage>" is available in "Percentage_Column"
	And user clicks on button "Next"
    And user waits for "3" seconds
	And user is on "Account_origination_Checks"
	And user clicks on button "Does_the_customer_require_checks_YES"
	And user waits for page to load
	And user validates "Address_on_checks_value" with expected value "<Address on checks>"
	And user validates "Shipping_Address" with expected value "<Shipping Address>"
	And user clicks on button "Next"
    And user waits for "3" seconds
	And user is on "Account_origination_Card_Origination"  
	And user clicks on button "Does_the_customer_want_to_have_a_card_YES"
	And user waits for page to load	
	And user validates "Issue_debit_cards_to" with expected value "<Customer Name>"
	And user clicks on button "Issue_debit_cards_to_dropdown"
	And user selects "<Secondary Customer Name>" from "Issue_debit_cards_to_list"
	And user validates "Account_status_ATM_&_POS_value" with expected value "<Account status ATM & POS>"
	And user validates "Account_designation_value" with expected value "<Account designation>"	
	And user clicks on button "Next"
	And user waits for page to load
    And user is on "Account_origination_E-statement"  
    And user clicks on button "Does_the_customer_want_an_e-statement_NO"
	And user clicks on button "Next"
    And user is on "Account_origination_Mobile_Deposit"  
    And user clicks on button "Does_the_customer_want_to_setup_mobile_deposit_NO"
	And user clicks on button "Next"
    And user is on "Account_origination_Online_Banking" 
	And user clicks on button "Does_the_customer_want_to_access_online_banking_NO"
	And user clicks on button "Next"
    And user is on "Account_origination_Confirmation"   
    And user validates text "Contracted_Product_On_Confirmation_Screen" with expected value "<Sub Product type>" 
    And user validates that "Account_Number_On_Confirmation_Screen" is displayed
    And user validates text "Interest_Rate" with expected value "<Interest Rate>" 
    And user validates text "APY" with expected value "<APY>" 
    And user clicks on button "Confirm"
    And user waits for "30" seconds
	And user waits for page to load
    And user is on "Account_origination_Signature"  
   # And user clicks on button "Printed_Signed"            Commenting as this piece is under development
   # And user clicks on button "Submit"

    Examples: 
	| Customer number |	Product type |	Sub Product type |	Opening amount	|	Account ownership	|  Opened by (Officer ID) |	Branch	|	Type of Relationship	| Customer | Percentage | Address on checks                 | Shipping Address                 | Customer Name   | Secondary Customer Name | Account status ATM & POS    |Account designation | Interest Rate | APY   | 	
	| 599813966		  |	Checking     |	Rewards Checking |	5000			|	Joint   			|	VNB 				  |	Catoosa	|	Joint Owner		    	| 444444444| 40         | 1186 Sonora Rd, Canton, AL 13116	| 1186 Sonora Rd, Canton, AL 13116 | Lindsey Craft   | Test Person 			   | Primary open ATM; Open POS  | Personal  		  |  2.03%		  | 2.05% |
