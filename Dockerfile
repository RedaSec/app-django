# Pull base image
FROM python:3.11

# Port
EXPOSE 8000

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /django_app

# Install dependencies
COPY Pipfile Pipfile.lock /django_app/
RUN pip install pipenv && pipenv install --system

# Copy project
COPY . /django_app/

# Command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]