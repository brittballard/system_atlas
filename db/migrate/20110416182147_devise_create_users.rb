class DeviseCreateUsers < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end
  
  def self.up
    change_table :users do |t|
      t.string :encrypted_password, :null => false, :default => '', :limit => 128 unless User.new.respond_to? :encrypted_password
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable
      t.remove :persistence_token
      t.remove :single_access_token
      t.remove :perishable_token
      t.remove :login_count
      t.remove :failed_login_count
      t.remove :last_request_at
      t.remove :current_login_at
      t.remove :last_login_at
      t.remove :current_login_ip
      t.remove :last_login_ip
      t.remove :openid_identifier
    end
    
    change_column(:users, :crypted_password, :string, :null => true)
    
    User.reset_column_information
    User.all.each do |user|
      user.encrypted_password = user.crypted_password
      user.save!
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :confirmation_token
      t.remove :confirmed_at
      t.remove :confirmation_sent_at
      t.remove :reset_password_sent_at
      t.remove :reset_password_token
      t.remove :remember_created_at
      t.remove :sign_in_count
      t.remove :current_sign_in_at
      t.remove :last_sign_in_at
      t.remove :current_sign_in_ip
      t.remove :last_sign_in_ip
      t.remove :failed_attempts
      t.remove :unlock_token
      t.remove :locked_at
      
      t.string    :persistence_token,   :null => false                # required
      t.string    :single_access_token, :null => false                # optional, see Authlogic::Session::Params
      t.string    :perishable_token,    :null => false                # optional, see Authlogic::Session::Perishability

      # Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
      t.integer   :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_request_at                                    # optional, see Authlogic::Session::MagicColumns
      t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns
      t.string    :current_login_ip                                   # optional, see Authlogic::Session::MagicColumns
      t.string    :last_login_ip                                      # optional, see Authlogic::Session::MagicColumns
      
      # OpenId stuff
      t.string    :openid_identifier
    end
    change_column(:users, :crypted_password, :string, :null => false)

    User.reset_column_information
    User.all.each do |user|
      user.crypted_password = user.encrypted_password
      user.save!
    end
  end
end
  
  
    # `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    # `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    # `persistence_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    # `single_access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    # `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    # `login_count` int(11) NOT NULL DEFAULT '0',
    # `failed_login_count` int(11) NOT NULL DEFAULT '0',
    # `last_request_at` datetime DEFAULT NULL,
    # `current_login_at` datetime DEFAULT NULL,
    # `last_login_at` datetime DEFAULT NULL,
    # `current_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    # `last_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    # `openid_identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
    # `organization_id` int(11) DEFAULT NULL,
    # `roles_mask` int(11) DEFAULT NULL,