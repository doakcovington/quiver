class User < ActiveRecord::Base
    has_secure_password

    has_many :skis

    validates :name, presence: true #user must have a name
    validates :email, presence: true #user must have an email
    validates :password, presence: true #user must have a password
    validates_format_of :email, :with => /\w+@\w+\.\w+/

    #find the most common type of ski a user has?

    #wishlist?

    #quiver belongs to a user and has many skis 



end