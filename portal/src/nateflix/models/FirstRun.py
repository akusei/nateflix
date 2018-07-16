from django.db import models


class FirstRun(models.Model):
    is_first_run = models.BooleanField()

