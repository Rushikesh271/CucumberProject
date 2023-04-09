package CucumberTest;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

public class CucumberTest{
	
	WebDriver driver1=null;
	
	@Given("Url is given.")   
	public void setup() {
		
		System.setProperty("webdriver.chrome.driver","Driver/chromedriver");
		//ChromeOptions options=new ChromeOptions();
		//options.addArguments("headless");
		driver1=new ChromeDriver();
	}
	
	@When("URL is loading") 
	public void URLLoading() {
		
		driver1.get("http://selenium.dev");
	}
	
	@Then("Page Should Open.")  
	public void End() {
		
		driver1.quit();
		
	}

}
