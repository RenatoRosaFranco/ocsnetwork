class Contact
    include ActiveModel::Conversion
    include ActiveModel::Validations

    attr_accessor :name, :phone, :email, :message

    def inititalize(params = {})
      @name = params[:name]
      @phone = params[:phone]
      @email = params[:email]
      @message = params[:message]
    end

    def persisted?
      false
    end

    def sendEmail
      begin
        ContactMailer.sended(self).delive_now
        ContactMailer.received(self).deliver_later
      rescue => exception
        raise StandardError, exception
      end
    end

    validates :name,
              presence: true,
              uniqueness: false,
              allow_blank: false,
              length: {minimum: 3, maximum: 30}

    validates :phone,
              presence: true,
              uniqueness: false,
              allow_blank: false,
              length: {minimum: 3, maximum: 15}

    validates :email,
              presence: true,
              uniqueness: false,
              allow_blank: false,
              length: {minimum: 3, maximum: 245}

    validates :message,
              presence: true,
              uniqueness: false,
              allow_blank: false,
              length: {minimum: 3, maximum: 800}

end
