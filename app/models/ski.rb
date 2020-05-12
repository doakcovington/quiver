class Ski < ActiveRecord::Base
    belongs_to :user #one-to-one connection with user model
end
