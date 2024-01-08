# This file is used for scraping websites using Ferrum

namespace :scraping do
  desc "Crawl the Books To Scrape website"
  task :book_to_scrape do
    browser = Ferrum::Browser.new

    begin
      page = browser.create_page
      page.go_to "https://books.toscrape.com/"

      # Extract book titles and prices
      book_elements = page.css("article.product_pod")
      books = book_elements.map do |book_element|
          title = book_element.at_css("h3 a").text
          price = book_element.at_css("p.price_color").text
          { title: title, price: price }
      end

      puts books
    ensure
      browser.quit
    end
  end
end
