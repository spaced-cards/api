class JwtDenylist < ApplicationRecord #:nodoc:
  include Devise::JWT::RevocationStrategies::Denylist
  self.table_name = 'jwt_denylists'
end
