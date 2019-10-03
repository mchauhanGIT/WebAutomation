package stepDefinations;

import com.cucumber.listener.Reporter;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.prodigylabs.config.ObjectRepository;
import net.prodigylabs.handlers.VerificationHandler;

public class Login_Steps{

	String sName = null;
	
	private VASTBaseTest vastbasetest;
	
	public Login_Steps(VASTBaseTest vastbasetest) {
		this.vastbasetest=vastbasetest;
	}
	
	@Before()
	public void setup(Scenario scenario) throws Exception {		
		System.out.println("Executing Before of Step Defination");
		sName=scenario.getName();
	}
	
	@After()
	public void tearDown() throws Exception {		
		System.out.println("Executing After of Step Defination");
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(sName));  
		vastbasetest.driver.quit();
	}
	
	@Given("^User launches the Vast application \"([^\"]*)\"$")
	public void user_launches_the_Vast_application(String url) throws Throwable {
		vastbasetest.driver.get(url);
	    Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(sName));  
	}

	@Given("^user enters text \"([^\"]*)\" in textbox \"([^\"]*)\"$")
	public void user_enters_text_in_textbox(String arg1, String arg2) throws Throwable {
		vastbasetest.webelementHandler.enterText(ObjectRepository.getobjectLocator(arg2), arg1);
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(sName));
	}

	@Given("^user clicks on button \"([^\"]*)\"$")
	public void user_clicks_on_button(String arg1) throws Throwable {
		vastbasetest.webelementHandler.clickButton(ObjectRepository.getobjectLocator(arg1));
        Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(sName));  
	}
	
	@Then("^user is on \"([^\"]*)\"$")
	public void user_is_on(String arg1) throws Throwable {
		Thread.sleep(2000);
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.isDisplayed(ObjectRepository.getobjectLocator(arg1)));
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(sName));  
	}
	
	@Given("^user validates \"([^\"]*)\" with expected value \"([^\"]*)\"$")
	public void user_validates_with_expected_value(String arg1, String arg2) throws Throwable {
		VerificationHandler.verifyTrue(vastbasetest.webelementHandler.getText(ObjectRepository.getobjectLocator(arg1)).contains(arg2));
		Reporter.addScreenCaptureFromPath(vastbasetest.screenshot.captureScreenShot(sName));  
	}
	
	@Given("^user waits for page to load$")
	public void user_waits_for_page_to_load() throws Throwable {
		vastbasetest.webelementHandler.waitforinvisibilityofElement(ObjectRepository.getobjectLocator("Spinner"));
	}
}
