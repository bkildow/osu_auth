namespace :osu_auth do
  desc 'Lists all super admin users'
  task admins: :environment do
    users = OsuAuth::User.where(super_admin: true)
    users.each do |user|
      puts "#{user.display_name} (#{user.name_n}, #{user.emplid})"
    end
  end

  desc 'Removes super admin privileges for a user'
  task remove_admin: :environment do
    if ENV['name_n'].nil?
      puts 'Specify a name_n: `rake osu_admin:remove_admin name_n=buckeye.1`'
    else
      name_n = ENV['name_n']
      user = OsuAuth::User.find_by_name_n(name_n: name_n)
      if user.nil?
        abort("User #{name_n} does not exist")
      end
      user.super_admin = false
      if user.save
        puts "#{user.display_name} was successfully removed as an admin."
      else
        puts "Error saving. #{user.display_name} was not removed as an admin"
      end
    end
  end

  desc 'Gives super admin privileges to a user'
  task add_admin: :environment do
    if ENV['name_n'].nil?
      puts 'Specify a name_n: `rake osu_admin:add_admin name_n=buckeye.1`'
    else
      name_n = ENV['name_n']
      user = OsuAuth::User.find_by_name_n(name_n: name_n)
      if user.nil?
        abort("User #{name_n} does not exist")
      end
      user.super_admin = true
      if user.save
        puts "#{user.display_name} was successfully added as an admin."
      else
        puts "Error saving. #{user.display_name} was not added as an admin"
      end
    end
  end

end
