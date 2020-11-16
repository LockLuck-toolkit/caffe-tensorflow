# Caffe to TensorFlow

Convert [Caffe](https://github.com/BVLC/caffe/) models to [TensorFlow](https://github.com/tensorflow/tensorflow).

## Usage with standalone model inside docker container

### 1 - Install caffe-tensorflow
```
git clone https://github.com/psaboia/caffe-tensorflow
# This fork has only be tested with Python 2.7 and Tensorflow CPU 
```

### 2 - Build docker image
```
cd caffe-tensorflow
sudo docker build -t caffe-tensorflow .
```

### 3 - Run docker container
```
docker run -ti caffe-tensorflow bash
```

### 4 - Convert your model
```
cd caffe-tensorflow
python2.7 convert.py --caffemodel ./model.caffemodel ./model.prototxt --data-output-path ./output.mat --code-output-path ./output.py --standalone-output-path ./standalone.pb
```

### 5- Use the standalone.pb file 
It contains the weights and the architecture of the network.


## Usage

Run `convert.py` to convert an existing Caffe model to TensorFlow.

The input consists of an existing Caffe model. Make sure you're using the latest Caffe format.

The output consists of the files:

1. A standalone.pb GraphDef model file containing the model's graph and learned parameters (to be loaded on Tensorflow)
2. A data file (in NumPy's native format) containing the model's learned parameters.
3. A Python class that constructs the model's graph.

### Examples
