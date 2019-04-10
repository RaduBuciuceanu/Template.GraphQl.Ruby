require 'rspec'
require './src/business/repositories/person_repository'

describe Template::Business::Repositories::PersonRepository do
    let(:person) {build(:person_model)}

    subject(:instance) {described_class.new}

    context 'insert' do
        it 'raises NotImplementedError' do
            expect {instance.insert(person)}.to raise_error(NotImplementedError)
        end
    end

    context 'get' do
        it 'raises NotImplementedError' do
            expect {instance.get(person.id)}.to raise_error(NotImplementedError)
        end
    end
end