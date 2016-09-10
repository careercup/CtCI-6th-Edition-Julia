using Base.Test

include("DataStructure.jl")

ll = LinkedList(nothing)
add_to!(ll, 10)
add_to!(ll, 1)
add_to!(ll, 4)
add_to!(ll, 16)
@test is_there(ll, 16) == true
@test string(ll) == "[ 10 1 4 16 ]"
remove_from!(ll, 10)
remove_from!(ll, 16)
remove_from!(ll, 1)
remove_from!(ll, 4)
@test string(ll) == "[ ]"

println("All tests of DataStructure.jl pass.")
