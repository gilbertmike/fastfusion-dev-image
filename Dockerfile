FROM gilbertmike/isl-image:latest-amd64

ENV BUILD_DIR=/usr/local/src

ENV VIRTUAL_ENV=/opt/venv

WORKDIR $BUILD_DIR
RUN pip3 install pydantic>=2.0.0 \
                 pydantic-yaml>=0.11.0 \
                 pyyaml>=6.0.0 \
                 pandas \
                 numpy \
                 jinja2 \
                 tqdm \
                 sympy \
                 scipy \
                 platformdirs \
                 pydot \
                 joblib \
                 fast_pareto \
                 paretoset

WORKDIR $BUILD_DIR
RUN wget -O combinatorics.tar.gz https://github.com/gilbertmike/combinatorics/archive/refs/tags/1.0.0.tar.gz \
    && tar -xvzf combinatorics.tar.gz \
    && cd combinatorics-1.0.0 \
    && pip3 install .
