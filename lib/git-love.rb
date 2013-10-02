require 'git-love/user'
require 'git-love/users'
require 'git-love/config'
require 'git-love/version'

GIT_LOVE_FILENAME = 'users'
GIT_LOVE_DIRECTORY = File.expand_path '~/.git-love'

module GitLove

  @users = Users.new(File.join(GIT_LOVE_DIRECTORY, GIT_LOVE_FILENAME))

  def self.add(name, email, abbreviation=nil)
  	unless abbreviation_taken?(abbreviation)
	  	user = User.new(name, email, abbreviation)
	  	users.add(user)
      users.save!
	  	
	  	p "Added #{name} #{email} (#{abbreviation})"
    else
      p "Abbreviation '#{abbreviation}' already taken, please specify another"
		end
  end

  def self.delete(abbreviation)
  	if users.exists?(abbreviation)
      user = users.get(abbreviation)
  	  users.delete(abbreviation)
      users.save!

  	  p "Deleted user '#{user.name} #{user.email} (#{user.abbreviation})'"
  	else
  	  p "Could not find user '#{abbreviation}' to delete"
  	end
  end

  def self.list
  	p "Users:"
  	users.users.each do |user|
  	  p "#{user.name} #{user.email} #{user.abbreviation}"	
  	end
  end

  def self.show
    name, email = GitConfig.current_user
    
    unless name.nil? && email.nil?
      user = users.get_by_email(email)
      if user
        p "Current User: (#{user.abbreviation})"
      else
        p "Current User: (no abbreviation)"
      end
      p "user.name: #{user.name}"
      p "user.email: #{user.email}"
    else
      p "No Current User"
    end
  end

  def self.use(abbreviation)
    if users.exists?(abbreviation)
      user = users.get(abbreviation)
      GitConfig.change_user user
      self.show
    else
      p "No user with the abbreviation '#{abbreviation}'."
    end
  end

  def self.pair
  end

  def self.print_help
  	p "HELP!"
  end

  def self.print_version
  	GitLove.version
  end

  def self.users
  	@users
  end

  def self.abbreviation_taken?(abbreviation)
  	if users.exists?(abbreviation)
  	  p "Abbreviation '#{abbreviation}' already exists"
  	end
  end
end