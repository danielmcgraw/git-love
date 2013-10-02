module GitLove
  class Pair
  	attr_reader :name, :email, :abbreviation

  	def initialize(names, emails)
  	  @name = pair_name(names)
  	  @email = pair_email(emails)
    end

    def pair_name(names)
    	names.join(" + ")
    end

    def pair_email(emails)
    	email_domain = emails[0].split('@')[1]
    	email_user_names = []
    	for email in emails
    		email_user_names.push(email.split('@')[0])
    	end
    	email_user_names.join('+') + '@' + email_domain
    end
  end
end