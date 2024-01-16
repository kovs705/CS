Swift doesn't have a built-in Queue data structure, but you can make your own:

```swift
struct Queue<T> {
   private var array = [T]()

   var isEmpty: Bool {
       return array.isEmpty
   }

   mutating func enqueue(_ item: T) {
       array.append(item)
   }

   mutating func dequeue() -> T? {
       if isEmpty {
           return nil
       } else {
           return array.removeFirst()
       }
   }

   func peek() -> T? {
       return array.first
   }
}

```

The Queue struct is declared with a generic parameter T, meaning it can hold elements of any type:
```swift
struct Queue<T>
```


The array variable is initialized as an empty array of type T
The **isEmpty** computed property checks whether the queue is empty. It returns _true_ if the array is empty, and _false_ otherwise:
```swift
var isEmpty: Bool {
       return array.isEmpty
   }
```


The enqueue function takes an item of type T and adds it to the end of the array. The mutating keyword indicates that this function modifies the state of the Queue instance:
```swift
  mutating func enqueue(_ item: T) {
      array.append(item)
  }
```

The dequeue function removes and returns the first item from the array. If the queue is empty, it returns nil:
```swift
  mutating func dequeue() -> T? {
      if isEmpty {
          return nil
      } else {
          return array.removeFirst()
      }
  }
```

The peek function returns the first item in the array without removing it. This allows you to inspect the next item that would be removed from the queue without actually removing it:
```swift
  func peek() -> T? {
      return array.first
  }
}
```

