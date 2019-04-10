require 'factory_bot'
require './src/business/models/inputs/person_input'

FactoryBot.define do
    factory :person_input, {class: Template::Business::Models::Inputs::PersonInput} do
        first_name {'Random first name here.'}
        last_name {'Random last name here.'}
    end
end
