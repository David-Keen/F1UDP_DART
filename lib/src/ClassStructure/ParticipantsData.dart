part of '../../udp.dart';

class ParticipantsData{
  int aiControlled;
  int driverId;
  int teamId;
  int raceNumber;
  int nationality;
  String name;

  ParticipantsData(DKByteData data){
    aiControlled = data.nextUint8();
    driverId = data.nextUint8();
    teamId = data.nextUint8();
    raceNumber = data.nextUint8();
    nationality = data.nextUint();
    name = data.nextString(length: 48);
  }
}