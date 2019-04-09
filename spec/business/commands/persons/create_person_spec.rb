require 'rspec'
require './src/business/commands/persons/create_person'
require './src/business/models/person'

describe Template::Business::Commands::Persons::CreatePerson do
    let(:person) {build_person}
    let(:repository) {double(:insert => person)}

    subject(:instance) {described_class.new(repository)}

    context 'execute' do
        it 'invokes insert from person repository with right person' do
            expect(repository).to receive(:insert).with(person)

            instance.execute(person)
        end

        it 'returns person returned by insert from person repository' do
            actual = instance.execute(person)

            expect(actual).to be(person)
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