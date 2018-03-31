require 'spec_helper'

RSpec.describe OrancheloTools do
  it 'has a gem version' do
    expect(OrancheloTools::VERSION).not_to be nil
  end

  it 'has a gem name' do
    expect(OrancheloTools::GEM_NAME).not_to be nil
  end

  it 'has a icon theme package name' do
    expect(OrancheloTools::PACKAGE_NAME).not_to be nil
  end

  it 'has a icon theme name' do
    expect(OrancheloTools::THEME_NAME).not_to be nil
  end
end
