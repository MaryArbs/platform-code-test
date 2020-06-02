require 'award'

def update_quality(awards)
  awards.each do |award|
    award.update_quality #update_quality method from award.rb
  end
end 


