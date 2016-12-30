require "administrate/field/base"

class SelectField < Administrate::Field::Base
  def associated_resource_options
    %w(active approved rejected)
  end

  def selected_option
    "active"
  end

  def to_s
    data
  end
end
