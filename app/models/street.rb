class Street < ActiveRecord::Base
  has_many :blocks
  
  def get_side(addr)
    if addr.even?
      return "R"
    else
      return "L"
    end
  end
  
  def self.double_choose
    
  end
  
  def self.get_doubles
    
  end
  
  
  
  def self.valid_suffix?(suf)
    suffixes =["ST","AVE" ,"WAY" ,"BLVD", "PL", "CT", "DR", "TER", "LN", "ALY", "PARK", "RD", "MAR", "HWY", "CIR", "EXPY", "PLAYA", "PLZ", "ARTS" ,"TUNL" ,"SORA", "EMBARCADERO"]
    suffixes.include?(suf)
  end
  
  def self.pop_suff(name)
    split = name.split
    suff = split.pop
    return split.join(" "), suff
  end
  
  def self.find_street(str)
    str.upcase!
    splt_str= str.split

    #Get address number and change it to integer
    num = splt_str[0]
    num = num.to_i
    

    # seperate the streetname and suffix from the rest of theinput
    # and join them all together
    len = splt_str.length
    name = splt_str.pop(len-1)
    name = name.join(" ")
    s = Street.where("streetname =?",name)
    if(s == []) 
      name, suff = self.pop_suff(name)
      s = Street.where("streetname =?",name)
      if(s == [])
        return -1
      end
    end
    return s,num
  end
  
  #This function returns the next clean time for a given address on the street
  def next_clean_time(addr)  
    #Figure out side of the street
    side = self.get_side(addr) 
    
    #Find all blocks that match Street Address 
    all_blocks = self.blocks
    blocks = all_blocks.where("side = ? AND bottom <= ? AND top >= ?", side, addr, addr)
    
    #Compute the next cleaning times for the block and pick the smallest(i.e. the soonest) time
    cts = Array.new
    blocks.each{|x|cts << x.ct.next_time}
    best = cts.min
    return best, blocks[0].id
  end
  
end
