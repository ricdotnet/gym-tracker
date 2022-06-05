class RunModel {
  final int id;
  String name;
  double distance;
  String type;
  List<dynamic> startPoint;
  List<dynamic> finishPoint;

  RunModel(this.id, this.name, this.distance, this.type, this.startPoint, this.finishPoint);

  Map<String, dynamic> toMap(dynamic run) {
    return {
      'id': run.id,
      'name': run.name,
      'distance': run.distance,
      'type': run.type,
      'startPoint': run.startPoint,
      'finishPoint': run.finishPoint,
    };
  }

  @override
  String toString() {
  return 'Run{id: $id, \nname: $name, \ndistance: \n$distance, \ntype: $type, \nstart: $startPoint, \nend: $finishPoint}\n\n';
  }
}
