class RoomCreateRequestModel {
  final String roomName;
  final String roomDes;
  final String roomType;
  final String roomPrivacy;
  final String entryPoint;
  final String limit;

  RoomCreateRequestModel({
    required this.roomName,
    required this.roomDes,
    required this.entryPoint,
    required this.limit,
    required this.roomPrivacy,
    required this.roomType,
  });

  Map<String, dynamic> toJson() {
    return {
      "roomName": roomName,
      "roomDes": roomDes,
      "roomType": roomType,
      "roomPrivacy": roomPrivacy,
      "entryPoint": entryPoint,
      "limit": limit,
    };
  }
}
