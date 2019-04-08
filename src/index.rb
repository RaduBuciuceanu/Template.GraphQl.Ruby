require './src/presentation/ioc/container'
require './src/business/models/person'

module Template
    create_person = Presentation::Ioc::Container[:create_person]
    get_person = Presentation::Ioc::Container[:get_person]

    person = Business::Models::Person.new
    person.id = 'Random id here.'
    person.first_name = 'Random first name here.'
    person.last_name = 'Random first name here.'

    create_person.execute(person)
    p get_person.execute(person.id)
end
