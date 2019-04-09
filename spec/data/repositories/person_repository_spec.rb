require 'rspec'
require './src/data/repositories/person_repository'
require './src/business/models/person'

describe Template::Data::Repositories::PersonRepository do
    let(:person) {build_person}

    subject(:instance) {described_class.new}

    context 'insert' do
        it 'returns inserted person' do
            instance.insert(person)
        end

        it 'throws when id already exists' do
            instance.insert(person)

            expect {instance.insert(person)}.to raise_error(ArgumentError, 'Id already exists.')
        end
    end

    context 'get' do
        it 'returns person when id exists' do
            instance.insert(person)

            actual = instance.get(person.id)

            expect(actual).to equal(person)
        end

        it 'throws when id does not exist' do
            nonexistent_id = 'Nonexistent id here.'

            expect {instance.get(nonexistent_id)}.to raise_error(ArgumentError, 'Id does not exist.')
        end
    end

    private

    def build_person
        person = Template::Business::Models::Person.new
        person.id = 'Random id here.'
        person.first_name = 'Random first name here.'
        person.last_name = 'Random last name here.'
        person
    end
end