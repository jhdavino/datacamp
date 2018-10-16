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
- We're going to be learning about Matrix **Projections**.
- You can read an edgelist using the function `nx.read_edgelist('<filename>')`.
- You can get the **Bipartite Projection Graph** using the function `nx.bipartite.project_graph( G, <nodes>)`/
- The *degree centrality* of the bipartite graph is the number of neighbors / the number of possible neighbors in the other group or part.
- You can get that information using the function `nx.bipartite.degree_centrality(G, <nodes>)`.
```python
# Prepare the nodelists needed for computing projections: people, clubs
people = [n for n in G.nodes() if G.node[n]['bipartite'] == 'people']
clubs = [n for n, d in G.nodes(data=True) if d['bipartite'] == 'clubs']

# Compute the people and clubs projections: peopleG, clubsG
peopleG = nx.bipartite.projected_graph(G, people)
clubsG = nx.bipartite.projected_graph( G, clubs)
```
- ` In your calls to plt.hist(), remember to first use the .values() method on computed degree centralities and convert them into a list.`
- You can convert the bipartite graph to a Matrix representation.
- This is done with Rows meaning nodes in one partition; Columns meaning the other partition.
- The function to build this is `nx.bipartite.biadjecency_matrix( G, row_order = <cust_nodes>, column_order = <prod_nodes>)`.
- You don't have to list both; it can figure it out with just one.
- There is a direct way to compute the projection of a graph in Matrix Multiplication.
- Python 3.5 has a matrix multiplication operator `@`.
```python
# Set the diagonal to zero and convert it to a coordinate matrix format
user_matrix.setdiag(0)
users_coo = user_matrix.tocoo()

# Find pairs of users who shared membership in the most number of clubs
indices = np.where(users_coo == users_coo.data.max())[0]
print('People with most number of shared memberships:')
for idx in indices:
    print('- {0}, {1}'.format(people_nodes[users_coo.row[idx]], people_nodes[users_coo.row[idx]]))  
```
- To store the network to CSV, you will need to modify the format and use the function `pd.DataFrame( <nodelist> ).to_csv('<fileanme.csv')`.
```python
# Initialize a list to store each edge as a record: nodelist
nodelist = []
for n, d in G_people.nodes(data=True):
    # nodeinfo stores one "record" of data as a dict
    nodeinfo = {'person': n}

    # Update the nodeinfo dictionary
    nodeinfo.update(d)

    # Append the nodeinfo to the node list
    nodelist.append( nodeinfo )


# Create a pandas DataFrame of the nodelist: node_df
node_df = pd.DataFrame( nodelist )
```


# Comparing Graphs & Time-Dynamic Graphs

# Tying it up

# Research:

# Reference:
