# Start with Python 3.10 slim image (small size)
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Expose port 5050 (where Flask app runs)
EXPOSE 5050

# Run the app with gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:5050", "app:app"]
