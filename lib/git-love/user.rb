module GitLove
  class User
  	attr_reader :name, :email, :abbreviation

  	def initialize(name, email, abbreviation)
  	  @name = name
  	  @email = email
  	  @abbreviation = abbreviation.nil? ? name.split.map{|x| x[0]}.join().downcase : abbreviation.downcase
    end
  end
end