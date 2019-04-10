require 'rspec'
require './src/business/commands/persons/person_input_to_person'

describe Template::Business::Commands::Persons::PersonInputToPerson do
    let(:generate_id) {double(:execute => 'Random id here.')}
    let(:person_input) {build(:person_input)}

    subject(:instance) {described_class.new(generate_id)}

    context 'execute' do
        it 'invokes execute from generate_id command' do
            instance.execute(person_input)

            expect(generate_id).to have_received(:execute)
        end

        it 'id is set' do
            actual = instance.execute(person_input)

            expect(actual.id).to eq('Random id here.')
        end

        it 'first_name is set' do
            actual = instance.execute(person_input)

            expect(actual.first_name).to eq(person_input.first_name)
        end

        it 'last_name is set' do
            actual = instance.execute(person_input)

            expect(actual.last_name).to eq(person_input.last_name)
        end
    end
end