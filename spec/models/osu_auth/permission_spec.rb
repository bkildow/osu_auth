require 'rails_helper'

module OsuAuth
  describe Permission do

    describe '.config' do
      it 'should merge permissions config hash' do
        OsuAuth::Permission.config do
          [{name: :perm1, description: 'permission one'}]
        end

        # merged_perm = [
        #   {name: :edit_user, description: 'can edit users'},
        #   {name: :perm1, description: 'permission one'},
        # ]

        expect(OsuAuth::Permission.first.name).to eq(:edit_user)
        expect(OsuAuth::Permission.last.name).to eq(:perm1)
      end
    end

  end
end
