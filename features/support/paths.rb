module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
      when /the home\s?page/
        '/'
      when /the login page/
        new_user_session_path
      when /the registration page/
        new_user_registration_path
      when /the new "(.+)" page/
        send("new_#{($1).gsub(/ /, "").underscore}_path")
      when /the edit "(.+)" page for id (\d+)/
        edit_entity_definition($1, $2)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
  
  def edit_entity_definition(type, id)
    send("edit_#{(type).gsub(/ /, "").underscore}_path", id)
  end
end

World(NavigationHelpers)
