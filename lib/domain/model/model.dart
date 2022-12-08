class PeoplesModel {
  String uid;
  String name;
  String age;
  String adress;
  String imgurl;

  PeoplesModel(
      {required this.uid,
      required this.age,
      required this.adress,
      required this.imgurl,
      required this.name});

//recieving data from server
  factory PeoplesModel.fromMap(map) {
    return PeoplesModel(
      uid: map['uid'],
      name: map['name'],
      age: map['age'],
      adress: map['adress'],
      imgurl: map['imgurl'],
    );
  }

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'age': age,
      'adress': adress,
      'imgurl': imgurl,
    };
  }
}
