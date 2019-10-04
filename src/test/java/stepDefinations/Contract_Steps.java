package stepDefinations;

import org.openqa.selenium.By;

import com.cucumber.listener.Reporter;

import cucumber.api.java.en.Given;
import cucumber.api.java.tr.Ve;
import net.prodigylabs.config.ObjectRepository;
import net.prodigylabs.handlers.VerificationHandler;

public class Contract_Steps {
	
	private VASTBaseTest vastbasetest;
	private Login_Steps loginsteps;
	
	public Contract_Steps(VASTBaseTest vastbasetest, Login_Steps loginsteps) {
		this.vastbasetest=vastbasetest;
		this.loginsteps=loginsteps;
	}
	
	@Given("^user selects \"([^\"]*)\" card$")
	public void user_selects_card(String arg1) throws Throwable {
		vastbasetest.webelementHandler.clickElementByText(ObjectRepository.getobjectLocator("Sub-Product_type"), arg1);		
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName)); 
	}

	@Given("^user validates that \"([^\"]*)\" is displayed$")
	public void user_validates_that_is_displayed(String arg1) throws Throwable {
		vastbasetest.webelementHandler.isDisplayed(ObjectRepository.getobjectLocator(arg1));
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName)); 
	}

	@Given("^user validates value in \"([^\"]*)\" with expected value \"([^\"]*)\"$")
	public void user_validates_value_in_with_expected_value(String locator, String evalue) throws Throwable {
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getAttribute(ObjectRepository.getString(locator), "value").contains(evalue));
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName));  
	}
}
