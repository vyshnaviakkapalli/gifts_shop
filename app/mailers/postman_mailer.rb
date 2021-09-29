class PostmanMailer < ApplicationMailer
	def purchased(amount)
		@amount=amount
		mail(:to=>'akkapallivyshnavi@gmail.com',:subject=>'your purchase is succussfully added')
				
	end		
end
