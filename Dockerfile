# Build: docker build --rm --tag montereytony/ugba88 .
# Push: docker push montereytony/ugba88 
#
# git status
# git commit -m "comments UGBA88 Sprint 2020  "
# git push
#
ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Tony Cricelli <montereytony@gmail.com>"

# Install Tensorflow
RUN pip install --quiet \
    'tensorflow==2.0.0' && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
RUN pip install datascience

ADD custom.css /home/jovyan/.jupyter/custom.css
ADD custom.css /home/jovyan/.jupyter/custom/custom.css
RUN jupyter nbextensions_configurator enable
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix

ADD common.json   /home/jovyan/.jupyter/common.json
ADD tree.json     /home/jovyan/.jupyter/tree.json
ADD notebook.json /home/jovyan/.jupyter/notebook.json
USER jovyan
