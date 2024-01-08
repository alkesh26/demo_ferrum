desc "Evaluate Javascript"
task :javascript do
  browser = Ferrum::Browser.new

  begin
    page = browser.create_page
    page.go_to "https://books.toscrape.com/"

    result = page.evaluate("1 + 2")
    puts result # 3

    title = page.evaluate("document.title")
    puts title # All products | Books to Scrape - Sandbox
  end  
end
