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
- In many cases, we want to check now some number or function changes over time.
- An example of an **Evolving Graph** is a communication network.
- *NetworkX* has a function to tell the difference between Graphs called `.difference(G1, G2 )`.
- Remember that the order submitted matters.
```python
# Compute graph difference here
    added.append( nx.difference(g2, g1))   
    removed.append( nx.difference( g1, g2 ))

    # Compute change in graph size over time
    fractional_changes.append((len(g2.edges()) - len(g1.edges())) / len(g1.edges()))
```
- We can summarize the graphs over time using:
  1. Number of Nodes.
  2. Number of Edges.
  3. Degree distribution.
  4. Centrality distribution.


# Tying it up
- Now we're going to examine how to build a dataset.
- Once the the data is in a dataframe, we can use `G.add_nodes_from(df['columnname'], bipartite = "<category>")`.
- Using the function `zip()` is great way to iterate of a dataframe and add them as edges.
```python
import networkx as nx

# Instantiate a new Graph: G
G = nx.Graph()

# Add nodes from each of the partitions
G.add_nodes_from( data['student'], bipartite = "student")
G.add_nodes_from( data['forum'], bipartite = "forum")

# Add in each edge along with the date the edge was created
for r, d in data.iterrows():
    G.add_edge( r, d )

    # Get the student partition's nodes: student_nodes
    student_nodes = [n for n, d in G.nodes(data=True) if d['bipartite'] == 'student']

    # Create the students nodes projection as a graph: G_students
    G_students = nx.bipartite.projected_graph(G, nodes = student_nodes)

    # Calculate the degree centrality using nx.degree_centrality: dcs
    dcs = nx.degree_centrality(G_students)

    # Plot the histogram of degree centrality values
    plt.hist(list(dcs.values()))
    plt.yscale('log')  
    plt.show()

# Instantiate a new graph: G_sub
G_sub = nx.Graph()

# Add nodes from the original graph
G_sub.add_nodes_from( G.nodes(data=True))

# Add edges using a list comprehension with one conditional on the edge dates, that the date of the edge is earlier than 2004-05-16.
G_sub.add_edges_from([(u, v, d) for u, v, d in G.edges(data=True) if d['date'] < datetime(2004,5,16)])
```
- Now for Time Series Analysis.
- You can use the function `datetime.timedelta(<duration>)` to generate a delta object.


# Research:

# Reference:
