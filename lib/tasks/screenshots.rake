desc "Take screenshots"
task :screenshots do
  browser = Ferrum::Browser.new

  begin
    page = browser.create_page
    page.go_to "https://books.toscrape.com/"
    
    # take screenshot of full page
    page.screenshot(path: "books.png", full: true)
  ensure
    browser.quit
  end   
end
