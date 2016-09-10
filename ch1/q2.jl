function check_permutation(str1 :: ASCIIString, str2 :: ASCIIString)
  if length(str1) != length(str2)
    return false
  end

  d :: Dict{Char, Int} = Dict{Char, Int}()

  for ch in str1
    if haskey(d, ch)
      d[ch] += 1
    else
      d[ch] = 1
    end
  end

  for ch in str2
    if haskey(d, ch)
      if d[ch] == 0
        return false
      end
      d[ch] -= 1
    else
      return false
    end
  end

  return true
end

using Base: Test

@test check_permutation("abcd", "bcda") == true
@test check_permutation("AbCd", "bdAC") == true
@test check_permutation("abcd", "bcdda") == false
@test check_permutation("abcd", "beda") == false
