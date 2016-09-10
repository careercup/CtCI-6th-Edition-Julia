function zero_matrix!(mat :: Array{Int32, 2})
  N :: Int = size(mat, 1) # row
  M :: Int = size(mat, 2) # col

  # Mark if the first row should be cleaned
  clear_first_row :: Bool = false
  for col = 1:M
    if mat[1, col] == 0 clear_first_row = true; end
  end

  # Mark each row and col to be cleaned
  for row = 2:N
    for col = 1:M
      if mat[row, col] == 0
        mat[row, 1] = 0
        mat[1, col] = 0
        break
      end
    end
  end

  # Clean columns
  for col = 1:M
    if mat[1, col] == 0
      for r = 1:N
        mat[r, col] = 0
      end
    end
  end

  # Clean the first row
  if clear_first_row
    for c = 1:M mat[1, c] = 0; end
  end

  # Clean rows
  for row =2:N
    if mat[row, 1] == 0
      for c = 1:M
        mat[row, c] = 0
      end
    end
  end


end

# Time  : O(mn)
# Space : O(1)

using Base: Test

mat = Array{Int32, 2}([[1 2 3 0];[4 5 6 11];[7 8 9 12]])
zero_matrix!(mat)
@test mat == Array{Int32, 2}([[0 0 0 0];[4 5 6 0];[7 8 9 0]])
