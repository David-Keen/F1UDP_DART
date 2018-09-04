part of '../../udp.dart';

class PacketLapData{
  PacketHeadder headder;
  List<LapData> lapData = List(21);

  PacketLapData(DKByteData data, {this.headder}){
    for(int i = 0; i < 20; i++){
      lapData[i] = LapData(data);
    }
  }
}