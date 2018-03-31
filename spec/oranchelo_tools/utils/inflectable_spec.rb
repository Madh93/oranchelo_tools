require 'spec_helper'
require 'oranchelo_tools/utils/inflectable'

class RefinedClass
  using OrancheloTools::Utils::Inflectable

  def demodulize(name)
    name.demodulize
  end
end

RSpec.describe OrancheloTools::Utils::Inflectable do
  let(:refined) { RefinedClass.new }

  describe 'demodulizes module names' do
    context "when 'Build' is given" do
      it 'demodulizes default name' do
        expect(refined.demodulize('Build')).to eql('Build')
      end
    end

    context "when '::Build' is given" do
      it 'demodulizes name' do
        expect(refined.demodulize('::Build')).to eql('Build')
      end
    end

    context "when 'OrancheloTools::Commands::Build' is given" do
      it 'demodulizes nested names' do
        expect(refined.demodulize('OrancheloTools::Commands::Build')).to eql('Build')
      end
    end

    context 'when an empty string is given' do
      it 'returns the same empty value' do
        expect(refined.demodulize('')).to eql('')
      end
    end
  end
end
