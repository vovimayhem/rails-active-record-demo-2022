# frozen_string_literal: true

require 'system_helper'

RSpec.describe 'Home page', type: :system do
  let(:example_user) { create :user }

  scenario 'visit the home page' do
    visit root_path

    expect(page).to have_content 'Hello!'
  end
end
