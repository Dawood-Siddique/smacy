from rest_framework import serializers
from django.contrib.auth.models import User
from .models import *

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'email', 'password']
class UserLoginSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email', 'password'] 
class MovieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Movie
        fields = '__all__'

class UperHomeSerialzer(serializers.ModelSerializer):
    class Meta:
        models = Movie
        fields = ['id', 'Poster']

class ShowSerializer(serializers.ModelSerializer):
    class Meta:
        model = Show
        fields = '__all__'

class SeasonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Season
        fields = '__all__'

class EpisodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Episode
        fields = '__all__'

class ActorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Actor
        fields = '__all__'

class MovieCastSerializer(serializers.ModelSerializer):
    class Meta:
        model = MovieCast
        fields = '__all__'

class ShowCastSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShowCast
        fields = '__all__'

class MovieDownloadLinkSerializer(serializers.ModelSerializer):
    class Meta:
        model = MovieDownloadLink
        fields = '__all__'

class EpisodeDownloadLinkSerializer(serializers.ModelSerializer):
    class Meta:
        model = EpisodeDownloadLink
        fields = '__all__'
