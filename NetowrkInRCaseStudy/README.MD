# Network Analysis in R: Case Studies
## Ted Hart

# Exploring Graphs Through Time
- It's useful to understand the data: obv.
- You can look at a subset of the graph frame using `induced_subgraph( <dataset>, <indexes>)`
- You can delete vertices using `delete.vertices( <graph>, <indexes>)`.
```
sg <- delete.vertices( sg, degree( sg ) == 0)
```
- **Dyads** are the different kinds of relationships between two nodes:
  * Null: No connections.
  * Asymmetrical: One connection.
  * Mutual: bi-directional.
- In **Triades**, there are 16 possible interaction types.
- You can get a count of the *dyad* relationships in a graph using the function `dyad_census(<graph>)`.
- You can get a count of the *triad* relationships in a grpah using the function `triad_centsus(<graph>)`.
- You can find the **Edge Density** using the function `edge_density( <graph> )`.
- You can figure out the **Transitivity** of the network using the function `transitivity( <graph> )`.
- You can figure out the **Reciprocity** of the network using the function `reciprocity( <graph> )`.
- You can compare your relationships against random using:
```
# Simulate
for(i in 1:1000){
  rep_sim[i] <- reciprocity(erdos.renyi.game(nv, ed, "gnp", directed = T))
}
```
```
# Create a new graph
ip_g <- graph_from_data_frame(ip_df %>% select(from, to), directed = T)

# Add color to the edges based on sales rank, blue is higer to lower, red is lower to higher
E(ip_g)$rank_flag <- ifelse(ip_df$salesrank.from <= ip_df$salesrank.to, "blue", "red")

# Plot and add a legend
plot(ip_g, vertex.label = NA, edge.arrow.width = 1, edge.arrow.size = 0,
    edge.width = 4, margin = 0, vertex.size = 4,
    edge.color = E(ip_g)$rank_flag, vertex.color = "black" )
legend("bottomleft", legend = c("Lower to Higher Rank", "Higher to Lower Rank"),
       fill = unique(E(ip_g)$rank_flag ), cex = .7)
```

# How Do People Talk About R on Twitter?
- We're be building a Graph from Raw Tweets.
- You can create an empty graph using `graph.empty()`.
- You can get the number of nodes of a graph using the function `gsize(<graph>)`.
- You can get the number of edges of a graph using the function `gorder(<graph>)`.
- You can calculate the density of a graph using the function `graph.density( <graph> )`.
- You can create a subgraph from the centrality to further analyze the relationships in the graph.
- This can be done via:
```
# Create subgraph     
subgraph <-induced_subgraph( <graph> , V( <graph> )[V( <graph> )$subAttribute >= quantile(V( <graph> )$subAttribute, <quantile-limit> )])
```
- Communities are a natural way to think about network graphs.
- The function `compare()` allows us to compare between community structures.
- `compare( ment_edg, ment_eigen, method = "vi")`
```
rt_fgc <-  cluster_fast_greedy(as.undirected(rt_g))
rt_info <- cluster_infomap(as.undirected(rt_g))
rt_clust <- cluster_louvain(as.undirected(rt_g))
```
- You can get the membership of a graph using the function `membership()`.
- You can tell whether an edge crosses into another community using the function `crossing(<graph>)`.


# Bike Sharing in Chicago
- You can use the function `farthest_vertices( <graph>)` to get the which to vertices are the furthest away.
- You can use the function `get_diameter( <graph> )` to get the actual path itself.
- We will be using the *geosphere* package to manage the mapping from graph to geography.
- We will use the function `distm( <dataframe-from>, <dataframe-to>, fun = distHaversine)`
```
plot(g275, vertex.label.color = "blue", vertex.label.cex = .6,
     edge.color = 'black', vertex.size = 15, edge.arrow.size = .1,
     edge.width = E(g275)$weight,
     main = "Default Layout")
```
```
# Eigen centrality unweighted
ec_unweight <- eigen_centrality(trip_g_simp, directed = T, weights = NA)

# Closeness weighted
close_weight <- closeness(trip_g_simp, weights = NULL)
```
- **Connectivity** is a measure of how densely connected the vertices of a graph are.
- You can check this against the edges as well as the vertices using the functions:
  * `vertex_connectivity(<graph>)`
  * `edge_connectivity( <graph> )`
- We can also the function `min_cut()` to find out much more.
- To see more information, pass the argument `value.only = F` to `min_cut()`.
- You can use the function `stMinCuts( <graph>, <node-1>, <node-2>)` to find the minimum number of cuts between two points.
```
stMincuts(trip_g_simp, far_stations[1], far_stations[2])$value
```
- 


# Other Ways to Visualize Graph Data

# Research:
- Class dgCMatrix?
- http://igraph.org/c/doc/igraph-Community.html
- `make_ego_graph()`
-

# Reference:
