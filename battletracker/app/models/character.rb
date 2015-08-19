class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  # has_and_belongs_to_many :encounters

  validates :name, presence: true
  validates :total_hp, presence: true
  validates :armor_class, presence: true
  validates :initiative, presence: true
  validates :user_id, presence: true

  # def reset_current_hp
  #   hp = total_hp
  #   @current_hp = hp
  # end
  #
  # def receive_damage(damage)
  #   @current_hp -= damage
  # end
  #
  # def killed
  #   alive = false
  # end

end
