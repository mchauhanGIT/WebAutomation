package stepDefinations;

import com.cucumber.listener.Reporter;

import cucumber.api.java.en.Given;
import net.prodigylabs.config.ObjectRepository;
import net.prodigylabs.handlers.VerificationHandler;

public class Contract_Steps {
	
	private VASTBaseTest vastbasetest;
	private Login_Steps loginsteps;
	
	public Contract_Steps(VASTBaseTest vastbasetest, Login_Steps loginsteps) {
		this.vastbasetest=vastbasetest;
		this.loginsteps=loginsteps;
	}
		
	@Given("^user selects \"([^\"]*)\" from \"([^\"]*)\"$")
	public void user_selects_from(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.clickElementByText(ObjectRepository.getobjectLocator(arg2), arg1);		
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName)); 
	}
	
	@Given("^user validates that \"([^\"]*)\" is displayed$")
	public void user_validates_that_is_displayed(String element) throws Throwable {
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.isDisplayed(ObjectRepository.getString(element)));
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(loginsteps.sName)); 
	}
	

}
