function palindrome_permutation(str :: ASCIIString)
  function char_to_int(ch :: Char)
    a :: Int = int('a')
    ch :: Int = int(ch)
    if a <= ch <= int('z')
      return ch - a
    else
      return -1
    end
  end

  function toggle_bit(bit_vector :: Int, idx :: Int)
    if idx <= 0
      return bit_vector
    end
    return bit_vector $= 1 << idx
  end

  function create_bit_vector(str :: ASCIIString)
    bit_vector :: Int = 0
    for ch in str
      bit_vector = toggle_bit(bit_vector, char_to_int(ch))
    end
    return bit_vector
  end

  function has_one_bit(bit_vector :: Int)
    ((bit_vector - 1) & bit_vector) == 0
  end

  bv :: Int  = create_bit_vector(lowercase(str))

  return (bv == 0) || has_one_bit(bv)
end


using Base: Test

@test palindrome_permutation("Tact Coa") == true
@test palindrome_permutation("Tact Coad") == false
