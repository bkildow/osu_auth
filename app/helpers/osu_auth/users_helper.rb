module OsuAuth
  module UsersHelper

    def create_user_link
      if policy(@users).create?
        link_to new_user_path, class: 'btn btn-primary', role: 'button' do
          raw('<span class="glyphicon glyphicon-plus"></span> New User')
        end
      end
    end

    def edit_user_link(user)
      if policy(user).update?
        link_to 'Edit', edit_user_path(user)
      end
    end

    def delete_user_link(user)
      if policy(user).destroy?
        link_to 'Delete', user_path(user), method: :delete, data: {confirm: 'Are you sure?'}
      end
    end

    def masquerade_user_link(user)
      if policy(user).masquerade?
        link_to 'Login', masquerade_user_path(user)
      end
    end

  end
end
