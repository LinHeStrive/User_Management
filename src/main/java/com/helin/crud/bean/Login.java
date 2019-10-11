package com.helin.crud.bean;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class Login {

	// String userName;
	// String passWord;

	public Login() {

	}

	public void setUserName(WebDriver driver, String userName) {

		WebElement username = driver.findElement(By.id("username"));// ��λ�û��������
		username.sendKeys(userName);// �����û���root
	}

	public void setPassWord(WebDriver driver, String passWord) {

		WebElement password = driver.findElement(By.id("password"));// ��λ���������
		password.sendKeys(passWord);// ��������root
	}

	public void clickLogin(WebDriver driver) {

		WebElement loginbtn = driver.findElement(By.xpath("//input[@value='�� ¼']"));// ��λ��¼��ť��xpath���·��
		// xpath����·��
		// ("html/body/div[1]/div/div/form/label[4]/input[@value='��
		// ¼']"));//("html/body/div[1]/div/div/form/label[4]/input[1]"));//
		loginbtn.click();// �����¼��ť
	}

	public void clickCancel(WebDriver driver) {
		WebElement loginbtn = driver.findElement(By.xpath("//input[@value='ȡ ��']"));// ��λ��¼��ť��xpath���·��
		loginbtn.click();// �����¼��ť
	}
}
