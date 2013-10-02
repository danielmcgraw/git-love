module GitLove
  class User
  	attr_reader :name, :email, :abbreviation

  	def initialize(name, email, abbreviation)
  	  @name = name.strip
  	  @email = email.strip
  	  @abbreviation = abbreviation.nil? ? name.split.map{|x| x[0]}.join().downcase.strip : abbreviation.downcase.strip
    end
  end
end