module GitLove 
  module GitConfig
    def self.current_user
      name = `git config --global --get user.name`
      email = `git config --global --get user.email`

      unless name.nil? && email.nil?
        user = Users.get_by_email(email)
        unless user
          return name, email, abbreviation
        end
        return user.name, user.email, "no alias"
      end
    end

    def self.change_user(user)
      `git config --global user.name "#{user.name}"`
      `git config --global user.name "#{user.email}"`
    end
  end
end