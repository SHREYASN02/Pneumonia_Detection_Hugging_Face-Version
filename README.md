# Pneumonia Detection using CNN

This project implements a web application for detecting pneumonia from chest X-ray images using a Convolutional Neural Network (CNN).

## Getting Started

Follow these instructions to set up and run the project.

### Prerequisites

*   Python 3.13.7
*   pip (Python package installer)
*   Docker (if you want to run the application using Docker)

### Running the Application Locally

To run the application directly on your machine, follow these steps:

1.  **Navigate to the project root directory:**
    ```bash
    cd /path/to/Pneumonia_detection_using_CNN
    ```

2.  **Make the `run_app.sh` script executable:**
    ```bash
    chmod +x run_app.sh
    ```

3.  **Run the script:** This script will create a virtual environment (if it doesn't exist), install the necessary Python dependencies, and start the Flask application.
    ```bash
    ./run_app.sh
    ```
    The application will be accessible at `http://127.0.0.1:5000/`.

    **Note:** The application uses basic authentication. Use the credentials mentioned in the "Authentication" section below.

### Building and Running with Docker

To build a Docker image of the application and run it in a container, follow these steps:

1.  **Ensure Docker is installed and running** on your system.

2.  **Navigate to the project root directory:**
    ```bash
    cd /path/to/Pneumonia_detection_using_CNN
    ```

3.  **Build the Docker image:** This command will read the `Dockerfile` and build a Docker image.
    ```bash
    docker-compose build
    ```

4.  **Run the Docker container:** This command will start the application within a Docker container and map port 5000 from the container to port 5000 on your host machine.
    ```bash
    docker-compose up
    ```
    The application will be accessible at `http://localhost:5000/`.

    **Note:** The application uses basic authentication. Use the credentials mentioned in the "Authentication" section below.

## Authentication

This application uses basic authentication to protect the endpoints. When you access the application, you will be prompted for a username and password.

The credentials are:
*   **Username**: `admin`
*   **Password**: `secret`

## Detailed Project Structure

*   `Backend_code/`:
    *   `Backend-colab/`: Contains `Final_Pneumonia_detection_using_CNN.ipynb`, which is a Jupyter notebook detailing the development, training, and evaluation of the Convolutional Neural Network model for pneumonia detection.
*   `Frontend-code/`:
    *   `Frontend-vscode/`: This directory houses the Flask web application.
        *   `app.py`: The main Flask application file. It handles web requests, loads the trained CNN model, processes image uploads, makes predictions, and renders HTML templates.
        *   `models/`: Contains the pre-trained Keras model (`pneu_cnn_model.h5`) used by `app.py` for making predictions.
        *   `static/`: Stores static files like example images used for display on the webpage.
        *   `templates/`: Contains HTML templates (e.g., `index.html`) rendered by the Flask application.
        *   `env/`: (Local only) A Python virtual environment for managing project dependencies.
*   `Dockerfile`: Defines the steps to build a Docker image of the Flask application, including copying code and installing dependencies.
*   `docker-compose.yml`: Configures Docker services for multi-container Docker applications. In this project, it's used to easily build and run the Flask application container.
*   `requirements.txt`: Lists all Python packages and their exact versions required by the project.
*   `run_app.sh`: A shell script to automate the local setup (virtual environment creation, dependency installation) and execution of the Flask application.

## Step-by-step Workflow of the Project

The application follows a straightforward workflow:

1.  **User Interaction**: A user accesses the web application through their browser.
2.  **Image Upload**: The user uploads an X-ray image via the web interface (`index.html`).
3.  **Flask Request Handling**: The `app.py` Flask application receives the uploaded image.
4.  **Image Preprocessing**: The uploaded image is loaded, resized to 500x500 pixels, converted to grayscale, and normalized (pixel values scaled to 0-1). It's also converted into an array format suitable for the CNN model.
5.  **Model Loading**: The pre-trained `pneu_cnn_model.h5` is loaded into memory by `app.py` (this happens once when the application starts).
6.  **Prediction**: The preprocessed image is fed into the loaded CNN model. The model outputs a probability score indicating the likelihood of pneumonia.
7.  **Result Interpretation**: Based on the probability score (e.g., >= 0.5 for positive), the application classifies the image as 'Positive' (Pneumonia) or 'Negative' (Normal).
8.  **Result Display**: The classification result, along with the uploaded image, is then rendered back to the `index.html` template and displayed to the user.
