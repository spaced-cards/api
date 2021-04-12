# frozen_string_literal: true

class UserSerializer #:nodoc:
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :created_at
end
