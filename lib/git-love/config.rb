module GitLove 
  module GitConfig
    def self.current_user
      name = `git config --global --get user.name`
      email = `git config --global --get user.email`
      return name.strip, email.strip
    end

    def self.change_user(user)
      `git config --global user.name "#{user.name}"`
      `git config --global user.email "#{user.email}"`
    end
  end
end