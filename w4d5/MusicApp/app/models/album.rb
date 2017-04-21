class Album < ApplicationRecord
  validates :name, :studio, :band_id, presence: true

  belongs_to :band

  has_many :tracks,
    dependent: :destroy
end
