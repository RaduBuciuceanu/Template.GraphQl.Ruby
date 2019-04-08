require 'rspec'
require './src/data/repositories/person_repository'
require './src/business/models/person'

PersonRepository = Template::Data::Repositories::PersonRepository
Person = Template::Business::Models::Person

describe 'PersonRepository' do
    before do
        @instance = PersonRepository.new
        @existent_person = build_person
    end

    context :insert do
        it 'returns inserted person' do
            @instance.insert(Person.new)
        end
    end

    context :get do
        before do
            @instance.insert(@existent_person)
        end

        it 'returns person when id exists' do
            actual = @instance.get(@existent_person.id)

            expect(actual).to equal(@existent_person)
        end

        it 'throws when id does not exist' do
            nonexistent_id = 'Nonexistent id here.'

            expect {@instance.get(nonexistent_id)}.to raise_error ArgumentError, 'Id does not exist.'
        end
    end

    private

    def build_person
        person = Person.new
        person.id = 'Random id here.'
        person.first_name = 'Random first name here.'
        person.last_name = 'Random last name here.'
        person
    end
end