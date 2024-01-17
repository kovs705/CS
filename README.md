# Table of Contents

* [Computer Science Roadmap](#computer-science-roadmap)
* [Data Structures](#data-structures)
  * [Linked list](#linked-list)
  * [Stack](#stack)
  * [Queue](#queue)
  * [Hash Table](#hash-table)
  * [Trees](#trees)

## Computer Science Roadmap

My path in CS using this roadmap: [Computer Science Roadmap](https://roadmap.sh/computer-science)

## Data Structures

Data Structure is a way of organizing the data in the memory so that it can be used efficiently. Some common data structures are array, linked list, stack, hashtable, queue, tree, heap, and graph.

### Linked list
A linked list in Swift is a collection of values arranged in a linear unidirectional sequence. It is composed of nodes, where each node holds a value and a reference to the next node in the sequence. When the end of the list is reached, the reference is usually set to nil
Example in Swift.

[Example](./Examples/LinkedList.swift)

### Stack
Stack is a linear collection of items where items are inserted and removed in a particular order. Stack is also called a LIFO Data Structure because it follows the “Last In First Out” principle i.e. the item that is inserted in the last is the one that is taken out first.

There's no built-in stack in Swift, but you can make your own: [example](./Stack.swift)

### Queue
Queue is a linear collection of items where items are inserted and removed in a particular order. The queue is also called a FIFO Data Structure because it follows the “First In, First Out” principle i.e., the item that is inserted in the first is the one that is taken out first.

[Example](./Examples/Queue.md)

### Hash Table
A hash table is a data structure that stores key-value pairs and allows for fast retrieval of values based on their keys. In Swift, the equivalent of a hash table is a Dictionary. Swift dictionaries are collections of key-value pairs where each key is associated with a value

[Example](./Examples/Dictionary.md)

## Trees
A tree is non-linear and a hierarchical data structure consisting of a collection of nodes such that each node of the tree stores a value and a list of references to other nodes (the “children”).

[Example and Info](./Examples/Trees/BinaryTree.md)
