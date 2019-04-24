# Supply Chain Analytics in Python
## Aaren Stubberfield

# Basics of Supply Chain Optimization and PuLP
- We'll start with the basics of Supply Optimzation.
- A **Supply Chain** Consists of all parties involved, directly of indirectly, in fulfilling a customer's request.
- This includes:
  * Suppliers.
  * Internal Manufacturing.
  * Outsourced Logistics Suppliers.
- When fulfilling the request, there are often multiple routes through the supply chain:
![Supply Chain Visualization](images/SupplyChainVisual.png)
- We're going to get a crash course in **Linear Programming**.
  * It is a Optimzation method using a mathematical model whose requirements are linear relationships.
- It's a powerful modeling tool for Optimization.
- The three pieces to these models are:
  1. Decision Variable: what you can control.
  2. Objective Function: Math expression taht uses variables to express goals.
  3. Contraints: Math expressions that describe the limits of a solution.
- There are three kinds of these models:
  1. Linear Programming.
  2. Integer Programming.
  3. Mixed Integer Programming.
![Different Types of these LP Models](images/LPvsIPvsMIP.png)
- The course will focus on using the Python **PuLP** library.
- It is a framework for linear and Integer Programming Problems.
- It is maintained by the **Computational Infrastructure for Operations Research(COIN-OR)**.
- There are many different solvers.
- First play problem will focus on **Resource Scheduling**.
  * Profits = 20*A + 40*B
  * Contraints:
    * A, B > 0
    * Cannot exceed 30 days.
    * Worker Packaging them is only available 22 days.
- Steps:
  1. Initialize Model.
  2. Define Decision Variables.
  3. Define the Object Function.
  4. Define the Constraints.
  5. Solve Model.
- To initialize the problem, you'd use the function `LpProblem(name = 'name', sense=LpMinimize)`.
- The parameter `sense` is tells it whether to minimize or maximize ( `LpMaximize`) for the problem.
- Then, we define the Decision Variables using the function `LpVariable`.
- It has 5 arguments:
  * name
  * `lowBound = None`
  * `upBound = None`
  * `cat = 'Continuous'`
  * `e = None`
- Other arguments for `cat` would be `Integer` or `Binary`.
- The `e` parameter is about *column based modeling* which will not get talked about in this course.
- Then, we define our **Objective Function** using the *Variables*.
- Then, we define the constraints.
![Full Code Example](images/Basics-of-PuLP.png)
```python
# Initialize Class
model = LpProblem("Maximize Glass Co. Profits", LpMaximize)

# Define Decision Variables
wine = LpVariable('Wine', lowBound=0, upBound=None, cat='Integer')
beer = LpVariable('Beer', lowBound=0, upBound=None, cat='Integer')

# Define Objective Function
model += 5 * wine + 4.5 * beer

# Define Constraints
model += 6 * wine + 5 * beer <= 60
model += 10 * wine + 20 * beer <= 150
model += wine <= 6

# Solve Model
model.solve()
print("Produce {} batches of wine glasses".format(wine.varValue))
print("Produce {} batches of beer glasses".format(beer.varValue))
```
- Moving from Simple Models with 6 products to something like 150 products is a problem with our existing method.
- We're going to do that later, but will assume it was done for now.
- The function `LpSum()` will sum a list of linear expressions.
- Therefore:
```python
model += 20*A + 40*B + ...
```
- ... and:
```python
var_list = [20*A, 40*B, ... ]
lpSum( var_list )
```
- ... are the same.
- It is common to use list or comprehensions for this.
```python
# Define Objective Function
model += lpSum([1.5 * var_dict[(i, 'cream')]
                + .125 * var_dict[(i, 'milk')]
                + .1 * var_dict[(i, 'sugar')]

                # Iterate over product types
                for i in prod_type])
```
- This works?!?:
```python
# Define Objective
model += lpSum([costs[(w, c)] * var_dict[(w, c)]
                for c in customers for w in warehouse])

# For each customer, sum warehouse shipments and set equal to customer demand
for c in customers:
  model += lpSum([var_dict[(w, c)] for w in warehouse]) == demand[c]
```


