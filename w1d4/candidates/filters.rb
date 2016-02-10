# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates.rb'

def find_id(id)
  @candidates.each do |cand|
    if cand[:id] == id
      return cand
    else
      return nil
    end
  end
end



def experienced?(candidate)
    candidate[:years_of_experience] >= 2 ? true : false
end


# puts experienced?(@candidates[0])

# More methods will go below

def git_check(candidate)
  candidate[:github_points] >= 100 ? true : false
end


def language_check(candidate)
  if candidate[:languages].include?("Python") == true || candidate[:languages].include?("Ruby") == true
    return true
  else
    return false
  end
end


def date_check(candidate)
  if candidate[:date_applied] >= (15.days.ago.to_date)
    return true
  else
    return false
  end
end


def age_check(candidate)
  if candidate[:age] > 17
    return true
  else
    return false
  end
end

def verify_all(candidate)
  age_check(candidate) && date_check(candidate) && language_check(candidate) && git_check(candidate) && experienced?(candidate)
end

# puts verify_all(@candidates[0])

def qualified_candidates(candidates)
  qualified_pool = []
  candidates.each_with_index do |cand, index|
    if verify_all(candidates[index])
      qualified_pool << cand
    end
  end
  qualified_pool
end

# x = qualified_candidates(@candidates)

# puts x.is_a?(Array)

def organize_candidates(candidates)
  candidates.sort { |x, y| (x[:years_of_experience] <=> y[:years_of_experience]) == 0 ? (x[:github_points] <=> y[:github_points]) : (x[:years_of_experience] <=> y[:years_of_experience]) }.reverse
end

# puts organize_candidates(x)










