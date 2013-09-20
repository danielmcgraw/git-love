module GitLove
  class User
  	attr_reader :name, :email, :abbreviation

  	def initialize(name, email, abbreviation)
  	  @name = name
  	  @email = email
  	  @abbreviation = abbreviation
    end
  end
end