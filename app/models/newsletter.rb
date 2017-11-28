class Newsletter < ApplicationRecord
  self.table_name = 'newsletters'
  self.primary_key = 'id'

  scope :registered, ->{ where(status: true) }
  scope :unregistered, ->{ where(status: false) }

  def signup
    self.status = true
    self.token = SecureRandom.urlsafe_base64
    self.confirmed_at = Date.today
  end

  def cancel
    self.status = false
    self.token = nil
  end

  validates :name,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: {minimum: 3, maximum: 30}

  validates :email,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: {minimum: 3, maximum: 245}

  validates :token,
            uniqueness: true

end
