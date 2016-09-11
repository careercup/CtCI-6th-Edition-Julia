include("support.jl")

function remove_dups!(ll :: LinkedList)
  record :: Set = Set()
  push!(record, ll.head.item)

  prev :: Node = ll.head      # pointer to the first occurance of some item
  curr = ll.head.next
  while curr != nothing
    if curr.item in record
      prev.next = curr.next
    else
      push!(record, curr.next.item)
      prev = curr             # update when new item appears
    end
    curr = curr.next
  end
end

# Time  : O(n)
# Space : O(n)

using Base: Test

ll = LinkedList()
append_to_tail!(ll, 1)
append_to_tail!(ll, 2)
append_to_tail!(ll, 2)
append_to_tail!(ll, 3)
append_to_tail!(ll, 3)
append_to_tail!(ll, 3)
remove_dups!(ll)
delete_node!(ll, 1)
delete_node!(ll, 2)
delete_node!(ll, 3)
@test ll.head == nothing
