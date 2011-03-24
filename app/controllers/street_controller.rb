class StreetController < ApplicationController
  def index
  end

  def show
    @blocks = params[:q]
    @blocks.upcase!
    @num, @name, @suf = @blocks.split(" ")
    @num.to_i
    @s = @num % 2
    @side = "R"
    if @s == 1
      @side = "L"
    end
    
    #ADD SUFFIX CHECK SOMEWHERE ROUND HERE
    @name += " "+ @suf
    
    @results = Street.where("streetname =? AND rl =? AND bottomr <=? AND topr >=?", @name,@side,@num,@num)
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @results }
    end
  end

end
