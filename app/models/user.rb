class User < ActiveRecord::Base

  has_and_belongs_to_many :roles
  has_one :profile, :dependent => :destroy

  after_create :create_public_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessor :role_id

  validates_presence_of :role_id

  def role?(role)
    !!self.roles.find_by_name(role.to_s.camelize)
  end

  def is_admin?
    self.role?(:admin)
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    provider = access_token.provider
    uid = access_token.uid

    user = User.where(:provider => provider, :uid => uid).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user

      user                          = self.new
      user.first_name               = data['first_name']
      user.last_name                = data['last_name']
      user.email                    = data['email']
      user.provider                 = provider
      user.uid                      = uid
      user.password                 = Devise.friendly_token[0,20]

      user.save(validate: true)
    end
    user
  end

  def self.from_twitter_omniauth(access_token)
    data = access_token.info
    provider = access_token.provider
    uid = access_token.uid

    user = User.where(:provider => provider, :uid => uid).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user

      first_name, last_name = get_first_and_last_name(access_token)

      user                          = self.new
      user.first_name               = first_name
      user.last_name                = last_name
      user.email                    = last_name + first_name + '@railspack.com'
      user.provider                 = provider
      user.uid                      = uid
      user.password                 = Devise.friendly_token[0,20]

      user.save(validate: false)
    end
    user
  end

  def self.create_from_omniauth_facebook(auth)

    first_name, last_name = get_first_and_last_name(auth)

    user                          = self.new
    user.first_name               = first_name
    user.last_name                = last_name
    user.provider                 = auth['provider']
    user.uid                      = auth['uid']
    user.password                 = Devise.friendly_token[0,20]

    user.save(validate: true)
    user
  end

  def self.get_first_and_last_name(auth)
    name = auth['info']['name'].split(/ /)
    length = name.length
    if length > 1
      last_name = name.pop(1).join(' ')
      first_name = name.join(' ')
    else
      first_name = auth['info']['name']
      last_name = ''
    end
    return first_name, last_name
  end

  def email_required?
    false
  end

  def create_public_profile
    name = self.email.split('@')[0]
    unless self.profile.present?
      profile = Profile.new(:user_id => self.id, :first_name => name, :last_name => 'change it')
      profile.save(validate: false)
    end
  end

  def assign_user_role(role_id)
    if role_id.nil?
      self.roles.destroy_all
      self.roles << Role.last
    else
      self.roles.destroy_all
      self.roles << Role.find(role_id)
    end
  end
end
