class Journal < ActiveRecord::Base
  belongs_to :user
  has_many :adventures, dependent: :destroy
end
