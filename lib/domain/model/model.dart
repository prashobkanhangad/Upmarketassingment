class PeoplesModel {
  String? uid;
  String name;
  String age;
  String adress;
  String imgurl;
  String? sortid;

  PeoplesModel(
      {this.uid,
      required this.age,
      required this.adress,
      required this.imgurl,
      required this.name,
       this.sortid});

//recieving data from server
  factory PeoplesModel.fromMap(map) => PeoplesModel(
        uid: map['uid'],
        name: map['name'],
        age: map['age'],
        adress: map['adress'],
        imgurl: map['imgurl'],
        sortid: map['sortid'],
      );

  // sending data to server

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'age': age,
        'adress': adress,
        'imgurl': imgurl,
         'sortid': sortid,
      };
}
