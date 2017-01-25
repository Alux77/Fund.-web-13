class Count < ActiveRecord::Base
    # ej. User.authenticate('fernando@codea.mx', 'qwerty')

  include ActiveModel::Validations

    validates_uniqueness_of :user, :email, :password, message: ': already asigned'
    validates_length_of :user, :minimum => 2, message: ': 2 characters minimum'
    validates_length_of :password, :minimum => 4, message: ': 4 characters minimum please'
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: ': incorrect!!' }
    validates_confirmation_of :email, :password, message: ': doesn´t match'

  def self.authenticate(email, password)
    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil

    if self.exists?(email: email)

      user = self.find_by(email: email)
        if password == user.password
          user
        else
          nil
        end
    end
  end

end