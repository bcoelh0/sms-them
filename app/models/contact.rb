class Contact < ApplicationRecord
  belongs_to :list
  has_many :messages
end
