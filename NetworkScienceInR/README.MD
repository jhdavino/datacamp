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
- The layout *with_kk* actually stands for **Kamada-Kawai Layout**.
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
- We will explore **Adjacency Matrices**.
- The function to create one is `as_adjacency_matrix()`.
- You can also get the **Weighted** version by passing the parameter `attr=weight`.
- You can calculate the **Diagonal** of a matrix using the function `diag()`.
- The **Pearson Similarity** is the correlation between the node vectors.
```r
# mutate ties data frame by swapping variables from and to
ties_mutated <- mutate(ties, temp = to, to = from, from = temp) %>% select(-temp)

# append ties_mutated data frame to ties data frame
ties <- rbind(ties, ties_mutated)

# use a scatter plot to visualize node connection patterns in ties setting color aesthetic to weight
ggplot(ties, aes(x = from, y = to, color = factor(weight))) +
  geom_point() +
  labs(color = "weight")
```
- You can create a **Vector of Node Strengths** or degrees by using rowSums() on the specified matrix.
- With **Pearson Correlation**, more than 0 is a positive correlation; less than one is a negative correlation.
- You can convert the network to data frame using the function `as_data_frame( <graph>, what = "both")`.
- You can convert a matrix to a graph using the function `graph_from_adjacency_matrix( A )`.
- You can convert a data frame to a graph using the function `graph_from_data_frame( df$ties, vertices = df$nodes )`.
```r
# filter the similarity data frame to similarities larger than or equal to 0.60
sim3 <- filter(sim2, similarity >= .6)

# build a similarity network called h2 from the filtered similarity data frame
h2 <- graph_from_data_frame(sim3, directed = FALSE)

# visualize the similarity network h2
ggraph(h2, layout = "with_kk") +
  geom_edge_link(aes(alpha = similarity)) +
  geom_node_point()
```


# Similarity Clusters
- The **Distance Matrix** is defined as the complement of the **Similarity Matrix**.
```ref
D <- 1-S
d <- as.dist( D )
cc <- hclust(d, method = "average") # or "single" or "complete"
```
```r
# add cluster information to the network
V(g)$cluster <- nodes$cluster

# visualize the original network with colored clusters
ggraph(g, layout = "with_kk") +
  geom_edge_link(aes(alpha = weight), show.legend=FALSE) +
  geom_node_point(aes(color = factor(cluster))) +
  labs(color = "cluster")

# facet the network with respect to cluster attribute
ggraph(g, layout = "with_kk") +
  geom_edge_link(aes(alpha = weight), show.legend=FALSE) +
  geom_node_point(aes(color = factor(cluster))) +
  facet_nodes(~cluster, scales="free")  +
  labs(color = "cluster")
```
- We're going to explore Interactive Visualizations using the package `visnetwork`
- You can convert from an igraph to a visNetwork using the function `toVisNetworkData()`.
- To create it, you will call the function `visNetwork(nodes = data$nodes, edges = data$edges, width = 300, height = 300)`
- You can alter the visualization layout using the function `visIgraphLayout( layout = "<layout-name>"")`; param is `layout_with_kk`.
- You can also add extra options using the function `visOptions()`
- Some parameters are:
  * `highlightNearest`
  * `nodesIdSelection`
  * `selectedBy`
-

# Research:

# Reference:
- http://users.dimi.uniud.it/~massimo.franceschet/ns/syllabus/syllabus.html
