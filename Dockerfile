FROM ubuntu:22.04

RUN apt update && apt install -y wget

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh && \
    bash Miniforge3-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniforge3-Linux-x86_64.sh

RUN adduser --home /home/conda --shell /bin/bash --uid 1000 --disabled-password --gecos "" conda

COPY --chown=conda:conda testconda.sh /home/conda/testconda.sh

USER conda
WORKDIR /home/conda

CMD ["/bin/bash", "testconda.sh"]
