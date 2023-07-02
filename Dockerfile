FROM coding-public-docker.pkg.coding.net/public/docker/python:3.9

COPY . /app
WORKDIR /app
# RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn
RUN pip install -r requirements.txt
ENTRYPOINT ["gunicorn"]
CMD ["main:app", "-b", "0.0.0.0:8080", "-w", "4", "-k", "uvicorn.workers.UvicornWorker"]
