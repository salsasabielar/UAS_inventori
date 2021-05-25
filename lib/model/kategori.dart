class Kategori {
  int _id;
  String _name;
  String _kode;

  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get kode => this._kode;
  set kode(String value) => this._kode = value;

  // konstruktor versi 1
  Kategori(this._kode, this._name);

  // konstruktor versi 2: konversi dari Map ke Kategori
  // mengambil data dari sql yang tersimpan berbentuk Map, disimpan kembali dalam bentuk variabel
  Kategori.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kode = map['kode'];
    this._name = map['name'];
  }

  // konversi dari Kategori ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['kode'] = kode;
    map['name'] = name;
    return map;
  }
}
