from django.shortcuts import render
from first_app.models import Usuario

def home_view(request):
    users = Usuario.objects.all()
    
    return render(request, 'welcome.html', {'user_list': users})