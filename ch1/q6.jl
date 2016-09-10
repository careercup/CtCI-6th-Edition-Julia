function string_compression(str :: ASCIIString)
  """
  Update the string builder depending on
  the given character and its count
  """
  function update(prev :: Char, count :: Int)
    push!(str_builder, prev)
    append!(str_builder, map(ss->ss[1], split(string(count), "")))
  end

  @assert length(str) > 1 "[string_compression] cannot compress empty string"

  str_builder = Vector{Char}()
  prev :: Char = str[1]
  count :: Int = 0

  for ch in str
    if ch != prev         # if find a new character
      update(prev, count) # update the string builder
      prev, count = ch, 1 # reset
    else                  # if the character is the same as previous
      count += 1          # count
    end
  end
  update(prev, count)     # update the last type of character

  compressed_str = ASCIIString(str_builder)

  return length(str) > length(compressed_str) ?  compressed_str : str
end

# Time  : O(n)
# Space : O(n)

using Base: Test

@test string_compression("aabcccccaaa") == "a2b1c5a3"
