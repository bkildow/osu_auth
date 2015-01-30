module OsuAuth
  module RolesHelper

    def create_role_link
      if policy(@roles).create?
        link_to new_role_path, class: 'btn btn-primary', role: 'button' do
          raw('<span class="glyphicon glyphicon-plus"></span> New Role')
        end
      end
    end

    def edit_role_link(role)
      if policy(role).update?
        link_to 'Edit', edit_role_path(role)
      end
    end

    def delete_role_link(role)
      if policy(role).destroy?
        link_to 'Delete', role_path(role), method: :delete, data: {confirm: 'Are you sure?'}
      end
    end
  end
end
