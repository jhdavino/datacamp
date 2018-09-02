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
- 

# Bike Sharing in Chicago

# Other Ways to Visualize Graph Data

# Research

# Reference:
