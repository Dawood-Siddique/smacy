from django.shortcuts import render
from rest_framework import generics
from .serializer import *
from django.contrib.auth import authenticate
from rest_framework import status
from django.http import JsonResponse
from django.contrib.auth.models import User
from django.db import IntegrityError

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
                return JsonResponse({'error': 'Email already exists'}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return JsonResponse({'error': 'Wrong Credentials'}, status=status.HTTP_400_BAD_REQUEST)
        except:
            return JsonResponse({'error': 'Wrong Credentials'}, status=status.HTTP_400_BAD_REQUEST)
    
class userLogin(generics.ListAPIView):
    def get(self, request):
        userName = User.objects.get(email=request.data.get('email')).username
        password = request.data.get('password')
        user = authenticate(username=userName, password=password)
        if user:
            return JsonResponse({'Success': 'User credentional fine'}, status = status.HTTP_200_OK,)
        else:
            return JsonResponse({'error': 'Wrong Credentials'}, status=status.HTTP_400_BAD_REQUEST)
        

class moviePoster(generics.ListAPIView):
    queryset = Movie.objects.values('id', 'Poster').all()
    serializer_class = UperHomeSerialzer
    
class tempSeason(generics.ListAPIView):
    queryset = Season.objects.all()
    serializer_class = SeasonSerializer

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