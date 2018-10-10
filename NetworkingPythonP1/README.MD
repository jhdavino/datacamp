# Network Analysis in Python, Part 1
## Eric Ma

# Introduction to Networks
- Examples of Networks:
  1. Social "
  2. Transportation "
- They're used to Model relationships between entities.
- You can find out details such as:
  * Important Entities.
  * Parthfinding Algorithms.
  * Find Communities.
- **Networks** are formed via two parts: nodes and edges.
- This is also refered to a **Graph**.
- We're going to be using the Python package *NetworkX*.
- It's typically imported as *nx*.
- You can add nodes using the function `g.add_nodes_from( [ ] )`
- You see the nodes in the graph using the function `G.nodes()`
- You can add an edge using the function `G.add_edge( x,y )`
- You can see the edges in a graph using the function `G.edges()`
- You can add metadata using the format `G.nodes[n]['label'] = <value>`.
- You can get the metadata as well when you use the syntax `G.nodes( data = True )`.
- The package also comes with a basic ability to draw graphs using `nx.draw( G )`.
- In oder to show the graph, you will also need *matplotlib* and a call to `plt.show()` to print it.
-
```python
import networkx as nx
G = nx.Graph() # empty graph

# Add nodes using
G.add_nodes_from( [1, 2, 3])

# check all the nodes in the grpah using:
G.nodes()

# add edge
G.add_edges( 1, 2)

# see them:
G.edges()
G.node[1]['label'] = 'blue'
```
- Exaples of how to query a graph:
```python
# Use a list comprehension to get the nodes of interest: noi
noi = [n for n, d in T.nodes(data=True) if d['occupation'] == 'scientist']

# Use a list comprehension to get the edges of interest: eoi
eoi = [(u, v) for u, v, d in T.edges(data=True) if d['date'] < date(2009,12,31) ]
```
- **Undirected Graphs** don't have any sort of directionality attached.
- *Undirected Graphs* have the type *Grpah*.
- A **Directed Graph** is where there is a direction inherit to it.
- You can create a *Directed Graph* instead using the function `nx.DiGraph()`.
- Objects created this way will have a class of *DiGraph*.
- You can also create a **Mulitple Directional Graph** using the function `nx.MultiDiGraph()`.
- Objects created this way have a class of *MultiGraph*.
- Sometimes it makes sense in a *Mutligraph* to collapse them into a single edge and a weight value instead.
- **Self Edges** just refer back to the same node.
```python
# Set the weight of the edge
T.edge[1][10]['weight'] = 2

# Iterate over all the edges (with metadata)
for u, v, d in T.edges(data=True):

    # Check if node 293 is involved
    if 293 in [u,v]:

        # Set the weight to 1.1
         T.edge[u][v]['weight']= 1.1
```
- We're going to explore using three different ways to visualize a Network:
  1. Matrix Plots.
  2. Arc Plots.
  3. Circos Plots
- In a **Matrix Plot**, nodes are the rows and edges are the columns.
- *Undirected Graphs* should be symmetric around the diagonal.
- An **Arc Plot** is where the nodes are ordered along the x axis of the plot and edges are drawn using circular arcs.
- A **Circos Plot** is a plot where the the two ends of the *Arc plot* are joined into a circle.
- We'll be using the author - Eric Ma's - package *nxviz*.
- It is standard to import nxviz as nv.
- You tell it how to display the graph using `nv.ArcPlot( G )`.
- You assign that value to an object, and then call `.draw()` on it.
```python
# Convert T to a matrix format: A
A = nx.to_numpy_matrix(T)

# Convert A back to the NetworkX form as a directed graph: T_conv
T_conv = nx.from_numpy_matrix(A, create_using=nx.DiGraph())

# Create the customized ArcPlot object: a2
a2 = ArcPlot( T, node_order = "category", node_color = "category")
```


# Important Nodes
- How do we tell what nodes are *important*?
  1. Degree Centrality.
  2. Betweenness Centrality.
