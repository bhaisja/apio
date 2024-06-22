FROM jupyter/base-notebook

# Install JupyterLab
RUN pip install jupyterlab

# Install additional Python packages
RUN pip install telebot flask

# Clone the GitHub repository
RUN git clone https://github.com/BLAZERRAJ/Ddos-main.git

# Set working directory
WORKDIR /home/jovyan/Ddos-main

# Make scripts executable
RUN chmod +x *

# Expose the default port for JupyterLab
EXPOSE 8888

# Start JupyterLab without authentication and run the Python script
CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' & python m.py"]
