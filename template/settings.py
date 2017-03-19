"""
Django settings for template project.

Generated by 'django-admin startproject' using Django 1.8.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.8/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '^ue6ykyyf_j^)#!%^x@87rn0m$63_twtt#mx%36m7@_@$8)$g*'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    "demo",
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddleware',  # for delete post csrf check
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
)

ROOT_URLCONF = 'template.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'template.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ.get('MYSQL_DATABASE', 'demo'),
        'USER': os.environ.get('MYSQL_USER', 'root'),
        'PASSWORD': os.environ.get('MYSQL_PASSWORD', 'cds-china'),
        'HOST': os.environ.get('MYSQL_HOSTNAME', '127.0.0.1'),
        'PORT': '3306',
    }
}


# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

STATIC_URL = '/static/'


RAVEN_CONFIG = {
    'dsn': os.environ.get("dsn", ""),
    'auto_log_stacks': False,
}


LOG_DIR = os.environ.get("logger_dir", "")
LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s %(process)d %(thread)d %(pathname)s %(lineno)s %(funcName)s %(message)s'
        },
    },
    'filters': {
        'info': {
            '()': 'libs.logs.InfoLevelFilter',
        },
        'warning': {
            '()': 'libs.logs.WarningLevelFilter'
        }
    },
    'handlers': {
        'sentry': {
            'level': 'ERROR',
            'class': 'raven.contrib.django.raven_compat.handlers.SentryHandler',
        },
        'rotate_warning': {
            'level': 'WARNING',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'filename': os.path.join(LOG_DIR, "warning.log"),
            'when': 'D',
            'formatter': 'verbose',
            'filters': ['warning', ]
        },
        'rotate_info': {
            'level': 'INFO',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'filename': os.path.join(LOG_DIR, "debug.log"),
            'when': 'D',
            'formatter': 'verbose',
            'filters': ['info', ]
        },
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
            'formatter': 'verbose'
        },

    },
    'loggers': {
        '': {
            'level': 'DEBUG',
            'handlers': ['console', 'rotate_info', 'rotate_warning', 'sentry'],
            'propagate': False,
        },
        'django': {
            'level': 'ERROR',
            'handlers': ['console', 'rotate_info', 'rotate_warning'],
        },
        'django.request': {
            'level': 'DEBUG',
            'handlers': ['rotate_info', 'rotate_warning', 'sentry'],
            'propagate': False,
        },
        'network': {
            'level': 'DEBUG',
            'handlers': ['rotate_info', 'rotate_warning', 'sentry'],
            'propagate': False,
        },

    },
}

EMAIL_PORT = os.environ.get("mail_port", "")
EMAIL_HOST = os.environ.get("mail_host", "")