require "administrate/field/base"

class SelectRoleField < Administrate::Field::Base
  def associated_resource_options
    %w(user manager admin)
  end

  def selected_option
    "user"
  end

  def to_s
    data
  end
end
