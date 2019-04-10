module Template
    module Business
        module Commands
            class GenerateId
                def execute
                    SecureRandom.uuid
                end
            end
        end
    end
end