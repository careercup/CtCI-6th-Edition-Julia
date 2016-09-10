function URLify(str :: ASCIIString, real_length :: Int)
  char_array = map(single_string -> single_string[1], split(str, ""))
  idx = length(char_array)
  for i = real_length:-1:1
    if char_array[i] != ' '
      char_array[idx] = char_array[i]
      idx -= 1
    else
      char_array[idx] = '0'
      char_array[idx - 1] = '2'
      char_array[idx - 2] = '%'
      idx -= 3
    end
  end
  ASCIIString(char_array)
end

using Base: Test

@test URLify("Mr Jhon Smith    ", 13) == "Mr%20Jhon%20Smith"
