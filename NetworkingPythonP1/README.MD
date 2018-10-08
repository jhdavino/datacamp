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

# Structures

# Brining It Together

# Research:
- [Konect](http://konect.uni-koblenz.de/)
-


# Reference:
