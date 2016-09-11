include("support.jl")

function return_kth_to_last(ll :: LinkedList, k :: Int)
  forward :: Node = ll.head
  backward :: Node = ll.head

  # Make the forward pointer move k - 1 steps
  for _ = 1:(k-1)
    @assert forward.next != nothing "[return_kth_to_last] LinkedList has fewer than k nodes"
    forward = forward.next
  end

  # Move until the forward pointer reaches the end
  while forward.next != nothing
    forward = forward.next
    backward = backward.next
  end

  return backward.item
end

# Time  : O(n)
# Space : O(1)

using Base: Test

ll = LinkedList()
append_to_tail!(ll, 1)
append_to_tail!(ll, 2)
append_to_tail!(ll, 3)
append_to_tail!(ll, 4)
append_to_tail!(ll, 5)
append_to_tail!(ll, 6)
@test return_kth_to_last(ll, 4) == 3
