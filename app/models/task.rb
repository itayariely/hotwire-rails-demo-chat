class Task < ApplicationRecord
    enum status: [:todo, :completed, :deleted]
end
