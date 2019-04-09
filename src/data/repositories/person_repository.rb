require './src/business/repositories/person_repository'

module Template
    module Data
        module Repositories
            class PersonRepository < Business::Repositories::PersonRepository
                def initialize
                    @persons = []
                end

                def insert(person)
                    id_already_exists = @persons.any? {|currentPerson| currentPerson.id == person.id}
                    raise ArgumentError.new('Id already exists.') if id_already_exists
                    @persons << person
                end

                def get(id)
                    found = @persons.select {|person| person.id == id}
                    raise ArgumentError.new 'Id does not exist.' unless found.any?
                    found.first
                end
            end
        end
    end
end