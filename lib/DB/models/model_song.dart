class Song {
  final int? id;
  final String link;
  final String artistName;
  final String albumName;
  final String songName;
  Song(
      {this.id,
      required this.songName,
      required this.artistName,
      required this.albumName,
      required this.link});

  factory Song.fromMap(Map<String, dynamic> json) => Song(
        id: json["id"],
        artistName: json["artistName"],
        songName: json["songName"],
        albumName: json["albumName"],
        link: json["link"],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'artistName': artistName,
      'songName': songName,
      'albumName': albumName,
      'link': link,
    };
  }
}
