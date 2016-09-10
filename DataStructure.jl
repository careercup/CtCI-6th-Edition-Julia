type Node{T}
    item :: T
    next :: Any
end

type LinkedList
    head :: Any
end

function add_to!(ll :: LinkedList, item)
    if ll.head == nothing
      ll.head = Node(item, nothing)
    else
      curr = ll.head
      while curr.next != nothing
          curr = curr.next
      end
      curr.next = Node(item, nothing)
    end
end

function is_there(ll :: LinkedList, item)
  curr = ll.head
  while curr.next != nothing && curr.item != item
      curr = curr.next
  end
  curr.item == item
end

function remove_from!(ll :: LinkedList, item)
  @assert ll.head != nothing "[remove_from!] cannot remove an item from an empty LinkedList"
  prev = nothing
  curr = ll.head
  while curr.next != nothing && curr.item != item
    prev = curr
    curr = curr.next
  end
  if curr.item == item
    if prev != nothing
      if curr.next != nothing
        prev.next = curr.next
      else
        prev.next = nothing
      end
    else
      if curr.next != nothing
        ll.head = curr.next
      else
        ll.head = nothing
      end
    end
  end
end

function Base.string(ll :: LinkedList)
  str = "["
  curr = ll.head
  while curr != nothing
    str = string(str, " ", curr.item)
    curr = curr.next
  end
  str = string(str, " ]")
end
