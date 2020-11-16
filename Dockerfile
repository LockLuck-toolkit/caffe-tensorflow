# Install Caffe and python2.7
#
# Priscila's First Dockerfile


FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# install git / python2.7 / pip / OpenCV
RUN apt-get update
RUN apt-get -y upgrade
#RUN apt-get install -y apt-utils

# pyrhon2.7 / pip / opencv
RUN apt-get install -y python2.7
RUN apt-get install -y python2.7-dev 
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
RUN python2.7 get-pip.py
RUN apt-get install -y libopencv-dev 
RUN apt-get install -y python-opencv

#RUN pip install -r requirements.txt
RUN pip install protobuf==3.4.0
RUN pip install scipy
RUN pip install pillow
RUN pip install ipython 
RUN pip install glog 
RUN pip install h5py
RUN pip install scikit-image
RUN pip install tensorflow==1.10.0


# Caffe General Dependencies
RUN apt-get install -y libopenblas-dev
RUN apt-get install -y libatlas-base-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libprotobuf-dev
RUN apt-get install -y libleveldb-dev 
RUN apt-get install -y libsnappy-dev 
RUN apt-get install -y libopencv-dev 
RUN apt-get install -y libhdf5-serial-dev 
RUN apt-get install -y protobuf-compiler 
RUN apt-get install -y libgflags-dev 
RUN apt-get install -y libgoogle-glog-dev 
RUN apt-get install -y liblmdb-dev 


RUN apt-get install -y vim
RUN apt-get install -y git
RUN git clone https://github.com/BVLC/caffe

WORKDIR caffe

COPY /Makefile.config ./

RUN make all
RUN make test
RUN make runtest
RUN make pycaffe

RUN export PYTHONPATH=/root/caffe/python:$PYTHONPATH 
RUN echo "PYTHONPATH=/root/caffe/python:$PYTHONPATH" >> /root/.bashrc

WORKDIR /

