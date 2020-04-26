def possible_bipartition(dislikes)
  groups = []
  
  counter = 0
  until counter > dislikes.length - 1
    if groups[counter].nil?
      groups[counter] = true
    end
    
    if dislikes[counter]
      return false if !check_unfriendlies(dislikes, counter, groups)
    end
    counter += 1
  end
  
  return true
end

def check_unfriendlies(dislikes, counter, groups)
  dislikes[counter].each do |unfriendly|
    if groups[unfriendly].nil?
      groups[unfriendly] = !groups[counter]
      return false if !check_unfriendlies(dislikes, unfriendly, groups)
    elsif groups[unfriendly] == groups[counter]
      return false
    end
  end
end
