class Bracket < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :region

  has_secure_password

  def total_points
    total_points = 0
    regions.each do |region|
      total_points += region.total_points
    end
  end
end
