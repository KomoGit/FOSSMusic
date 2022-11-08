class Song{
  final int? id;
  final String link;

  Song({this.id,required this.link});
  factory Song.fromMap(Map<String,dynamic> json) => Song(
    id: json["id"],
    link: json["link"],
    );

    Map<String,dynamic> toMap(){
      return{
        'id':id,
        'link':link,
      };
    }
    
}