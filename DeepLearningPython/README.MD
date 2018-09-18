# Deep Learning in Python
## Dan Becker

# Basics of Deep Learning and Neural Networks
- A **Neural Network** network is comprised of an *Input Layer*, *Hidden Layers* and an *Output Layer.*.
- **Forward Propagation** is just the **Dot Product** in practice.
- The values that get fed into the hidden nodes are what get updated as the Network learns.
```python
# Calculate node 0 value: node_0_value
node_0_value = ( input_data * weights['node_0']).sum()

# Calculate node 1 value: node_1_value
node_1_value = ( input_data * weights['node_1']).sum()

# Put node values into array: hidden_layer_outputs
hidden_layer_outputs = np.array([node_0_value, node_1_value])

# Calculate output: output
output = ( hidden_layer_outputs * weights['output']).sum()

# Print output
print(output)
```
- For a Neural Network to maximize its predictive power, then we need to use **Activiation Functions**.
- This allows the model to capture non-linearities.
- *Activation Functions* are applied to the values coming into a node before the values are stored.
- The most common non-linear function has been *Hyperpolic Tan* until recently.
- Now, the most common is called the **Rectified Linear Unit**.
- It's just: `if x < 0, then return 0; else return x`.
- The further success of Neural Networks has been due to the increase in hidden layers.
- Deep Learning Networks internally build representations of patterns in the data.
```python
def predict_with_network(input_data):
    # Calculate node 0 in the first hidden layer
    node_0_0_input = ( input_data * weights['node_0_0']).sum()
    node_0_0_output = relu( node_0_0_input )

    # Calculate node 1 in the first hidden layer
    node_0_1_input = ( input_data * weights['node_0_1']).sum()
    node_0_1_output = relu( node_0_1_input )

    # Put node values into array: hidden_0_outputs
    hidden_0_outputs = np.array([node_0_0_output, node_0_1_output])

    # Calculate node 0 in the second hidden layer
    node_1_0_input = ( hidden_0_outputs * weights['node_1_0'] ).sum()
    node_1_0_output = relu( node_1_0_input )

    # Calculate node 1 in the second hidden layer
    node_1_1_input = ( hidden_0_outputs * weights['node_1_1']).sum()
    node_1_1_output = relu( node_1_1_input)

    # Put node values into array: hidden_1_outputs
    hidden_1_outputs = np.array([node_1_0_output, node_1_1_output])

    # Calculate model output: model_output
    model_output = ( hidden_1_outputs * weights['output']).sum()

    # Return model_output
    return(model_output)

output = predict_with_network(input_data)
print(output)
```


# Optimizing a Neural Network with Backward Propogation
- When the values returned from a Node is the same as the input, then it's called the **Identity** function.
- Making accurate predictions gets harder with more points.
- We use the **Loss Function** to aggregate the errors in predictions from many data points into a single number.
- A common loss function is the Mean Squared Error.
- Our goal is to find the weights that give the lowest value for the loss function.
- This is detected via **Gradient Descent**.
- If the slope is positive, then you move towards lower numbers.
- If the slope is negative, then you move towards higher numbers.
- To assist with controlling the movement of the Gradient Descent, we multiple the slope times the *Learning Rate*.
- To calculate this, you take `2 * [(Output-Gotten - Target-Value) * Learning-Rate]`.
- 



# Building a Deep Learning Model With Keras

# Fine-Tuning Keras Models


# Research:

# Reference:
