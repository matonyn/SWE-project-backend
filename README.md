
# Farmers Market Backend

This repository contains the backend implementation for our Software Engineering project. 

Mobile app repository: https://github.com/Aisakhunova/SWE.git

## 🚀 Technologies Used

- Backend Framework: Django
- Database: MySQL hosted on AWS RDS Database
- APIs: RESTful APIs for seamless communication with mobile app
- Hosting: hosted on ```http://ec2-3-252-86-187.eu-west-1.compute.amazonaws.com:8000/``` using AWS EC2

## Installation

Install SWE-project-backend with git

```bash
    git clone https://github.com/matonyn/SWE-project-backend.git
    cd SWE-project-backend
```
    



## Run Locally

Clone the project

```bash
    git clone https://github.com/matonyn/SWE-project-backend.git
```

Go to the project directory

```bash
    cd  SWE-project-backend
```

Create virtual environment

```bash
    python -m venv venv
    source venv/bin/activate
```

Install dependencies:

```bash
    pip install -r requirements.txt
```
Set up the database: ```Use .env for environment variables.```

Apply migrations:

```bash
    python manage.py migrate
```

Run the development server:
```bash
    python manage.py runserver
```

Access the application at ``` http://127.0.0.1:8000/.```

## License

[MIT](https://choosealicense.com/licenses/mit/)

