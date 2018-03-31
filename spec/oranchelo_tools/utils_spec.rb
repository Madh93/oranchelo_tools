require 'spec_helper'
require 'oranchelo_tools/utils'

RSpec.describe OrancheloTools::Utils do
  let(:utils_methods) { OrancheloTools::Utils.instance_methods }

  it 'has some utils methods' do
    expect(utils_methods.size).not_to be 0
  end
end
