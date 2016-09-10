function one_away(str1 :: ASCIIString, str2 :: ASCIIString)
  function is_one_away(shorter :: ASCIIString, longer :: ASCIIString)
    idx_s, idx_l = 1, 1
    len_s, len_l = length(shorter), length(longer)
    find_diff = false
    while idx_s <= len_s && idx_l <= len_l
      if shorter[idx_s] == longer[idx_l]
        idx_s += 1
        idx_l += 1
      else
        if find_diff return false; else find_diff = true; end
        if len_s == len_l idx_s += 1; end
        idx_l += 1
      end
    end
    return true
  end

  if abs(length(str1) - length(str2)) > 1
    return false
  else
    if length(str1) < length(str2)
      return is_one_away(str1, str2)
    else
      return is_one_away(str2, str1)
    end
  end
end

using Base: Test

@test one_away("abc", "abl") == true
@test one_away("ab", "abl") == true
@test one_away("abc", "ab") == true
@test one_away("abc", "abc") == true
@test one_away("abc", "bca") == false