# Modeling in PuLP
- We have not discussed how to create Variables at scale.
- We can use the function `LpVariable.dicts()` function to help us define them at scale.
- It has the arguments:
  1. `name` for the prefix per LP Variables.
  2. `indexs` for the list of strings of the keys to the dictionary.
  3. Same as before.
```python
# Define decision variables
key = [(m, w, c) for m in months for w in warehouse for c in customers]
var_dict = LpVariable.dicts('num_of_shipments',
                            key,
                            lowBound=0, cat='Integer')

# Use the LpVariable dictionary variable to define objective
model += lpSum([costs[(w, c)] * var_dict[(m, w, c)]
                for m in months for w in warehouse for c in customers])
```
- Example of solving the Traveling Salesmen Problem:
```python
# Define Decision Variables
x = LpVariable.dicts('X', [(c1, c2) for c1 in cities for c2 in cities],
                     cat='Binary')
u = LpVariable.dicts('U', [c1 for c1 in cities],
                     lowBound=0, upBound=(n-1), cat='Integer')

# Define Objective
model += lpSum([dist.iloc[c1, c2] * x[(c1, c2)]
                for c1 in cities for c2 in cities])

# Define Constraints
for c2 in cities:
    model += lpSum([x[(c1, c2)] for c1 in cities]) == 1
for c1 in cities:
    model += lpSum([x[(c1, c2)] for c2 in cities]) == 1
```
- It is not uncommon to realize that you'll need to adjust the model once you've started.
![ Ways to Mitigate Duplicate Counting](images/FormulationOfFormula.png)
- When we define the dictionary method, we'll need to insert the values:
```python
# The class has been initialize, and x, and days defined
model = LpProblem("Minimize Staffing", LpMinimize)
days = list(range(7))
x = LpVariable.dicts('staff_', days, lowBound=0, cat='Integer')

# Define Objective
model += lpSum([x[i] for i in days])
```
![Regional Product Demand](images/RegionalProductDemand.png)
![Shipping Example](images/ShippingExample.png)
```python
# Initialize, and Define Decision Vars.
model = LpProblem("Capacitated Plant Location Model", LpMinimize)
loc = ['USA', 'Germany', 'Japan', 'Brazil', 'India']
size = ['Low_Cap','High_Cap']
x = LpVariable.dicts("production_", [(i,j) for i in loc for j in loc],
                     lowBound=0, upBound=None, cat='Continous')
y = LpVariable.dicts("plant_",
                     [(i,s) for s in size for i in loc], cat='Binary')

# Define objective function
model += (lpSum([fix_cost.loc[i,s] * y[(i,s)]
                 for s in size for i in loc])
          + lpSum([var_cost.loc[i,j] * x[(i,j)]
                   for i in loc for j in loc]))
```
- Now we're going to talk more about **Logical Constraints**.
- What happens when you need to select when two features are not allowed at the same time?
![Constraint Solution](images/LogicalConstraint.png)
- What happens when there is a dependency where one feature **must** also come along?
![Logically Must Follow](images/LogicallyMustFollow.png)
![More Logically Constraints](images/OtherLogicalConstraints.png)
```python
# if first location is selected, then second location is as well.
model += x['A'] - x['D'] <= 0
model += x['B'] - x['E'] <= 0
```


# Solve and Evaluate Model

# Sensitivity and Simulation Testing of Model

# Research:
- column based modeling?
- Miller-Tucker-Zemlin (MTZ) showed it can be completed using Integer Linear Programing ( Traveling Salesmen Problem).
- Review the MIT courseware linked in the Other Logical Constraints image.
-


# Reference:
 - *Supply Chain Management: Strategy, Planning, and Operations.*
