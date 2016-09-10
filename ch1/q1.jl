function unique_chars(str :: ASCIIString)
  d = Dict{Char, Int}()
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

@test unique_chars("ab *D") == true
@test unique_chars(" asd+_)(*&^%#@!123456789") == true
@test unique_chars("abcdc") == false
@test unique_chars("abcd  ") == false
