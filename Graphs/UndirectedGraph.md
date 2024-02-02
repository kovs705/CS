![](https://mathinsight.org/media/image/image/small_undirected_network_labeled.png)


```An undirected network with 10 nodes (or vertices) and 11 edges (or links).```

An undirected graph is graph, i.e., a set of objects (called vertices or nodes) that are connected together, where all the edges are bidirectional. 
An undirected graph is sometimes called an `undirected network`. 

In Swift, you can create an undirected graph by creating two directed edges for every pair of vertices. 
Here is a simple example:

First, define the Vertex and Edge structures:
```swift
public struct Vertex<T>: Equatable where T: Equatable, T: Hashable {
 public var data: T
 public let index: Int
}

public struct Edge<T>: Equatable where T: Equatable, T: Hashable {
 public let from: Vertex<T>
 public let to: Vertex<T>
 public let weight: Double?
}
```

Make a `Graph` class:
```swift
public class Graph<Element> {
 private var adjacencies: [Vertex<Element>: [Edge<Element>]] = [:]

 public func createVertex(data: Element) -> Vertex<Element> {
    let vertex = Vertex(index: adjacencies.count, data: data)
    adjacencies[vertex] = []
    return vertex
 }

 public func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
    let edge = Edge(from: source, to: destination, weight: weight)
    adjacencies[source]?.append(edge)
 }

 public func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
    addDirectedEdge(from: source, to: destination, weight: weight)
    addDirectedEdge(from: destination, to: source, weight: weight)
 }
}
```

And now create an `Undirected graph`:
```swift
let graph = Graph<String>()
let v1 = graph.createVertex(data: "Node 1")
let v2 = graph.createVertex(data: "Node 2")
let v3 = graph.createVertex(data: "Node 3")
let v4 = graph.createVertex(data: "Node 4")

graph.addUndirectedEdge(between: v1, and: v2, weight: 1.0)
graph.addUndirectedEdge(between: v2, and: v3, weight: 1.0)
graph.addUndirectedEdge(between: v3, and: v4, weight: 4.5)
graph.addUndirectedEdge(between: v4, and: v1, weight: 2.8)
graph.addUndirectedEdge(between: v2, and: v3, weight: 3.2)
```

