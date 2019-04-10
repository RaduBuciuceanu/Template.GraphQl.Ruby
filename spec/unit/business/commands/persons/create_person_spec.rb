require 'rspec'
require './src/business/commands/persons/create_person'
require './src/business/models/person'

describe Template::Business::Commands::Persons::CreatePerson do
    let(:person_input) {build(:person_input)}
    let(:person) {build(:person_model)}
    let(:repository) {double(:insert => person)}
    let(:person_input_to_person) {double(:execute => person)}

    subject(:instance) {described_class.new(person_input_to_person, repository)}

    context 'execute' do
        it 'invokes execute from person_input_to_person with right input' do
            instance.execute(person_input)

            expect(person_input_to_person).to have_received(:execute).with(person_input)
        end

        it 'invokes insert from person_repository with person returned by mapper' do
            instance.execute(person_input)

            expect(repository).to have_received(:insert).with(person)
        end

        it 'returns person returned by insert from person_repository' do
            actual = instance.execute(person_input)

            expect(actual).to be(person)
        end
    end
end