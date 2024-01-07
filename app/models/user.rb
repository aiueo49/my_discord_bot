class User < ApplicationRecord
  has_many :study_times, dependent: :destroy
end
