from django.db import models

# Create your models here.
class Movie(models.Model):
    MovieTitle = models.CharField(max_length=100)
    ReleaseDate = models.IntegerField()
    Duration = models.IntegerField()
    Description = models.TextField()
    ImbdRating = models.FloatField()
    AgeLimit = models.IntegerField()
    Genre = models.CharField(max_length=50)
    Poster = models.ImageField(upload_to='images/')
    def __str__(self):
        return self.MovieTitle

class Show(models.Model):
    ShowTitle = models.CharField(max_length=100)
    ReleaseDate = models.IntegerField()
    Description = models.TextField()
    ImbdRating = models.FloatField()
    AgeLimit = models.IntegerField()
    Genre = models.CharField(max_length=50)
    Poster = models.ImageField(upload_to='images/')
    def __str__(self):
        return self.ShowTitle

class Season(models.Model):
    SeasonNumber = models.IntegerField()
    NumberOfEpisodes = models.IntegerField()
    ShowId = models.ForeignKey(Show, on_delete=models.CASCADE)
    
class Episode(models.Model):
    EpisodeTitle = models.CharField(max_length=100)
    EpisodeNumber = models.IntegerField()
    EpisodeDuration = models.IntegerField()
    SeasonId = models.ForeignKey(Season, on_delete=models.CASCADE)

class Actor(models.Model):
    Name = models.CharField(max_length=100)
    Age = models.IntegerField()
    Bio = models.TextField()
    Picture = models.ImageField(upload_to='images/', default='')

class MovieCast(models.Model):
    MovieId = models.ForeignKey(Movie, on_delete=models.CASCADE)
    ActorId = models.ForeignKey(Actor, on_delete=models.CASCADE)

class ShowCast(models.Model):
    ShowId = models.ForeignKey(Show, on_delete=models.CASCADE)
    ActorId = models.ForeignKey(Actor, on_delete=models.CASCADE)



class MovieDownloadLink(models.Model):
    DownloadLink = models.CharField(max_length=100,primary_key=True)
    Resolution = models.IntegerField()
    Language = models.CharField(max_length=100)
    MovieId = models.ForeignKey(Movie, on_delete=models.CASCADE)

class EpisodeDownloadLink(models.Model):
    DownloadLink = models.CharField(max_length=100,primary_key=True)
    Resolution = models.IntegerField()
    Language = models.CharField(max_length=100)
    EpisodeId = models.ForeignKey(Episode, on_delete=models.CASCADE)
