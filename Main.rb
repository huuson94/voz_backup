require './Post.rb'
require './Crawler.rb'
crawler = Crawler.new
thread_no = ARGV[0]
start_page = ARGV[1]
end_page = ARGV[2]
crawler.start_crawl thread_no, start_page, end_page

