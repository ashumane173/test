class tblAccount {
  int _id;
  String _sgi;
  String _firstName;
  String _lastName;
  String _email;
  String _phone;
  String _position;

  tblAccount(this._sgi, this._firstName, this._lastName, this._email,this._phone,this._position);


  int get id => _id;
  String get sgi => _sgi;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get phone => _phone;
  String get position => _position;

  set sgi(String newsgi) {
   this._sgi = newsgi;
  }
  set firstName(String newfirstName) {
    this._firstName = newfirstName;
  }
  set lastName(String newlastName) {
    this._lastName = newlastName;
  }
  set email(String newemail) {
    this._email = newemail;
  }
  set phone(String newphone) {
    this._phone = newphone;
  }
  set position(String newposition) {
    this._position = newposition;
  }


  tblAccount.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._sgi = map['sgi'];
    this._firstName = map['firstName'];
    this._lastName = map['lastName'];
    this._email = map['email'];
    this._phone = map['phone'];
    this._position = map['position'];

  }

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['sgi'] = _sgi;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['position'] = _position;

    return map;
  }
}