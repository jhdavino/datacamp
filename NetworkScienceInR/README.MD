# Network Science in R - The Tidy Way
## Massimo Franceschet

# The Hubs of the Network
- A Network or Graph is made of a set of Nodes and ties - called edges.
- There are **Directed** and **Undirected** versions of graphs.
- Edges can also be weighted based on relevant information.
- We'll be using two packages:
  * `readr`
  * `igraph`
- We will build the network using two dataframes - one for each the edges and the nodes..
- The two datasets can be connected together using the function `graph_from_data_frame()`.
```r
library( readr )
library( igraph )

nodes <- read_csv( "nodes.csv")
edges <- read_csv( "edges.csv")

g <- graph_from_data_frame( d = edges,
                            directed = FALSE,
                            vertices = nodes )
```
- Visual the nodes with `V()`
- Count the number of vertices using `vcount()`.
- You can add a name using `g$name <- "Title of Graph"`
- You can name vertices using the syntax `V(g)$id <- 1:vcount(g)`
- You can print the weight of an edge using the syntax `E(g)$weight`.
- You can get the number of edges in a graph using the function `ecount()`.
- We will also be using the packages:
  * `dplyr`
  * `ggplot2`
- We will use the package `ggraph` to visualize the network.
```r
ggraph( g , layout = "with_kk") +
  geom_edge_link( aes( alpha = weight)) +
  geom_node_point() +
  geom_node_text(aes(label = id), repel=TRUE)
```
- The layout *with_kk* actually stands for **Kamada-Kawai layout**.
- This layout places tied nodes at equal distances, so that all ties had roughly the same length.
- There is also the circle or grid layouts as well.
- You can get the circle layout by passing parameter `layout = "circle"` or `layout = "in_circle"`.
- You can get the grid layout by passing parameter `layout = "grid"`.
- Networks are composite of the real world.
- A lot of research has been dedicated to **Network Centrality**.
- **Degree Centrality** simply counts the number of edges connected to the node.
- You can get this number using the function `degree()`.
- You can get the node's **Strength** using the function `strength()`.
- You can exchange the function `desc()` in an `arrange()` call with a `-` to reverse the ordering.
- There are a *ton* of other centrality measures in Graph Theory.


# In Its Weakness Lies its Strength
- **Tie Betweeness** is defined as the number of the shortest path going through a tie.
- When weights are involved, it is the smallest sum of weights on the path itself.
- You can use the formula `dist_weight = 1 / E(g)$weight` to calculate the weights for ties.
- You can use the function `edge_betweenness( g, weights = dist_weight)` to compute the weights between ties.
```r
# save the inverse of tie weights as dist_weight
dist_weight <- 1 / E(g)$weight

# compute weighted tie betweenness
btw <- edge_betweenness(g, weights = dist_weight)

# mutate the data frame ties adding a variable betweenness using btw
ties <- mutate( ties, betweenness = btw)

# add the tie attribute betweenness to the network
E(g)$betweenness <- btw
```
```r
# join ties with nodes
ties_joined <- ties %>%
  left_join(nodes, c("from" = "id")) %>%
  left_join(nodes, c("to" = "id"))

# select only relevant variables and save to ties
ties_selected <- ties_joined %>%
  select(from, to, name_from = name.x, name_to = name.y, betweenness)

# arrange named ties in decreasing order of betweenness
arrange(ties_selected, -betweenness)
```
```r
proportional to degree
ggraph(g, layout = "with_kk") +
  geom_edge_link(aes( alpha = weight)) +
  geom_node_point(aes( size = degree))
```
- You can filter by passing the parameter `filter = ( <column> <operation> <value>)` inside `geom_edge_link()`.


# Connection Patterns

# Similarity Clusters

# Research:

# Reference:
