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
- **Back Propogation** takes the error from the output layer and sends it back towards the input layers.
- It allows the weight updates to get sent through all the weights.
- It comes from the *Chain Rule* in calculus.
- In perspective, we're trying to get the slope of the loss function with respect to each weight.
- To create the gradients for the weight we need:
  1. Node value feeding into the weight.
  2. Slope of the loss function w.r.t ( with respect to) the node that feeds into it.
  3. Slope of the activation function at the node it feeds into.
- The value is calculated using `[value_of_in_node] * [value_of_loss_function] * [slope_of_activation_function]`.
- **Stochastic Gradient Descent** is when you use batches to update the weights instead of the whole dataset.


# Building a Deep Learning Model With Keras
- Building a Keras model has four parts:
  1. Specify the Architecture.
  2. Compile the model.
  3. Fit the model.
  4. Predict
- The normal model we'll build starts with the function `model = Sequential()`.
- You then add layers using the `model.add( Dense(100, activation='relu', input_shape = (n_cols,)))`
- *Dense* means that all the nodes in the previous layer are connected to all the nodes in this layer.
- In the first layer, you need to specify the number of input nodes along with the activation function.
```python3
```
- For the compile part, you need:
  1. Specify the optimizer ( Learning Rate ).
    - Adam is usually best.
  2. Loss function:
    - Usually Mean Squared Error.
- Scaling data before fitting can ease optimization.
```
# Compile the model
model.compile( optimizer = 'adam', loss = 'mean_squared_error')

# Verify that model contains information from compiling
print("Loss function: " + model.loss)
```
- You then fit the model using `model.fit( <predictors>, <target>)`.
- For doing *Classification*, it's sort of the same process.
- The first difference is changing the loss function to *cateforical_crossentropy*.
- This is similar to *Log Loss*.
- You can also pass `metrics = ['accuracy']` to the function `compile()` to have it print it out.
- You also need to make sure to change the output to 1 per each possible class.
  - This is also the *softmax activation*.
- You're want the outcomes to be in their own respective columns.
- We can do that with the function `keras.utils.to_categorical( <data.column_name> )`.
- You can save a model using `model.save('<filename.h5>')`.
- You can load a model for use later using `keras.models.load_model('<filename.h5>')`.
```python3
# Calculate predictions: predictions
predictions = model.predict( pred_data )

# Calculate predicted probability of survival: predicted_prob_true
predicted_prob_true = predictions[:,1]

# print predicted_prob_true
print(predicted_prob_true)
```


# Fine-Tuning Keras Models
- Optimization is a hard problem.
- The easiest optimizer is called **Stocastic Gradient Descent** - also called *SDG*.
- The **Dying Neuron Problem** is when a neuron takes negative values for all input weights.
- Therefore, once a neuron starts taking in 0's, then it may continue getting only negative inputs.
```python3
# Import the SGD optimizer
from keras.optimizers import SGD

# ...
# Create SGD optimizer with specified learning rate: my_optimizer
    my_optimizer = SGD(lr=lr)

    # Compile the model
    model.compile( optimizer = my_optimizer, loss = 'categorical_crossentropy')
```
- Few people run K-fold cross validation on Deep Learning data.
- Keras makes it easy to split up data into a test and train.
- You use pass the parameter `validation_split = <.N>` to the function `model.fit()`.
- You can also stop the model from building completely if training stalls out.
- You do that using `keras.callbacks.EarlyStopping` and call with `EarlyStopping(patience=<n>)`.
- You then pass those to `model.fit()` with parameter `callbacks = [<cb1>, <cb2>]`.
- By default, Keras trains for 10 epochs.
- Workflow:
  1. Start with a small network.
  2. Get the validation score.
  3. Keep increasing capacity until the validation is no longer improving.


# Research:

# Reference:
- [keras.io](www.keras.io)
