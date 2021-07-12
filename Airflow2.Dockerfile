FROM apache/airflow:2.1.1-python3.7

USER root
RUN apt-get update -yqq \
    && apt-get install -y libpq-dev \
    && apt-get install -y build-essential \
    && apt-get install -y vim \
    && apt-get install -y git 

COPY ./requirements.txt /requirements.txt
COPY ./viewflow /viewflow/viewflow
COPY ./pyproject.toml /viewflow/
COPY ./README.md /viewflow/

USER airflow

ENV PYTHONPATH /viewflow
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt
RUN pip install /viewflow
