require 'rails_helper'

module OsuAuth
  describe RolesController do
    it 'should inherit AdminController if set' do
      expect(OsuAuth::RolesController < AdminController).to be_truthy
    end
  end
end
