require 'rspec'
require './src/business/commands/generate_id'

describe Template::Business::Commands::GenerateId do
    subject(:instance) {described_class.new}

    context 'execute' do
        it 'does not return null' do
            actual = instance.execute

            expect(actual).not_to be_nil
        end

        it 'always returns unique ids' do
            actual = instance.execute

            expect(actual).not_to be(instance.execute)
        end
    end
end