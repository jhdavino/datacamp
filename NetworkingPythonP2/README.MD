# Network Analysis in Python, Part 2
## Eric Ma

# Bipartite Graphs & Product Recommendation Systems
- The **Bipartite Graph** is a graph that is partitioned into two groups where they are not connected to their own group.
- The *normal* graph is called the **Unipartite Graph** which is what we were doing before.
- You let *NetworkX* know that this is *bipartite* by passing the keyword `bipartitle = "<term>"` to the function `G.add_nodes_from()`
- You can get access to that attribute using:
```python
for n in G.nodes():
        # Check that the node belongs to the particular partition
        if G.node[n]['bipartite']
```
- You can use functions liked `intersection()` and `union()` once a list is a set.
```python
# Check that the nodes belong to the same partition
 assert G.node[node1]['bipartite'] == G.node[node2]['bipartite']

 # Get neighbors of node 1: nbrs1
 nbrs1 = G.neighbors( node1 )
 # Get neighbors of node 2: nbrs2
 nbrs2 = G.neighbors( node2 )

 # Compute the overlap using set intersections
 overlap = set(nbrs1).intersection(nbrs2)
 return overlap
 ```


# Graph projections

# Comparing Graphs & Time-Dynamic Graphs

# Tying it up

# Research:

# Reference:
