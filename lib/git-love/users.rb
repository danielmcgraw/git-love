require 'fileutils'

module GitLove
  class Users
    attr_reader :users
    def initialize(config_file)
      @config_file = config_file
      @users = []

      setup!
    end

    def exists?(abbreviation)
      users.each do |user|
      	if user.abbreviation == abbreviation
      	  return true
      	end
      end
      false
    end

    def get_by_email(email)
      users.each do |user|
      	if user.email == email
      	  return user
      	end
      end
    end

    def get(abbreviation)
      users.each do |user|
      	if user.abbreviation == abbreviation
      	  return user
      	end
      end
    end

    def add(user)
      @users << user
    end

    def delete(abbreviation)
      if exists?(abbreviation)
      	@users.delete_if do |user|
          user.abbreviation == abbreviation
        end
      end
    end

    def save!
      File.open @config_file, 'w' do |file|
        users.each do |user|
          file.puts "#{user.name}, #{user.email}, #{user.abbreviation}"
        end
      end
    end

    def setup!
      create_config!
      load_config
      load_users
    end

    def create_config!
      unless File.exists? File.dirname(@config_file)
        Dir.mkdir(File.dirname(@config_file))
        FileUtils.touch(@config_file)
      end
    end
       
    def load_config
      @config = File.read(@config_file)
    end

    def load_users
      @config.scan(/^([^,]*),([^,]*),([^,]*)$/) do |name, email, abbreviation|
        @users << User.new(name, email, abbreviation)
      end
    end
  end
end