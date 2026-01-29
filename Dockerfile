# Use an official Python runtime as a parent image
FROM python:3.13.7-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the frontend code into the container at /app
COPY Frontend-code/ .

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "app:app"]
