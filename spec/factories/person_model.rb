require 'factory_bot'
require './src/business/models/person'

FactoryBot.define do
    factory :person_model, {class: Template::Business::Models::Person} do
        id {'Random id here.'}
        first_name {'Random first name here.'}
        last_name {'Random last name here.'}
    end
end
