class Tournament < ActiveRecord::Base
  has_many :regions
  has_many :brackets

  def first_region
    regions[0]
  end

  def second_region
    regions[1]
  end

  def third_region
    regions[2]
  end

  def fourth_region
    regions[3]
  end
end
