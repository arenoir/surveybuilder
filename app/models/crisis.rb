class Crisis < ActiveRecord::Base

  def label
    name + " (#{country})"
  end
end
