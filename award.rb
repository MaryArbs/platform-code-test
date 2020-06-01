# Award = Struct.new(:name, :expires_in, :quality)
#quality of an award is never more than 50
#quality of an award is never negative
#Once the expiration date has passed, quality score degrades twice as fast

class Award
    attr_accessor :name, :expires_in, :quality
  
    def initialize(name, expires_in, quality)
        @name = name
        @expires_in = expires_in
        @quality = quality
  
        case name #variables that will be used by when keyword
        when "Blue First"
            extend BlueFirst
        when "Blue Compare"
            extend BlueCompare
        when "Blue Distinction Plus"
            extend BlueDistinctionPlus
        when "Blue Star"
            extend BlueStar
        else 
            extend NormalAward
        end 
    end 
end 

module NormalAward 
    def update_quality
        @expires_in -= 1
        return if @quality == 0
        @quality -= 1
        @quality -= 1 if @expires_in <= 0  
    end      
end 

module BlueFirst #increase in quality the older they get
    def update_quality
        @expires_in -= 1
        @quality += 1 
        @quality += 1 if @expires_in <= 0
        return @quality = 50 if @quality >= 50
    end 
end

module BlueDistinctionPlus #quality = 80 and not altered
    def update_quality
    end 
end 

module BlueCompare 
    def update_quality
         @expires_in -= 1
         return if @quality >= 50
         return @quality = 0 if @expires_in < 0
         @quality += 1
         @quality += 1 if @expires_in < 10
         @quality += 1 if @expires_in < 5
    end 
end 

module BlueStar
    def update_quality
        @expires_in -= 1
        return if @quality <= 0
        @quality -= 2
        @quality -= 2 if @expires_in < 0
    end 
end 




