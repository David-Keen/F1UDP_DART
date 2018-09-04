part of '../../udp.dart';

class PacketParticipantsData{
  PacketHeadder headder;
  int numberOfCars;
  List<ParticipantsData> participants = List(20);

  PacketParticipantsData(DKByteData data, {this.headder}){
    numberOfCars = data.nextUint8();
    for(int i = 0; i < 20; i++){
      participants[i] = ParticipantsData(data);
    }
  }
}