class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
   after_create :assign_default_role 
 
  def assign_default_role
    add_role(:newbie)
    emails = ['456@456', 'abc@abc']
    if emails.include? self.email
      self.add_role(:admin)
    end
    emails = ['789@789']
    if emails.include? self.email
      self.add_role(:docs)
    end
  end
  
  
  has_many :question_ids
  has_many :posts
end
