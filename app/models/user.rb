class User < ActiveRecord::Base
    has_secure_password
    has_many :items
    validates_presence_of :username, :password, :neighborhood
    validates_uniqueness_of :username
end
