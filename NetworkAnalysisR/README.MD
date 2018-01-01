# Network Analysis in R
## James Curley

# Introduction to Networks
- A **Network Graph** shows interconnection between individuals.
- Many different relationships can be visualized using a social network.
- The term **Social Network** can refer to the visualization of the graph or the underlying data.
- Individual objects are called vertices, or nodes.
- The connections between them are called edges.
- Network data can be visualized in many ways:
  * Adjacency Matrix.
  * Edgelist.
- While many packages exist, we will be using the *igraph* package.
- To get a graph, pass an edgelist via:
``r
g <- graph.edgelist(as.matrix( df ), directed = FALSE)
```
- The function `V()` will return all vertices in a network.
- The function `E()` will return all edges in a network.
- The functions `gorder()` and `gsize()` will tell you the total number of vertices or edges.
- *Vertex* attributes can be categorical or numerical.
- *Edges* can also have attributes.
- The most common attribute is the weight on an edge.
- 


# Identifying Important Vertices in a Network

# Characterizing Network Structures

# Identifying Special Relationships

# Reference:

# Research:
