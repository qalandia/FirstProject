require 'rspec'
require 'rspec-expectations'
require 'selenium-webdriver'
require 'win32ole'

  describe 'Autotheme' do

        before(:each) do

          @driver = Selenium::WebDriver.for(:remote, :url => 'http://localhost:4444/wd/hub', :desired_capabilities => :internet_explorer)

          @site_url = '192.168.0.113'
          @base_url = "http://#{@site_url}:8080"
          @driver.manage.timeouts.implicit_wait = 30
          @driver.get(@base_url)
          sleep 5
          #@driver.execute_script("window.resizeTo(screen.width,screen.height)")
          #@driver.execute_script("alert('Hello World');")
          @driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
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
          @driver.get(@base_url)
          @driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
          @driver.execute_script("alert('Hello World');")
          sleep 3
          @driver.find_element(:id, 'email').clear
          @driver.find_element(:id, 'email').send_keys ("#{@email}")
          @driver.find_element(:xpath, '/html/body/div/form/input[2]').clear
          @driver.find_element(:xpath, '/html/body/div/form/input[2]').send_keys 'xxxxxx'
          @driver.find_element(:id, 'loginButton').click
          @driver.find_element(:)
          @driver.find_element(:xpath, '/html/body/section[1]/nav/ul/li[1]/a/span').displayed?.should be_true
          @driver.save_screenshot ("screenshot/#{@screen_shot}.png")
          @driver.title.should == 'App'
          @driver.current_url.should == "http://#{@site_url}:8080/#{@email3}#/page:Home"
          @driver.current_url.should match(/#{@email3}/)
          @driver.current_url.should include("#{@email3}")
          @driver.current_url.should include("#/page:Home")
          @driver.current_url.should include(@email3)
          @driver.current_url.should_not include("xyz")

          puts "\ncurrent URL => #{@driver.current_url}"

        end

  end