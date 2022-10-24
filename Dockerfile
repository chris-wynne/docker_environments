# For more information, please refer to https://aka.ms/vscode-docker-python
FROM continuumio/miniconda3:4.12.0

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1


WORKDIR /root
RUN mkdir /root/app

# Install pip requirements
COPY requirements.txt /root/
RUN conda update -y conda
RUN conda init


#RUN conda install -c conda-forge -r requirements.txt

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
ENTRYPOINT [ "python3" ]