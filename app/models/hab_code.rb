class HabCode < ActiveRecord::Base
  belongs_to :coach
  validates_presence_of :code

  scope :assigned, -> { where( :assigned => true) }
  scope :unassigned, -> {  where( :assigned => false) }
  scope :completed, -> { where.not( :completed => nil) }
  scope :incomplete, -> { where( :completed => nil) }
  scope :debriefed, -> { where( :debriefed => true) }
  #not working
  scope :assigned_sorted, ->(sort) { assigned.order(sort) }
  scope :unassigned_sorted, ->(sort) { unassigned.order(sort) }

  def self.assigned_old(sort)
    where(:assigned => true).order(sort)
  end

  def self.unassigned_old(sort)
    where(:assigned => false).order(sort)
  end

  def self.assigned(sort, search=nil)
    if search
      where('assigned = ? AND (first_name like ? OR last_name like ? OR code like ? OR email like ? )', true, "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").order(sort)
    else
      where(:assigned => true).order(sort)
    end
  end

  def self.unassigned(sort, search=nil)
    if search
      where('assigned = ? AND (first_name like ? OR last_name like ? OR code like ? OR email like ? )', false, "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").order(sort) unless search.nil?
    else
      where(:assigned => false).order(sort)
    end
  end

  def name
    first_name + ' ' + last_name
  end
end
