class Organization < ActiveRecord::Base
  has_many :users
  validates_presence_of :name
  validates_presence_of :address_line_one
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code

  before_save :assign_registration_code
  
  def self.filter(params)
    conditions = ['1 = 1 ']
    if params.has_key?(:name)
      conditions[0] += 'and name like ? '
      conditions << "#{params[:name]}%"
    end
    
    if params.has_key?(:address_line_one) && params[:address_line_one].present?
      conditions[0] += 'and address_line_one = ? '
      conditions << params[:address_line_one]
    end
    
    if params.has_key?(:address_line_two) && params[:address_line_two].present?
      conditions[0] += 'and address_line_two = ? '
      conditions << params[:address_line_two]
    end
    
    if params.has_key?(:city) && params[:city].present?
      conditions[0] += 'and city = ? '
      conditions << params[:city]
    end
    
    if params.has_key?(:state) && params[:state].present?
      conditions[0] += 'and state = ? '
      conditions << params[:state]
    end
    
    if params.has_key?(:postal_code) && params[:postal_code].present?
      conditions[0] += 'and postal_code = ? '
      conditions << params[:postal_code]
    end
    
    find(:all, :conditions => conditions)
  end
  
  private
  
    def assign_registration_code    
      registration_code = Organization.maximum(:registration_code) || 0 + 1 
    end
  
end
