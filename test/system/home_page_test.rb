require 'test_helper'

class HomePageTest < ActionDispatch::SystemTestCase
  def setup
    @browser = Ferrum::Browser.new
  end

  def teardown
    @browser.quit
  end

  test "visiting the homepage and interacting with elements" do
    @page = @browser.create_page
    @page.goto "http://localhost:3000/home"

    # Find an element using a CSS selector
    header = @page.at_css('h1')
    assert_equal "Welcome to Rails!", header.text

    # Fill in a form and submit it
    input_field = @page.at_xpath("//*[@id='name']")
    input_field.focus.type("Sam Example")
    @page.at_xpath("/html/body/form/input[2]").click

    # Assert the response
    assert @page.body.include?("Welcome Sam Example")
  end
end
