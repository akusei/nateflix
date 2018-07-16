from django.shortcuts import redirect, render
from django.views import View
from nateflix.models import FirstRun


class App(View):
    def get(self, request, app):
        # if FirstRun.objects.first().is_first_run:
        #     return redirect('setup')
        if app is None:
            return redirect('portal')

        return render(request, 'app.html', {'app': app})
