class User < ActiveRecord::Base
    has_secure_password

    has_many :skis

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates_format_of :email, :with => /\w+@\w+\.\w+/

    #find the most common type of ski a user has?

    #wishlist?



end