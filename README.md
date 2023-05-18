# djano-docker
A simple docker setup for Djano ( that works )
# note below command will do the build also. for windows leave out the 'sudo' bit
sudo docker compose run web django-admin startproject composeexample .

# list the contents
$ ls -l

# If you are running Docker on Linux, the files django-admin created are owned by root. This happens because the container runs as the root user.
# Change the ownership of the new files.

sudo chown -R $USER:$USER composeexample manage.py 

# Do not change the permission of the data folder where Postgres has its file, otherwise Postgres will not be able to start due to permission issues.

# If you are running Docker on Mac or Windows, you should already have ownership of all files, including those generated by django-admin

# In your project directory, edit the composeexample/settings.py file. Replace the DATABASES = ... with the following:


import os <- add on top

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_NAME'),
        'USER': os.environ.get('POSTGRES_USER'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
        'HOST': 'db',
        'PORT': 5432,
    }
}

# Other commands to run

docker compose run web python3 manage.py makemigrations

docker compose run web python3 manage.py migrate

# Get it up and running
docker compose up
