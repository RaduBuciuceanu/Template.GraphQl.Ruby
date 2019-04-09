require './src/business/repositories/person_repository'

module Template
    module Data
        module Repositories
            class PersonRepository < Business::Repositories::PersonRepository
                def initialize
                    @persons = []
                end

                def insert(person)
                    unless @persons.any? {|currentPerson| currentPerson.id == person.id}
                        @persons << person
                        return person
                    end

                    raise ArgumentError.new 'Id already exists.'
                end

                def get(id)
                    found = @persons.select {|person| person.id == id}

                    if found.any?
                        return found.first
                    end

                    raise ArgumentError.new 'Id does not exist.'
                end
            end
        end
    end
end