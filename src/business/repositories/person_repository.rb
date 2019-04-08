module Template
    module Business
        module Repositories
            class PersonRepository
                def insert(person)
                    raise NotImplementedError.new
                end

                def get(id)
                    raise NotImplementedError.new
                end
            end
        end
    end
end