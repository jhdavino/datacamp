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
```r
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
- A **Directed Graph** is one where direction is added to the edge relationship.
- You can check if a graph is directed using the function `is.directed()`.
- You can check if a graph is weighted using the function `is.weighted()`.
- One purpose of directed graphs is to determine which nodes are the most important.
- The **Out-Degree** is how many outgoing edges exist.
- The **In-Degree** is how many incoming edges exist.
- You can check if an edge exists between two nodes using `g['N1', 'N2']`; will return a 1 if present.
- You can display all edges from a node using `incident(g, 'N1', mode=c('all'))`.
- You can display in edges from a node using `incident(g, 'N1', mode=c('in'))`.
- You can display out edges from a node using `incident(g, 'N1', mode=c('out'))`.
- You can find all starting nodes using `head_of(g, E(g))`.
- You can get the neighbors of a node using `neighbors(g, 'N1', mode=c('all'))`.
- You can use the intersection of the neighbors of nodes to find paths.
- You can get the furthest path in the network using `farthest_vertices(g)`.
- The **Diameter** is the longest path in the graph.
- You can get it using `get_diameter()`.
- You can return the list of nodes that are a certain limited number of edges away.
- This is done using `ego(g, <n>, 'N1', mode=c('all'))`.
- There are many ways to measure *importance*:
  * degree.
  * betweeness.
  * Eigenvector Centrality.
  * Closeness Centrality.
  * Pagerank Centrality
- You can calculate the degree using `degree(g, mode=c('all'))`.
- **Betweeness** measures how often a node exists on the *shortest path*.
- You can calculate that using `betweenness(g, directed = TRUE)`.
- You can also return normalized numbers using parameter `normalized = TRUE`.
- You can create an ego graph using `make_ego_graph()`.
```r
make_ego_graph(g, diameter(g), nodes = '184', mode = c("all"))[[1]]`
```

# Characterizing Network Structures
- **Eigenvector Centrality** is a measure of how well connected a vertex is.
- You can those values using the function `eigen_centraility()`.
- **Density** is the proportion of how many edges do exist in a network over how many could exist.
- You can get that value using `edge_density( g )`.
- You calculate the **Average Path Length** using `mean_distance( g, directed = FALSE)`.
- A **Random Graph** is a simulated network that has similar properties to the one under study.
```r
erdos.renyi.game( n = gorder(g), p.or.m = edge_density( g ), type = 'gnp')
```
- You can test the connectivity between three nodes using the function `triangles( g )`.
- You can test the **Global Transitivity** of a network using `transitivity( g )`.
- You can count the number of triangles a node is involved in using `count_triangles( g, vids('N1'))`.
- You can also calculate the **Local Transitivity** using `transitivity( g, vids = 'N1', type = 'local')`.
- In a **Clique**, every vertex is connected to every other vertex.
- You can find the largest of its kind using `largest_cliques( g )`.
- You can identify all such *cliques* using `max_cliques( g  )` which will return a list of them all.
- You can create a subgraph using `subgraph()` to control which nodes to include in the graph.

# Identifying Special Relationships
- **Assorativity** is the preferential attachment of vertices to other vertices that are similar in numerical or categorical attributes.
- You can calculate that using the function `assorativity( g, values)`; where values is a vector of attributes.
- The values need to be numbers though so make sure to convert categories to factors.
- The function `assortativity.degree( g, directed = FALSE)` will compute how willing highly connected vertexes are connected to each other.
- You can calculate the **Reprocity** of a network using `reprocity( g )`.
- If, within a network, it is possible to subset the nodes into unique sets then there is said to be a **Community**.
- Full community detection is computationally expensive so many are not included.
- You can use the function `fastgreedy.community( g )` to run a quick version of it.
- The Function `edge.betweenness.community( g )` can be used to find what is believed to be edges between communities.
- You can extract information from the saved fast algo using:
  * `length( gr )`: how many communities are assumed to be true.
  * `sizes( gr )`: how large each proposed community is.
  * `membership( gr )`: who belongs in each community.
- You can then plot the graph of communities using `plot( gr, g)`.
- `leading.eigenvector.community( g )` is another community detection algorithm.
- There are tons of other packages to assist in managing network data; we're going to be using threejs.
- It's as easy as calling `graphjs( g )`.
- For the attributes to be crossed over, you just need to update the vertex attributes using `set_vertex_attr()`.

# Reference:

# Research:
- Fruthterman-Reingold?
- Erdos-Renyi?
- `edge.betweenness.community( g )`