- **Centrality**: The number of neighbors I have / Number of Neighbours I could have.
- You can get the neighbors of a graph using the function `.neighbors(n)`.
- You can get the **Degree Centrality** of a graph using function `nx.degree_centrality( G )`.
- Remember that self-loops are not considered by default.
```python
# Define nodes_with_m_nbrs()
def nodes_with_m_nbrs( G, m ):
    """
    Returns all nodes in graph G that have m neighbors.
    """
    nodes = set()

    # Iterate over all nodes in G
    for n in G.nodes():

        # Check if the number of neighbors of n matches m
        if len( G.neighbors(n)) == m:

            # Add the node n to the set
            nodes.add( n )

    # Return the nodes with m neighbors
    return nodes

# Compute and print all nodes in T that have 6 neighbors
six_nbrs = nodes_with_m_nbrs( T, 6 )
print(six_nbrs)
```
```python
# Compute the degree of every node: degrees
degrees = [ len( T.neighbors( n )) for n in T.nodes() ]

# Print the degrees
print( degrees )
```
```python
# Import matplotlib.pyplot
import matplotlib.pyplot as plt

# Compute the degree centrality of the Twitter network: deg_cent
deg_cent = nx.degree_centrality(T)

# Plot a histogram of the degree centrality distribution of the graph
plt.figure()
plt.hist(list(deg_cent.values()))
plt.show()

# Plot a histogram of the degree distribution of the graph
plt.figure()
plt.hist(degrees)
plt.show()

# Plot a scatter plot of the centrality distribution and the degree distribution
plt.figure()
plt.scatter(degrees, list(deg_cent.values()))
plt.show()
```
- Now we're going to be moving to *Optimization Problems*.
- **Pathfinding** is important for:
  * Finding the shortest path.
  * Modeling the spread of things.
- One such algorithm is the **Breadth-First Search**.
- Developed in the 1950s.
- **All Shortest Paths**:
  1. Set of paths.
  2. Each path is shortest path between given pair of nodes.
- Def: **Betweenness Centrality**: Num of shortest paths through node / all possible shortest paths.
- You can create a *barbell graph* using the function `nx.barbell_graph(m1 = 5, m2 =1)`.
- You can calculate the *Betweenness Centrality* using the function `nx.betweeness_centrality(G)`.
```python
# Define find_nodes_with_highest_deg_cent()
def find_nodes_with_highest_deg_cent(G):

    # Compute the degree centrality of G: deg_cent
    deg_cent = nx.degree_centrality( G )

    # Compute the maximum degree centrality: max_dc
    max_dc = max( list(deg_cent.values()) )

    nodes = set()

    # Iterate over the degree centrality dictionary
    for k, v in deg_cent.items():

        # Check if the current value has the maximum degree centrality
        if v == max_dc:

            # Add the current node to the set of nodes
            nodes.add( k )

    return nodes
```


# Structures
- A **Social Clique** is usually a tightly knit group.
- We can use the code:
```python
from itertools import combinations
for n1, n2 in combinations(G.nodes(), 2):
  # insert computations here
```
- You can check if an edge exists from the function `G.has_edge( <n1>, <n2>)`
- You can count the number of triangles that nodes are involved in using the function `nx.triangles(G)`.
- A **Maximal Clique** is a clique that if extended by one node is no longer a clique.
- This has usage in community finding.
- You can find all the maximal cliques using the function `nx.find_cliques( <G> )`.
- This returns a generator - which can be converted into results using the function `list()`.
- You can get a subgraph of the graph using the function `G.subgraph(<nodes>)`
- To draw the subgrpah, use the syntax `nx.draw( G_sub, with_labels = True)`.
```python
# Extract the nodes of interest: nodes
nodes = [n for n, d in T.nodes(data=True) if d['occupation'] == 'celebrity']

# Create the set of nodes: nodeset
nodeset = set(nodes)

# Iterate over nodes
for n in nodes:

    # Compute the neighbors of n: nbrs
    nbrs = T.neighbors(n)

    # Compute the union of nodeset and nbrs: nodeset
    nodeset = nodeset.union(nbrs)

# Compute the subgraph using nodeset: T_sub
T_sub = T.subgraph(nodeset)

# Draw T_sub to the screen
nx.draw(T_sub)
plt.show()
```


# Brining It Together

# Research:
- [Konect](http://konect.uni-koblenz.de/)
-


# Reference:
