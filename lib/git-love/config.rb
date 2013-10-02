module GitLove 
  module GitConfig
    def self.current_user
      name = `git config --global --get user.name`
      email = `git config --global --get user.email`
      return name.strip, email.strip
    end

    def self.change_user(user_or_paired_user)
      `git config --global user.name "#{user_or_paired_user.name}"`
      `git config --global user.email "#{user_or_paired_user.email}"`
    end
  end
end