require './User.rb'
class Post
	attr_accessor :user, :content
	
	def content=(value)
		
=begin
		quote_block = value.search("td.alt2 div")
		if quote_block.nil? == false
			t_content += ">" 
			t_content += quote_block.search("td.alt2 div:nth-child(2)").text.strip	
			t_content += "<"  
		end
=end
		@content = value.text.strip
	end
	
end
