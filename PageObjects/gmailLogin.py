import time

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

print('Enter the gmailid and password')
gmailId, passWord = map(str, input().split())
time.sleep(3)



try:
	driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
	driver.get('https://accounts.google.com/signin/v2/identifier?continue='+\
	'https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1'+\
	'&flowName=GlifWebSignIn&flowEntry = ServiceLogin')
	driver.implicitly_wait(15)

	loginBox = driver.find_element_by_xpath('//*[@id ="identifierId"]')
	loginBox.send_keys(gmailId)



	nextButton = driver.find_elements_by_xpath('//*[@id ="identifierNext"]')
	nextButton[0].click()

	passWordBox = driver.find_element_by_xpath(
		'//*[@id ="password"]/div[1]/div / div[1]/input')
	passWordBox.send_keys(passWord)

	nextButton = driver.find_elements_by_xpath('//*[@id ="passwordNext"]')
	nextButton[0].click()

	print('Login Successful...!!')
except:
	print('Login Failed')


