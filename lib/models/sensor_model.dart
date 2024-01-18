class Sensor {
  num? dataKekeruhan;
  num? dataSuhu;
  String? datapH;
  num? keranAir;
  num? pompaAir;
  num? saklarLampu;
  num? sisaAir;
  num? timestamp;

  Sensor(
      {this.dataKekeruhan,
      this.dataSuhu,
      this.datapH,
      this.keranAir,
      this.pompaAir,
      this.saklarLampu,
      this.sisaAir,
      this.timestamp});

  Sensor.fromJson(Map<dynamic, dynamic> json) {
    dataKekeruhan = json['dataKekeruhan'];
    dataSuhu = json['dataSuhu'];
    datapH = json['datapH'];
    keranAir = json['keranAir'];
    pompaAir = json['pompaAir'];
    saklarLampu = json['saklarLampu'];
    sisaAir = json['sisaAir'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dataKekeruhan'] = this.dataKekeruhan;
    data['dataSuhu'] = this.dataSuhu;
    data['datapH'] = this.datapH;
    data['keranAir'] = this.keranAir;
    data['pompaAir'] = this.pompaAir;
    data['saklarLampu'] = this.saklarLampu;
    data['sisaAir'] = this.sisaAir;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
