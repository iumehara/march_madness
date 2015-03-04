class User < ActiveRecord::Base
  belongs_to :tournament

  has_many :brackets
end
