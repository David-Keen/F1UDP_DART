part of '../../udp.dart';

class PacketCarSetup{
  PacketHeadder headder;
  List<CarSetupData> carSetups = List(20);
  PacketCarSetup(DKByteData data, this.headder){
    for(int i = 0; i < 20; i++){
      carSetups[i] = CarSetupData(data);
    }
  }
}