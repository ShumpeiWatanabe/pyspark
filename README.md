# necessary files

download three files from these URLs.

* spark-2.4.5-bin-without-hadoop.tpz
https://www.apache.org/dyn/closer.lua/spark/spark-2.4.5/spark-2.4.5-bin-without-hadoop.tgz

* hadoop-3.2.1.tar.gz
https://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz

* anaconda3-2019.10-Linux-x86_64.sh
https://www.anaconda.com/distribution/#download-section

# docker build

```
docker build -t pyspark .
```

# docker run
run this command

```
docker run -v `pwd`:/work -p8888:8888 -it --rm neppysan/pyspark
```

and you will see this message.

```
To access the notebook, open this file in a browser:
			file:///root/.local/share/jupyter/runtime/nbserver-6-open.html
	Or copy and paste one of these URLs:
			http://2457d17b9863:8888/?token=7a466b3b8d558c34ea7b62ef3b6da95ed83a403d0a210847
	 or http://127.0.0.1:8888/?token=7a466b3b8d558c34ea7b62ef3b6da95ed83a403d0a210847
```

copy `http://127.0.0.1:8888/?token=...` and paste it on your browser, then you can use jupyter notebook.


# sample jupyter notebook

look at sample.jpynb

# reference

https://deep.data.blog/2019/07/12/diy-apache-spark-and-adls-gen-2-support/
https://spark.apache.org/docs/latest/hadoop-provided.html
https://aajisaka.github.io/hadoop-document/hadoop-project/hadoop-azure/abfs.html
