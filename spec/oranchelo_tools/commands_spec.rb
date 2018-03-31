require 'spec_helper'
require 'oranchelo_tools/commands'

RSpec.describe OrancheloTools::Commands do
  let(:base_class) { 'Command' }
  let(:utils_methods) { OrancheloTools::Utils.instance_methods }

  it "extends module 'OrancheloTools::Utils'" do
    expect(
      OrancheloTools::Commands.public_methods & utils_methods
    ).to match_array(utils_methods)
  end

  it "has a base class called 'Command'" do
    expect(OrancheloTools::Commands.base_class).to eql(base_class)
  end

  it "include a default command called 'None'" do
    expect(OrancheloTools::Commands.classes.include?(:None)).to be true
  end

  it 'does not include the base class as a command' do
    expect(
      OrancheloTools::Commands.all.include?(OrancheloTools::Commands::Command)
    ).to be false
  end

  it 'has command names in lowercase' do
    expect(
      OrancheloTools::Commands.names
    ).to eql(OrancheloTools::Commands.names.map(&:downcase))
  end
end
