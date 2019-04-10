require 'rspec'
require './src/presentation/ioc/container'
require './src/presentation/graphql/initialize_schema'
require 'active_support'

describe Template::Presentation::Graphql::InitializeGraphql do
    subject(:instance) {described_class.new(Template::Presentation::Ioc::Container[:create_person])}

    describe 'execute' do
        it 'does not return nil' do
            actual = instance.execute

            expect(actual).not_to be_nil
        end
    end
end