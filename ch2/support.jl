type Node
  item  ::  Any
  next  ::  Any
  function Node(item)
    new(item, nothing)
  end
end

type LinkedList
  head  ::  Any
  function LinkedList()
    new(nothing)
  end
end

function append_to_tail!(ll :: LinkedList, item)
  if ll.head == nothing
    ll.head = Node(item)
  else
    curr :: Node = ll.head
    tail :: Node = Node(item)
    while curr.next != nothing curr = curr.next; end
    curr.next = tail
  end
end

function delete_node!(ll :: LinkedList, item)
  @assert ll.head != nothing "[delete_node] cannot delete node from an empty LinkedList"

  curr :: Node = ll.head

  if curr.item == item ll.head = curr.next; end

  while curr.next != nothing
    if curr.next.item == item curr.next = curr.next.next; break; end
    curr = curr.next
  end
end

using Base: Test

ll = LinkedList()
append_to_tail!(ll, 1)
append_to_tail!(ll, 2)
append_to_tail!(ll, 3)
delete_node!(ll, 2)
delete_node!(ll, 1)
delete_node!(ll, 3)
@test ll.head == nothing
