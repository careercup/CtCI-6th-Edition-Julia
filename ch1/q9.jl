function string_rotation(str1 :: ASCIIString, str2 :: ASCIIString)
  """
  Check if a string is a sub-string of another string
  """
  function is_substring(str1 :: ASCIIString, str2 :: ASCIIString)
    return contains(str1, str2)
  end

  str :: ASCIIString = string(str1, str1)
  return is_substring(str, str2)
end

# Time  : O(1)
# Space : O(1)
# Note  : assume the function string_rotation takes O(1)


using Base: Test

@test string_rotation("waterbottle", "erbottlewat") == true
@test string_rotation("waterbottle", "erbottlewta") == false
