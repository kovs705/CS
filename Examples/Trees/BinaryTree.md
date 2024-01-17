## Binary Tree
[Source](https://www.kodeco.com/990-swift-algorithm-club-swift-binary-search-tree-data-structure#toc-anchor-003)

A binary tree is a tree where each node has 0, 1, or 2 children. The important bit is that 2 is the max – that’s why it’s **binary**.

```swift
  Root
 /    \
leaf   node
      /    \
    leaf    nil
```

`Root` - The root is the node at the top of the tree;
`leaf` - If a node doesn’t have any children, it’s called a leaf node;
`node` - If a node has at least one child, it's called a node.

Implementing the BinaryTree in enum:
```swift
enum BinaryTree<T: Comparable> {
  case empty
  indirect case node(BinaryTree, T, BinaryTree)
}
```
 - `indirect` keyword is used to declare recursive enumeration cases. 
Recursive enumeration cases occur when an enumeration case includes an instance of the same enumeration type as an associated value. 
This creates a potential issue because Swift's enumerations are value types, and their size must be determined at compile time. However, it's impossible to determine the final size of a recursive enumeration.
 - `Comparable` protocol enforces a guarantee that the type you’re using to build the binary tree can be compared using the comparison operators, such as the `<` operator


## “Always Sorted” Property
### Insertion
When performing an insertion, starting with the root node as the current node:
 * If the current node is _empty_, you insert the **new** node here.
 * If the new value is _smaller_, you go down the **left** branch.
 * If the new value is _greater_, you go down the **right** branch.

## Solution

```swift
enum BinaryTree<T: Comparable> {

  ...

 private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
   switch self {
   // 1
   case .empty:
     return .node(.empty, newValue, .empty)
   // 2 
   case let .node(left, value, right):
     if newValue < value {
       return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
     } else {
       return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
     }
   }
 }
}
```
1. If the tree is empty, you want to insert the new value here.
2. If the tree isn't empty, you'll need to decide whether to insert into the left or right child.

```swift
mutating func insert(newValue: T) {
  self = newTreeWithInsertedValue(newValue: newValue)
}
```

### Usage
```swift
binaryTree.insert(newValue: 5) 
binaryTree.insert(newValue: 7) 
binaryTree.insert(newValue: 9) 
```
### Tree structure result
```swift
value: 5, 
    left = [], 
    right = [value: 7, 
        left = [], 
        right = [value: 9, 
            left = [], 
            right = []]]
```

## Insertion Time Complexity
`Value types (struct, enum, tuples):`
Creating a new copy requires going through all the nodes of the previous tree. This gives the insertion method a time complexity of O(n). (Copy-On-Write)
`Reference semantics (classes):` faster O(log n), since classes won't have the copy-on-write behaviour


## Search Algorithm
```swift
enum BinaryTree<T: Comparable> {

...

func search(searchValue: T) -> BinaryTree? {
  switch self {
    case .empty:
      return nil
    case let .node(left, value, right):
      // 1
      if searchValue == value {
        return self
      }
 
      // 2
      if searchValue < value {
        return left.search(searchValue: searchValue)
      } else {
        return right.search(searchValue: searchValue)
      }
    }
  }
}
```

1. If the current value matches the value you're searching for, we are done searching
2. If execution continues to this point, it means we haven't found the value. Now we need to decide whether we want to go down to the left or right again and so no on...

## Searching Time Complexity 
The search algorithm will traverse only 1 side at every recursive step. On average, this leads to a time complexity of **O(log n)**.
