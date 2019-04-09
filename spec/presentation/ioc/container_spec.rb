require 'rspec'
require './src/presentation/ioc/container'

describe Template::Presentation::Ioc::Container do
    subject(:instance) {described_class}

    it 'create_person is registered' do
        actual = instance[:create_person]

        expect(actual).to be_instance_of(Template::Business::Commands::Persons::CreatePerson)
    end

    it 'get_person is registered' do
        actual = instance[:get_person]

        expect(actual).to be_instance_of(Template::Business::Commands::Persons::GetPerson)
    end

    it 'person_repository is registered' do
        actual = instance[:person_repository]

        expect(actual).to be_instance_of(Template::Data::Repositories::PersonRepository)
    end
end