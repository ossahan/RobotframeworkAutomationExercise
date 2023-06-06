from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

driver = webdriver.Chrome('C:\development\chromedriver.exe')
def get_chromedriver_path():
    driver_path = ChromeDriverManager().install()
    print(driver_path)
    return  driver_path