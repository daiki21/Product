class User < ActiveRecord::Base
	has_many :links
	has_many :comments
	acts_as_votable
end
