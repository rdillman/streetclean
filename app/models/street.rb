class Street < ActiveRecord::Base
  has_many :blocks
  
  def get_side(addr)
    if addr.even?
      return "R"
    else
      return "L"
    end
  end
  
  
  
  #This function returns the next clean time for a given address on the street
  def next_clean_time(addr)  
    side = self.get_side(addr)  
    all_blocks = self.blocks
    blocks = all_blocks.where("side = ? AND bottom <= ? AND top >= ?", side, addr, addr)
    cts = Array.new
    blocks.each{|x|cts << x.ct.next_time}
    best = cts.min
    return best, blocks[0].id
  end
  
end
