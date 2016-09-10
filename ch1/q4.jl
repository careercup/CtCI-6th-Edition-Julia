function palindrome_permutation(str :: ASCIIString)
  """
  Convert a character to a number according
  to the corresponding shift from 'a'
  """
  function char_to_int(ch :: Char)
    a :: Int = int('a')
    ch :: Int = int(ch)
    if a <= ch <= int('z')
      return ch - a
    else
      return -1
    end
  end

  """
  Toggle the bit at a specific index in a bit vector
  """
  function toggle_bit(bit_vector :: Int, idx :: Int)
    if idx <= 0
      return bit_vector
    end
    return bit_vector $= 1 << idx
  end

  """
  Create a bit vecotor for a given string
  """
  function create_bit_vector(str :: ASCIIString)
    bit_vector :: Int = 0
    for ch in str
      bit_vector = toggle_bit(bit_vector, char_to_int(ch))
    end
    return bit_vector
  end

  """
  Check whether a bit vecotr has only one bit
  """
  function has_one_bit(bit_vector :: Int)
    ((bit_vector - 1) & bit_vector) == 0
  end

  bv :: Int  = create_bit_vector(lowercase(str))

  return (bv == 0) || has_one_bit(bv) # satisfies either all even or only one odd
end

# Time  : O(n)
# Space : O(1)

using Base: Test

@test palindrome_permutation("Tact Coa") == true
@test palindrome_permutation("Tact Coad") == false
