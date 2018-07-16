from django.http import HttpResponse
from django.views import View


class Setup(View):
    def get(self, request, *args, **kwargs):
        return HttpResponse('SETUP')
