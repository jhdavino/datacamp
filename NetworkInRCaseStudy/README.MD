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


# Other Ways to Visualize Graph Data
- We'll also be using the package `ggnetwork`.
- As well as the package `GGally`
- To get from igraph to GGplot, you will need to use the `intergraph::asNetwork` function.
- Then, you can call `ggnet2( <graph> )` to get it to plot.
```
library( igraph )
library( intergraph )
library( ggnet2 )

rt_samp <- induced_subgraph(rt_g, verts)

# Convert from igraph using asNetwork()
net <- asNetwork(rt_samp)

# Plot using igraph
plot(rt_samp, vertex.label = NA, edge.arrow.size = 0.2, edge.size = 0.5, vertex.color = "black", vertex.size = 1)

# Plot using ggnet2
ggnet2(net, node.size = 1, node.color = "black", edge.size = .4)
```
- You can also use the function `ggnetwork()` inside a call to `ggplot()` in place of data to plot it.
- The advantage of *ggnet2* is that they're closer to *ggplot2* so they require less verbosity to create graphs.

```
ggnet2(net, node.size = "cent", node.color = "comm", edge.size = .1,
       color.legend = "Community Membership", color.palette = "Spectral",
       edge.color = c("color", "gray88")) +
  guides( size = FALSE)
```
- Or `ggnetwork`:
```
# Added guide legend, changed line colors, added size
ggplot(ggnetwork(rt_g_smaller, arrow.gap = .01),
       aes(x = x, y = y, xend = xend, yend = yend)) +
       geom_edges(arrow = arrow(length = unit(6, "pt"),
                  type = "closed"),
                  curvature = .2,
                  lwd = .3,
                  aes(color = comm)) +
       geom_nodes(aes(color = comm, size = cent)) +
       theme_blank() +
       guides(color = guide_legend(title = "Community"),
              size = guide_legend(title = "Centrality"))
```
- Class dgCMatrix?
- `make_ego_graph()`
- We'll be using the packages **htmlwidgest** and **networkD3** as well.
- To get a ggnetwork into a format that D3 understands, you can use the function `geom_point_interactive()`
- You display it using the function `ggiraph( code = print( <graph-object>))`.
- You can add css to the object since it is a webpage underneath.
- The commen network graph without any ordering or shaping is called a **Hairball plot**.
- **Hive Plots** are a great plot because it uses the features of the graph to control its display structure.
- Convert to an edgelist first using the function `get.edgelist( <graph> )`.
- Then, you convert the data frame to a HivePlot Object using `HiveR::edge2HPD( edge_df  = <dataframe> )`.
- You should adjust the axis and radius of each node using `hive$nodes$axis <- sort( rep(1:3, 6))`.
- The Best way to think about this is of a polar graph.
- *Hive objects* have two attributes you can change:
  1. Nodes.
  2. Edges.
- **Biofabric Plots** are plots were the vertices are placed on the X axis and ordered by density of connectiviy.
- You create it using the function `bioFabric( <igraph> )`.
- You print it using the function `bioFabric_htmlwidget( <bioObject> )`.
```
# Set axis as integers and axis colors to black
bike_hive$nodes$axis <- as.integer(dist_stations$axis)
bike_hive$axis.cols <- rep("black", 3)
```
```
# Create a dataframe of start and end latitude and longitude and add weights
ll_to_plot <- bike_dat %>% group_by(from_station_id, to_station_id, from_latitude,
                               from_longitude, to_latitude, to_longitude, usertype) %>%
  summarise(weight = n())

# Create a base map with station points with ggmap()
ggmap(chicago) +
  geom_segment(data = ll_to_plot,
              aes(x = from_longitude, y = from_latitude,
                  xend = to_longitude, yend = to_latitude,
                  colour = usertype, size = weight),
              alpha = .5)
```


# Research:


# Reference:
- http://igraph.org/c/doc/igraph-Community.html
