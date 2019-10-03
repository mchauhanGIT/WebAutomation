package stepDefinations;

import com.cucumber.listener.Reporter;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.prodigylabs.config.ObjectRepository;
import net.prodigylabs.handlers.VerificationHandler;


public class Customer_Steps {
	
	private VASTBaseTest vastbasetest;
	private Login_Steps loginsteps;
	
	public Customer_Steps(VASTBaseTest vastbasetest, Login_Steps loginsteps) {
		this.vastbasetest=vastbasetest;
		this.loginsteps=loginsteps;
	}

	@Then("^user gets message as \"([^\"]*)\" on top of the page$")
	public void user_gets_message_as_on_top_of_the_page(String arg1) throws Throwable {
		vastbasetest.webelementHandler.setDriverWait(ObjectRepository.getobjectLocator("NoCustomersavailable_message"));
	    VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getobjectLocator("NoCustomersavailable_message")).contains(arg1));
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
	
	@Then("^Verify \"([^\"]*)\" is available in \"([^\"]*)\"$")
	public void verify_is_available_in(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.setDriverWait(ObjectRepository.getobjectLocator(arg2));
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getobjectLocator(arg2)).contains(arg1));
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
	@Given("^user clicks on \"([^\"]*)\" and selects \"([^\"]*)\" from \"([^\"]*)\"$")
	public void user_clicks_on_and_selects_from(String arg1, String arg2, String arg3) throws Throwable {
		vastbasetest.webelementHandler.clickButton(ObjectRepository.getobjectLocator(arg1));
		vastbasetest.webelementHandler.clickElementByText(ObjectRepository.getobjectLocator(arg3), arg2);		
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName)); 
	}

	@Given("^user enters text \"([^\"]*)\" in textbox \"([^\"]*)\" using javascript$")
	public void user_enters_text_in_textbox_using_javascript(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.enterTextUsingJavascript(ObjectRepository.getobjectLocator(arg2), arg1);
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
	
	@Given("^user validates text \"([^\"]*)\" with expected value \"([^\"]*)\"$")
	public void user_validates_text_with_expected_value(String arg1, String arg2) throws Throwable {
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getString(arg1)).contains(arg2));
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}

	
}
