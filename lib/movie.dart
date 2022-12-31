
class movie {
  String? image;

  movie({this.image});
  movie.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }
}