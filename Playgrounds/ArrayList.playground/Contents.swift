import MGDataStructures

var arr = ArrayList<Character>(initialCapacity: 2)
for i in 0..<9 {
    if (i % 2 == 0) {
        arr.add(Character("\(i)"))
    }
}
print(arr)
arr.remove(at: 0)

print(arr)

arr.removeAll()

print(arr)
