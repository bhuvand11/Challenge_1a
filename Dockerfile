# Use a compatible base image for AMD64 architecture
FROM --platform=linux/amd64 python:3.10

# Set working directory inside the container
WORKDIR /app

# Copy your script and model into the container
COPY process_pdfs.py .
COPY models/ ./models/

# Install only the required dependencies
RUN pip install --no-cache-dir numpy pandas scikit-learn joblib pymupdf

# When the container starts, run your script
CMD ["python", "process_pdfs.py"]
