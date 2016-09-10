function is_unique(str :: ASCIIString)
  d :: Dict{Char, Int} = Dict{Char, Int}()

  for ch in str       # for each character in the string
    if haskey(d, ch)  # if there is multiple occurances
      return false    # return false
    else              # else
      d[ch] = 1       # record the occurance using a dictionary (HashMap)
    end
  end

  return true
end

# Time  : O(n)
# Space : O(n)
# Note  : space compelxity could be improved by using a bit vector

using Base: Test

@test is_unique("ab *D") == true
@test is_unique(" asd+_)(*&^%#@!123456789") == true
@test is_unique("abcdc") == false
@test is_unique("abcd  ") == false
