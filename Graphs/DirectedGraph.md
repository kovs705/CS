# Directed Graph
A directed graph is graph, i.e., a set of objects (called vertices or nodes) that are connected together, where `all the edges are directed from one vertex to another`.


This means that the relationship between nodes is `not symmetrical`, meaning that if there is an edge from node A to node B, **it does not necessarily imply an edge from node B to node A**. 

```swift
struct Vertex<T>: Hashable where T: Hashable {
    var data: T
    var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}
```

```swift
public enum EdgeType {
    case directed
    case undirected
}

public protocol Graph {
    associatedtype Element

    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>,
                         to destination: Vertex<Element>,
                         weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>,
                           and destination: Vertex<Element>,
                           weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>,
                             to destination: Vertex<Element>,
                             weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>,
                to destination: Vertex<Element>) -> Double?
}
```


## Working with Graph
```swift
class Graph<T>: Graphable where T: Hashable {
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]

    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        adjacencies[vertex] = []
        return vertex
    }

    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }

    public func removeVertex(_ vertex: Vertex<T>) {
    adjacencies[vertex]?.forEach { edge in
        adjacencies[edge.destination]?.removeAll(where: { $0 == edge })
    }
    adjacencies[vertex] = nil
    }

    public func removeEdge(_ edge: Edge<T>) {
        adjacencies[edge.source]?.removeAll(where: { $0 == edge })
    }

    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }

    public func vertices() -> [Vertex<T>] {
        return Array(adjacencies.keys)
    }
}
```


In the next example we create a directed graph with three vertices and two edges. 
The `addDirectedEdge` function adds an edge from `vertex1` to `vertex2` with a weight of 1.0, and from `vertex2` to `vertex3` with a weight of 2.0.
```swift
let graph = Graph<Int>()
let vertex1 = graph.createVertex(data: 1)
let vertex2 = graph.createVertex(data: 2)
let vertex3 = graph.createVertex(data: 3)

graph.addDirectedEdge(from: vertex1, to: vertex2, weight: 1.0)
graph.addDirectedEdge(from: vertex2, to: vertex3, weight: 2.0)
```
