from django.contrib import admin
from .models import *

# Register your models here.


admin.site.register(Movie)
admin.site.register(Show)
admin.site.register(Season)
admin.site.register(Episode)
admin.site.register(Actor)
admin.site.register(MovieCast)
admin.site.register(ShowCast)
admin.site.register(MovieDownloadLink)
admin.site.register(EpisodeDownloadLink)
admin.site.register(UserMovieDownloaded)


