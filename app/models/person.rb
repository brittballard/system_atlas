class Person < ActiveRecord::Base
  include EntityDefinition
  
  belongs_to :user
  attr_readonly :email
  before_create :associate_user
  
  validates_presence_of(:email)
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
  
  private
    
    def associate_user
      user = User.where(:email => self.email).first unless self.user_id.present?
      self.user_id = user.id unless user.nil?
    end
    
end
