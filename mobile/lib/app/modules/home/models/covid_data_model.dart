import 'dart:convert';

CovidData covidDataFromJson(String str) => CovidData.fromJson(json.decode(str));

String covidDataToJson(CovidData data) => json.encode(data.toJson());

class CovidData {
    CovidData({
        this.data,
    });

    List<Datum> data;

    factory CovidData.fromJson(Map<String, dynamic> json) => CovidData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.uid,
        this.uf,
        this.state,
        this.cases,
        this.deaths,
        this.suspects,
        this.refuses,
        this.broadcast,
        this.comments,
        this.datetime,
    });

    int uid;
    String uf;
    String state;
    int cases;
    int deaths;
    int suspects;
    int refuses;
    bool broadcast;
    String comments;
    DateTime datetime;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uid: json["uid"],
        uf: json["uf"],
        state: json["state"],
        cases: json["cases"],
        deaths: json["deaths"],
        suspects: json["suspects"],
        refuses: json["refuses"],
        broadcast: json["broadcast"],
        comments: json["comments"],
        datetime: DateTime.parse(json["datetime"]),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "uf": uf,
        "state": state,
        "cases": cases,
        "deaths": deaths,
        "suspects": suspects,
        "refuses": refuses,
        "broadcast": broadcast,
        "comments": comments,
        "datetime": datetime.toIso8601String(),
    };
}
