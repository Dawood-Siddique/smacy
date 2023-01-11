from django.shortcuts import render
from rest_framework import generics
from .serializer import *
from django.contrib.auth import authenticate
from rest_framework import status
from django.http import JsonResponse
from django.contrib.auth.models import User
from django.db import IntegrityError
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response

# Create your views here.

class userRegister(generics.CreateAPIView):
    def post(self, request):
        try:
            if User.objects.filter(email=request.data.get('email')).exists():
                raise IntegrityError
            user = User.objects.create_user(request.data.get('username'),request.data.get('email'), request.data.get('password'))
            user.save()
            return JsonResponse({'Success': 'User credentional fine'}, status=status.HTTP_201_CREATED)
        except IntegrityError as e:
            if User.objects.filter(username=request.data.get('username')).exists():
                return JsonResponse({'error': 'Username already exists'}, status=status.HTTP_400_BAD_REQUEST)
            elif User.objects.filter(email=request.data.get('email')).exists():
                return JsonResponse({'Error': 'Email already exists'}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return JsonResponse({'Error': 'Wrong Credentials'}, status=status.HTTP_400_BAD_REQUEST)
        except:
            return JsonResponse({'Error': 'Wrong Credentials'}, status=status.HTTP_400_BAD_REQUEST)
    
class userLogin(generics.CreateAPIView):
    def post(self, request):
        try:
            password = request.data.get('password')
            userName= User.objects.get(email=request.data.get('email')).username
            user = authenticate(username=userName, password=password)
            userId = User.objects.get(email = request.data.get('email')).id;
            if user:
                return JsonResponse({'UserId': userId}, status = status.HTTP_200_OK,)
            else:
                return JsonResponse({'Error': 'Wrong Credentials'}, status=status.HTTP_400_BAD_REQUEST)
        except User.DoesNotExist:
            return JsonResponse({'Error': 'Email Do not exsist'}, status=status.HTTP_404_NOT_FOUND)
        except:
            return JsonResponse({'Error': 'Something Went Wrong'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        

class homeMovie(generics.ListAPIView):
    queryset = Movie.objects.values('id','Poster').order_by('?')[:5]
    serializer_class = MoviePoster

    
class homeShow(generics.ListAPIView):
    queryset = Show.objects.values('id','Poster').order_by('?')[:5]
    serializer_class = ShowPoster


class movieDetail(generics.RetrieveAPIView):
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer
    lookup_field = 'id'

class UserDownloadedMovieSave(generics.CreateAPIView):
    def post(self, request):
        try:
            serializer = UserDownloadMovieSerializer(data=request.data) 
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'Success': 'User Downloaded Movie Saved'}, status=status.HTTP_201_CREATED)
        except:
            return JsonResponse({'Error': 'Something Went Wrong'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# @api_view(['GET', 'POST'])
# def songList(request):
#     if request.method == 'GET':
#         songs = Song.objects.all()
#         serializer = SongSerializer(songs, many=True)
#         return JsonResponse(serializer.data, safe=False)
#     elif request.method == 'POST':
#         serializer = SongSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)