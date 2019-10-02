#Author: vaishali.katta@prodigylabs.net
#Keywords Summary : VAST Automation 
#Feature: VAST Login
#Scenario: #NA
Feature: Login Features
@Smoke @Regression @TC001
Scenario Outline: Verify Login with valid credentials
	Given User launches the Vast application "<url>"
		And user enters text "<Username>" in textbox "Username"
		And user enters text "<Password>" in textbox "Password"
		And user clicks on button "Environment"
		And user clicks on button "VAST_Jack_Henry_QAT"
		And user clicks on button "Login"
		And user waits for page to load
		Then user is on "Dashboard_page" 
		
		Examples:
		| url | Username | Password |
		| http://vnbaxmqaapp.vnb.internal:8080/bpc/ | adeep | test | 

@Regression @TC002	
Scenario Outline: Verify Login with invalid credentials
	Given User launches the Vast application "<url>"
		And user enters text "<Username>" in textbox "Username"
		And user enters text "<Password>" in textbox "Password"
		And user clicks on button "Environment"
		And user clicks on button "VAST_Jack_Henry_QAT"
		And user clicks on button "Login"
		Then user validates "Error_Message" with expected value "<Message>"
		
		Examples:
		| url | Username | Password | Message |
		| http://vnbaxmqaapp.vnb.internal:8080/bpc/ | adeep | invalid | Incorrect username or password |
		| http://vnbaxmqaapp.vnb.internal:8080/bpc/ | invalid | invalid | User not found |
