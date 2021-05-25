class Item {
  int _id;
  String _name;
  String _kode;
  int _jumlahBarang;
  String _kondisiBarang;

  int get id => _id;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get kode => this._kode;
  set kode(String value) => this._kode = value;

  get jumlahBarang => this._jumlahBarang;
  set jumlahBarang(value) => this._jumlahBarang = value;

  String get kondisiBarang => this._kondisiBarang;
  set kondisiBarang(String value) => this._kondisiBarang = value;

  // konstruktor versi 1
  Item(this._kode, this._kondisiBarang, this._name, this._jumlahBarang);

  // konstruktor versi 2: konversi dari Map ke Item
  // mengambil data dari sql yang tersimpan berbentuk Map, disimpan kembali dalam bentuk variabel
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kode = map['kode'];
    this._kondisiBarang = map['kondisiBarang'];
    this._name = map['name'];
    this._jumlahBarang = map['jumlahBarang'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['kode'] = kode;
    map['kondisiBarang'] = kondisiBarang;
    map['name'] = name;
    map['jumlahBarang'] = jumlahBarang;
    return map;
  }
}
