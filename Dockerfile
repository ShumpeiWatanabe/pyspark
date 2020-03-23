FROM phusion/baseimage:0.11

# install JAVA8
RUN apt-get update && apt-get install -y \
openjdk-8-jre \
zip

# add hadoop
RUN curl -sL https://archive.apache.org/dist/hadoop/core/hadoop-3.2.1/hadoop-3.2.1.tar.gz | tar zx -C /

# add spark
RUN curl -sL https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-without-hadoop.tgz  | tar zx -C /

# add anaconda
RUN curl -OR https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
RUN bash ./Anaconda3-2019.10-Linux-x86_64.sh -b -p /anaconda3
RUN rm ./Anaconda3-2019.10-Linux-x86_64.sh

# set annaconda path
ENV PATH /anaconda3/bin:$PATH

# set JAVA_HOME
ENV JAVA_HOME /usr

# set hadoop env_var
ENV HADOOP_HOME /hadoop-3.2.1
ENV PATH ${HADOOP_HOME}/bin:$PATH
ENV HADOOP_OPTIONAL_TOOLS hadoop-azure,hadoop-aws

# これがないと次のwarningが出る
#Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:${HADOOP_HOME}/lib/native

# set spark env_var
ENV SPARK_HOME /spark-2.4.5-bin-without-hadoop
ENV PATH ${SPARK_HOME}/bin:$PATH
ENV PYSPARK_PYTHON python3
ENV PYSPARK_DRIVER_PYTHON python3
# export SPARK_DIST_CLASSPATH=$(hadoop classpath):~/hadoop-3.2.0/share/hadoop/tools/lib/*
ENV SPARK_DIST_CLASSPATH /hadoop-3.2.1/etc/hadoop:/hadoop-3.2.1/share/hadoop/common/lib/*:/hadoop-3.2.1/share/hadoop/common/*:/hadoop-3.2.1/share/hadoop/tools/lib/azure-storage-7.0.0.jar:/hadoop-3.2.1/share/hadoop/tools/lib/azure-keyvault-core-1.0.0.jar:/hadoop-3.2.1/share/hadoop/tools/lib/wildfly-openssl-1.0.7.Final.jar:/hadoop-3.2.1/share/hadoop/tools/lib/hadoop-azure-3.2.1.jar:/hadoop-3.2.1/share/hadoop/hdfs:/hadoop-3.2.1/share/hadoop/hdfs/lib/*:/hadoop-3.2.1/share/hadoop/hdfs/*:/hadoop-3.2.1/share/hadoop/mapreduce/lib/*:/hadoop-3.2.1/share/hadoop/mapreduce/*:/hadoop-3.2.1/share/hadoop/yarn:/hadoop-3.2.1/share/hadoop/yarn/lib/*:/hadoop-3.2.1/share/hadoop/yarn/*:/hadoop-3.2.1/share/hadoop/tools/lib/*

# install pixiedust
RUN pip install pixiedust==1.1.18
RUN yes y | jupyter pixiedust install

RUN pip install pycryptodome==3.9.7

# copy sample program
COPY sample.ipynb /

COPY run_jupyternotebook.sh /
# デフォルトの挙動 jupyter notebook を起動する。
CMD ["/bin/bash", "/run_jupyternotebook.sh"]
