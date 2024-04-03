from django.db import models


class Usuario(models.Model):
    nome = models.CharField(max_length=100)
    email = models.EmailField()
    idade = models.IntegerField()
    escolaridade = models.CharField(max_length=100)

    def __str__(self):
        return self.nome