class Record < ApplicationRecord
  belongs_to :user  
  
  validates :sauna_name, presence: true
  validates :sauna_tempureture, presence: true
  validates :water_tempurature, presence: true
　validates :tempreture, presence: true
  validates :wether, presence: true
  validates :sets, presence: true
　validates :sauna_time, presence: true
  validates :water_time, presence: true
  validates :totonoi_time, presence: true
　validates :sauna_type, presence: true
  validates :rouryu, presence: true
  validates :totonoi_ratio, presence: true
  validates :start_time, presence: true


end