class Street < ActiveRecord::Base
  def add_suffix(base, tail)
    return base + " " + tail
  end
end
