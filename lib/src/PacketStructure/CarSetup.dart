part of '../../udp.dart';

class CarSetup{
  PacketHeadder headder;
  List<CarSetupData> carSetups = List(20);
  CarSetup(DKByteData data, this.headder){
    for(int i = 0; i < 20; i++){
      carSetups[i] = CarSetupData(data);
    }
  }
}