import Combine

check("Empty") {
    Empty<Int, SampleError>()
}

check("Just") {
    Just(1)
}

check("Sequence") {
    Publishers.Sequence<[Int], Never>(sequence: [1, 2, 3])
}

check("Array") {
    [1, 2, 3].publisher
}


check("Map Just") {
    Just(5)
        .map { $0 * 2 }
}

[1,2,3,4,5].reduce(0, +)

check("Reduce") {
    [1,2,3,4,5].publisher.reduce(0, +)
}

check("Scan") {
    [1,2,3,4,5].publisher.scan(0, +)
}

check("Compact Map By Filter") {
    ["1", "2", "3", "cat", "5"]
        .publisher
        .map { Int($0) }
        .filter { $0 != nil }
        .map { $0! }
}
check("Remove Duplicates") {
    ["S", "Sw", "Sw", "Sw", "Swi",
    "Swif", "Swift", "Swift", "Swif"]
        .publisher
        .removeDuplicates()
}

check("Fail") {
    Fail<Int, SampleError>(error: .sampleError)
}
