class Journal < ActiveRecord::Base
  has_many :adventures, dependent: :destroy
end
