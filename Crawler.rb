require 'mechanize'
require './Post.rb'

class Crawler
	attr_accessor :page_address, :posts_array

	def initialize
		@agent = Mechanize.new
	end


	def start_crawl thread_no, start_page, end_page

		@posts_array = []
		(start_page..end_page).each do |page|
			puts "_____________________Page"+page.to_s+"__________________"
			@page_address =	"https://vozforums.com/showthread.php?t="+thread_no+"&page=" + page.to_s
			page = @agent.get @page_address
			list_posts = page.search "table.tborder.voz-postbit"	
			list_posts.each_with_index do |each_post, num|
				nickname = each_post.search("a.bigusername").text
				joindate = "joindate" 
				user = User.new nickname, joindate
				post = Post.new
				post.user = user
				value = each_post.search("div.voz-post-message")
				post.content =  value
				@posts_array[num] = post
				puts ">>>>start>>>>"
				puts post.content
				puts "<<<<end>>>>\n\n\n"
			end

		end
	end
end

