require 'rspec'
require 'rspec-expectations'
require 'selenium-webdriver'

describe 'Autotheme1' do

  before(:each) do

    @driver = Selenium::WebDriver.for(:remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :firefox)

    @site_url = '192.168.0.113'
    @base_url = "http://#{@site_url}:8080"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    @accept_next_alert = true
    @screen_shot = rand(1..999999999999)
    puts @screen_shot
    @email1 = 'anwar'
    @email2 = '@'
    @email3 = "#{@screen_shot}"
    @email4 = '.com'
    @email = @email1 + @email2 + @email3 + @email4
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it 'Login with valid user and password' do
    @driver.get(@base_url + '/')
    sleep 2
    @driver.find_element(:id, 'email').clear
    @driver.find_element(:id, 'email').send_keys ("#{@email}")
    @driver.find_element(:xpath, '/html/body/div/form/input[2]').clear
    @driver.find_element(:xpath, '/html/body/div/form/input[2]').send_keys 'xxxxxx'
    @driver.find_element(:id, 'loginButton').click
    @driver.save_screenshot ("spec/screenshot/#{@screen_shot}.png")
    @driver.title.should == 'App'
    puts "\ncurrent URL => #{@driver.current_url}"
    @driver.find_element(:xpath, '/html/body/section[1]/nav/ul/li[4]/a/span').click
    sleep 3
    #uploader = @driver.find_element(id: 'uploadImage')
    #uploader = @driver.find(id: 'uploadImage')
    element = @driver.execute_script("return document.getElementById('uploadImage').value ='C:\Users\salema\Desktop\Koala.jpg';")
    target = driver.find_element(:xpath => '//*[@id="drop-zone"]/div[1]/div[2]')

    @driver.action.drag_and_drop(element, target).perform

  end

end
=begin
run {
  @driver.get 'http://localhost:8080/upload'
  uploader = @driver.find_element(id: 'uploadImage')
  uploader.send_keys 'C:\Users\salema\Desktop\Koala.jpg'
  uploader.submit

  uploaded_image = @driver.find_element(css: 'img').attribute('src')
  uploaded_image.should =~ /jpgKoala.jpg/
=end