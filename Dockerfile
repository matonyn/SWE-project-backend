FROM python:3.12

# Install dependencies
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    gcc \
    make \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV MYSQLCLIENT_CFLAGS="$(mysql_config --cflags)"
ENV MYSQLCLIENT_LDFLAGS="$(mysql_config --libs)"

# Set work directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myapp.wsgi:application"]