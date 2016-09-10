module DataStructure

export Node, LinkedList, add, ArrayList, HashTable

type Node{T}
    item :: T
    next :: Any
end

type LinkedList{T}
    head :: Any
end

function add(ll :: LinkedList, item)
    current = ll.head
    while current != nothing
        current = current.next
    end
    current.next = Node{T}(item, nothing)
end

end
