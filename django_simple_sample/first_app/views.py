from django.shortcuts import render

def home_view(request):
    return render(request, 'welcome.html', {'message': 'Bem vindo!'})