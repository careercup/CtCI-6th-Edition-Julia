function is_unique(str :: ASCIIString)
  d :: Dict{Char, Int} = Dict{Char, Int}()

  for ch in str
    if haskey(d, ch)
      return false
    else
      d[ch] = 1
    end
  end

  return true
end

using Base: Test

@test is_unique("ab *D") == true
@test is_unique(" asd+_)(*&^%#@!123456789") == true
@test is_unique("abcdc") == false
@test is_unique("abcd  ") == false
