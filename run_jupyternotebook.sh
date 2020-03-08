# ローカルのpwdにこのスクリプトをコピーする
# 事前に以下のコマンドでdockerを立ち上げる
# docker run -v `pwd`:/home/work -p 10000:8888 --name jupyter --rm -it -u root pyspark:20200222 /bin/bash
# docker が立ち上がったら cd /home/work
# docker内でこのスクリプトを立ち上げる
# 出てきたあどれすの　ポートを10000に変えてアクセス
export PYSPARK_PYTHON=/anaconda3/bin/python3
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --ip=0.0.0.0 --allow-root' pyspark
pyspark --master local[*]
