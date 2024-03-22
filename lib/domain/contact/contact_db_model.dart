class Contact {
  int? id;
  late String name;
  late String group;
  late String number;
  late String mail;
  late String photo;

  Contact(
      {this.id,
      required this.name,
      required this.group,
      required this.number,
      required this.mail,
      required this.photo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'group': group,
      'number': number,
      'mail': mail,
      'photo': photo,
    };
  }

  static Contact fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      group: map['group'],
      number: map['number'],
      mail: map['mail'],
      photo: map['photo'],
    );
  }
}
