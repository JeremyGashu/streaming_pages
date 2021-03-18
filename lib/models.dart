class Album {
  String imageName;
  String name;
  String artistName;
  int numberOfTracks;
  Album({this.name, this.artistName, this.numberOfTracks, this.imageName});
}

class Track {
  String name;
  String artistName;
  String duration;
  String imageName;
  Track({this.name, this.artistName, this.duration, this.imageName});
}

class PlaylistModel {
  int length;
  int loveCount;
  String imageName;
  PlaylistModel({this.length, this.loveCount, this.imageName});
}
