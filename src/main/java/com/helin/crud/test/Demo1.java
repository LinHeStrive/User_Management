package com.helin.crud.test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;  
  
public class Demo1 {  
    /** 
     * @param args 
     * @throws InterruptedException 
     */  
    public static void main(String[] args) throws InterruptedException {
    	System.setProperty("webdriver.chrome.driver", "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chromedriver.exe");  
    	WebDriver driver = new ChromeDriver();
    	String url =null;
    	String userName=null;
    	String password=null;
    	
    	//163ÓÊÏä×Ô¶¯µÇÂ¼
//        driver.get("https://mail.163.com/");
//        driver.manage().window().maximize();
//        Thread.sleep(5000);
//        WebElement frame1 = driver.findElement(By.xpath("//*[@id=\"loginDiv\"]/iframe"));
//        driver.switchTo().defaultContent();
//        driver.switchTo().frame(frame1);
//        driver.findElement(By.name("email")).clear();
//        driver.findElement(By.name("email")).sendKeys("18222717137");
//        Thread.sleep(5000);
//        driver.findElement(By.name("password")).clear();
//        driver.findElement(By.name("password")).sendKeys("helin9193");
//        Thread.sleep(5000);
//        driver.findElement(By.id("dologin")).click();
//        Thread.sleep(5000);
//        driver.quit();
    	
    	
    	
    	//qqÓÊÏä×Ô¶¯µÇÂ¼
//    	driver.get("https://mail.qq.com/cgi-bin/loginpage");
//        driver.manage().window().maximize();
//        driver.switchTo().frame("login_frame");
//        driver.findElement(By.id("switcher_plogin")).click();
//        driver.findElement(By.id("u")).clear();
//        driver.findElement(By.id("u")).sendKeys("972641143");
//        Thread.sleep(5000);
//        driver.findElement(By.id("p")).clear();
//        driver.findElement(By.id("p")).sendKeys("helin1996");
//        Thread.sleep(5000);
//        driver.findElement(By.id("login_button")).click();
//        Thread.sleep(5000);
//        driver.quit();
    	
    	//°Ù¶È
//    	driver.get("https://passport.baidu.com/v2/?login");
//        driver.manage().window().maximize();
//        //driver.switchTo().frame("login_frame");
//        driver.findElement(By.id("TANGRAM__PSP_3__footerULoginBtn")).click();
//        driver.findElement(By.name("userName")).clear();
//        driver.findElement(By.name("userName")).sendKeys("18222717137");
//        driver.findElement(By.name("password")).clear();
//        driver.findElement(By.name("password")).sendKeys("helin1996");
//        Thread.sleep(5000);
//        driver.findElement(By.id("TANGRAM__PSP_3__submit")).click();
//        Thread.sleep(5000);
//        driver.quit();
    	
    	//ÌÔ±¦
    	driver.get("https://login.taobao.com");
        driver.manage().window().maximize();
        //driver.switchTo().frame("login_frame");
        driver.findElement(By.xpath("/html/body/div/div[2]/div[3]/div/div/div[2]/div[4]/div/div[5]/a")).click();
        driver.findElement(By.xpath("/html/body/div/div[2]/div[3]/div/div/div[2]/div[3]/form/div[2]/span")).click();
        driver.findElement(By.name("TPL_username_1")).clear();
        driver.findElement(By.name("TPL_username_1")).sendKeys("18222717137");
        driver.findElement(By.name("password")).clear();
        driver.findElement(By.name("password")).sendKeys("helin1996");
        Thread.sleep(5000);
        driver.findElement(By.id("TANGRAM__PSP_3__submit")).click();
        Thread.sleep(5000);
        driver.quit();


    	  
    }  
}  