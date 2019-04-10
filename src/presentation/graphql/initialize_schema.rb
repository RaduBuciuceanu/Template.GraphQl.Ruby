require 'graphql'
require 'active_support'
require './src/business/models/person'

module Template
    module Presentation
        module Graphql
            class InitializeGraphql
                SCHEMA_FOLDER_PATH = "src/presentation/graphql/schema/**/*.graphql"

                def initialize(create_person)
                    @resolve = {
                        :Query => {
                            :getPersons => ->(_, __, ___) {'Persons here.'},
                        },
                        :Mutation => {
                            :create_person => ->(_, arguments, __) {
                                input_model = map_to_model(arguments.input, Template::Business::Models::Inputs::PersonInput)
                                create_person.execute(input_model)
                            },
                        },
                    }
                end

                def execute
                    content = ''
                    Dir.glob(SCHEMA_FOLDER_PATH).each {|path| content += File.read(path)}
                    GraphQL::Schema.from_definition(content, default_resolve: @resolve)
                end

                private

                def map_to_model(source, destination)
                    instance = destination.new

                    source.public_methods(false).each do |method|
                        if instance.public_methods(false).any? {|instance_method| instance_method.to_s == "#{method.to_s}="}
                            instance.send("#{method.to_s}=", source.send(method))
                        end
                    end

                    instance
                end
            end
        end
    end
end

