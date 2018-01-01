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
- The most common attribute is the weight of an edge.
- You can set those with `set_vertex_attr(<graph>, "<attr>", value = <vector>)`.
- You can check the current set of attrs with the function `vertex_attrs()`.
- You can set the edge attrs with `set_edge_attr(<graph>, "<attr>", value = <vector>)`.
- You can check the current set of attrs with the function `edge_attr()`.
- You can combine two different data frames containing the above data using:
```r
gragh_from_data_frame( d = edges.df,
                       vertices = vertices.df,
                       directed = FALSE)
```
- The function `inc('<NAME>')`will return the indexes of all edges that contain the `<name>` value.
- Combine that with `E(g)[[inc('<target>)]]` to return only those objects from the list.
- You can alter internal values of the network graph to make it more visually appealing.
- For example, you could conditionally set the `$color` attribute.
- You can set the vertex text color using parameter `vertex.label.colo = "<color>"`.
- The best visualizations should immediately explain the underlying value to the user.
- The most common visualization elements to modify are:
  * Size.
  * Labels.
  * Color.
  * Shape.
  * Edges.
- There are a few important principles to keep in mind when building them:
  1. Minimize Edges crossing.
  2. Do not allow Vertices to overlap.
  3. Make edge lengths as uniform as possible.
  4. Increase symmetry of a network as much as possible
  5. Position more influential nodes towards the center.
-  You can change the layout by passing an argument to the parameter `layout`.
- Types of layouts:
```r
layout_in_circle() # Circle.
layout_in_fr()     # Fruthterman-Reingold
layout_as_tree()   # tree.

```
- Each layout function is just a matrix of values.
- You can let *igraph* select the best visual using the function `layout_nicely()`.
- You can specify the edge weights using parameter `edge.width`.
- You can specify the edge colors using parameter `edge.color`.
- You can delete edges from a graph using `delete_edges()`.

# Identifying Important Vertices in a Network
-


# Characterizing Network Structures

# Identifying Special Relationships

# Reference:

# Research:
- Fruthterman-Reingold?
