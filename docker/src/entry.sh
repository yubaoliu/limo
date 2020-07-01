#!/bin/bash
set -e

# setup ros environment
source /opt/ros/melodic/setup.bash

cd /workspace/limo_ws/src/limo
cd feature_tracking
git checkout python_binding

cd /workspace/limo_ws/src/limo/feature_tracking/feature_tracking_core/notebook
jupytext feature_tracking_notebook.py --to notebook

# Compile
cd /workspace/limo_ws
catkin_make

source /workspace/limo_ws/devel/setup.bash 
# jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root /workspace/limo_ws/src/limo/feature_tracking/feature_tracking_core/notebook/feature_tracking_notebook.ipynb

echo "============READY=============="

exec "$@"
