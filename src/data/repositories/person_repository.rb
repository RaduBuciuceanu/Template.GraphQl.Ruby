require 'src/business/repositories/person_repository'

module Data::Repositories
    PersonRepositoryInterface = Business::Repositories::PersonRepository

    class PersonRepository < PersonRepositoryInterface
        private

        @persons = Array.new

        public

        def insert(person)
            @persons.push(person)
            person
        end

        def get(id)
            @persons.each {|person| person.id == id}.first
        end
    end
end