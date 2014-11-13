require 'rails_helper'

module OsuAuth
  describe Permission do

    describe '.config' do
      it 'should merge permissions config hash' do
        OsuAuth::Permission.config do
          {perm1: 'permission one'}
        end

        expect(OsuAuth::Permission.permissions).to eq({perm1: 'permission one', edit_user: 'can edit users'})
      end
    end

    describe '.save_perms' do

      let(:perms) {[:perm_one, :perm_two, :perm_three]}

      it 'should save correctly' do
        role_id = 5
        Permission.save_perms(role_id, perms)
        expect(Permission.all.count).to eq(3)
      end

      it 'should not create duplicate records' do
        role_id = 5
        Permission.save_perms(role_id, perms)
        expect(Permission.all.count).to eq(3)

        Permission.save_perms(role_id, perms)
        expect(Permission.all.count).to eq(3)
      end
    end


  end
end
