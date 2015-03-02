class Team < ActiveRecord::Base
  attr_accessor :slot_id

  belongs_to :region
  has_many :slots

  before_validation :trim_university

  after_create :add_to_starting_slot

  def display_name
    "#{seed} #{name}"
  end

  private

  def trim_university
    self.name = name.downcase.gsub('university', 'U')
  end

  def add_to_starting_slot
    slot = Slot.find(slot_id)
    slot.update(team_id: id)
  end
end
