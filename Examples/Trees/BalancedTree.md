Conditions for a height-balanced binary tree:
1. Difference between the left and the right subtree for any node is not more than one
2. The left subtree is balanced
3. The right subtree is balanced

Visual representation of Balanced tree:
```swift
    1 (Depth 0)
   / \
  2   3 (Depth 1)
 / \   \
4   5   6 (Depth 2)
```
In this tree:
- The root node (1) has a depth of 0.
- Its children (2 and 3) are at depth 1.
- The children of node 2 (4 and 5) and the right child of node 3 (6) are at depth 2.


To determine if a binary tree is balanced in Swift, you would calculate the height of the left and right subtrees for each node and ensure that the difference is not more than one.
```swift
class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    
    let leftHeight = height(of: root.left)
    let rightHeight = height(of: root.right)
    
    return abs(leftHeight - rightHeight) <= 1 && isBalanced(root.left) && isBalanced(root.right)
}

func height(of node: TreeNode?) -> Int {
    guard let node = node else { return -1 }
    return 1 + max(height(of: node.left), height(of: node.right))
}

// Example usage:
let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.right = TreeNode(6)

if isBalanced(root) {
    print("The tree is balanced")
} else {
    print("The tree is not balanced")
}
```
