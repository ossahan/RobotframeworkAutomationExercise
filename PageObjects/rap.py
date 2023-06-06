import time

from selenium import webdriver

# Tarayıcıyı başlatın (Örneğin, Chrome için)
driver = webdriver.Chrome()  # ChromeDriver'ın yolunu belirtin

# Gmail'in giriş sayfasını açın
driver.get('https://www.gmail.com')
driver.maximize_window()
time.sleep(3)

# Oturum açma bilgilerini girin
email_input = driver.find_element_by_id('identifierId')
email_input.send_keys('osmansahan@gmail.com')  # E-posta adresinizi buraya yazın
driver.implicitly_wait(5000)

next_button = driver.find_element_by_id('identifierNext')
next_button.click()

password_input = driver.find_element_by_name('password')
password_input.send_keys('your_password')  # Parolanızı buraya yazın

sign_in_button = driver.find_element_by_id('passwordNext')
sign_in_button.click()