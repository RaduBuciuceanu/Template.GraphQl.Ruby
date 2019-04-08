require_relative 'business/models/person'

Person = Business::Models::Person

person = Person.new
person.first_name = 'First name'

puts person.first_name
