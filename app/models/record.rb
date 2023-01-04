class Record < ApplicationRecord
  belongs_to :user

  validates :sauna_name, presence: true
  validates :sauna_tempureture, presence: true, numericality: {only_integer: true}
  validates :water_tempurature, presence: true, numericality: {only_integer: true}
  validates :tempreture, presence: true, numericality: {only_integer: true}
  validates :wether, presence: true
  validates :sets, presence: true, numericality: {only_integer: true}
  validates :sauna_time, presence: true, numericality: {only_integer: true}
  validates :water_time, presence: true, numericality: {only_integer: true}
  validates :totonoi_time, presence: true, numericality: {only_integer: true}
  validates :rouryu, presence: true
  validates :totonoi_ratio, presence: true
  validates :start_time, presence: true

end