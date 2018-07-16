from django.shortcuts import redirect, render
from django.views import View
from nateflix.models import FirstRun


class Portal(View):
    def get(self, request, *args, **kwargs):
        # if FirstRun.objects.first().is_first_run:
        #     return redirect('setup')

        return render(request, 'portal.html')
