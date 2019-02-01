class Event < ApplicationRecord
    belongs_to :user
    belongs_to :midpoint
    has_many :invites;
end
