function URLify(str :: ASCIIString, real_length :: Int)
  char_array :: Array{Char} = map(single_string -> single_string[1], split(str, ""))

  idx :: Int = length(char_array)

  for i = real_length:-1:1
    if char_array[i] != ' '             # non-space
      char_array[idx] = char_array[i]   # just copy
      idx -= 1
    else                                # space
      char_array[idx] = '0'             # fill "%20"
      char_array[idx - 1] = '2'
      char_array[idx - 2] = '%'
      idx -= 3
    end
  end

  return ASCIIString(char_array)
end

# Time  : O(n)
# Space : O(1)
# Note  : no extra space if assume the input is Array{Char}

using Base: Test

@test URLify("Mr Jhon Smith    ", 13) == "Mr%20Jhon%20Smith"
