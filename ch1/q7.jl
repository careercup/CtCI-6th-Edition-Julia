function rotate_matrix!(mat :: Array{Int32, 2})
  N :: Int = size(mat, 1)
  for row = 1:int(N / 2)
    for col = row:(N - row)
      mat[row, col], mat[col, N - row + 1], mat[N - row + 1, N - col + 1], mat[N - col + 1, row] =
      mat[N - col + 1, row], mat[row, col], mat[col, N - row + 1], mat[N - row + 1, N - col + 1]
    end
  end
end

# Time  : O(n^2)
# Space : O(1)

using Base: Test

mat = Array{Int32, 2}([[1 2 3];[4 5 6];[7 8 9]])
rotate_matrix!(mat)
@test mat == Array{Int32, 2}([[7 4 1];[8 5 2];[9 6 3]])
rotate_matrix!(mat)
@test mat == Array{Int32, 2}([[9 8 7];[6 5 4];[3 2 1]])
