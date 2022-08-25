class Note < ApplicationRecord
    enum status: [:created, :deleted]
end
