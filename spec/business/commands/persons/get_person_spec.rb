require 'rspec'
require 'factory_bot'
require './src/business/commands/persons/get_person'
require './src/business/models/person'

describe Template::Business::Commands::Persons::GetPerson do
    let(:person) {build(:person_model)}
    let(:person_repository) {double(:get => person)}

    subject(:instance) {described_class.new(person_repository)}

    context 'execute' do
        it 'invokes get from person repository' do
            expect(person_repository).to receive(:get).with(person.id)

            instance.execute(person.id)
        end

        it 'returns result returned by get from person repository' do
            actual = instance.execute(person.id)

            expect(actual).to be(person)
        end

        it 'raises when get from person repository raises' do
            allow(person_repository).to receive(:get).and_raise(ArgumentError)

            expect {instance.execute(person.id)}.to raise_error(ArgumentError)
        end
    end
end