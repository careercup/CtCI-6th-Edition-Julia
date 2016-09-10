function check_permutation(str1 :: ASCIIString, str2 :: ASCIIString)
  if length(str1) != length(str2) # permutations must have the same length
    return false
  end

  d :: Dict{Char, Int} = Dict{Char, Int}()

  for ch in str1      # count characters in the first string
    if haskey(d, ch)
      d[ch] += 1
    else
      d[ch] = 1
    end
  end

  for ch in str2      # discount characters in the second string
    if haskey(d, ch)
      if d[ch] == 0   # if there is negative count to appear
        return false  # return false
      end
      d[ch] -= 1
    else              # if there is new characters
      return false    # return false
    end
  end

  return true
end

# Time  : O(n)
# Space : O(n)

using Base: Test

@test check_permutation("abcd", "bcda") == true
@test check_permutation("AbCd", "bdAC") == true
@test check_permutation("abcd", "bcdda") == false
@test check_permutation("abcd", "beda") == false
