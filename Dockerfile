FROM apache/airflow:1.10.14-python3.7

USER root
RUN apt-get update -yqq \
    && apt-get install -y libpq-dev \
    && apt-get install -y build-essential \
    && apt-get install -y vim \
    && apt-get install -y git 

RUN pip install --upgrade pip

COPY ./requirements.txt /requirements.txt
#RUN pip install -r /requirements.txt

COPY ./viewflow /viewflow/viewflow
COPY ./pyproject.toml /viewflow/
COPY ./README.md /viewflow/
RUN pip install /viewflow

USER airflow