desc "Convert to PDF using Ferrum"
task :print_to_pdf do
  browser = Ferrum::Browser.new
  browser.go_to("https://books.toscrape.com/")

  pdf_data = browser.pdf(margin: 0)
  binding.pry
  
  File.open('report.pdf', 'wb') { |file| file.write(pdf_data) }

  browser.quit
end
