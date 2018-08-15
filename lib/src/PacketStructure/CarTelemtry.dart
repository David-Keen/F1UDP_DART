part of '../../udp.dart';

class PacketCarTelemtryData {
  PacketHeadder headder;
  List<CarTelemtryData> carTelemtryData = List(20);
  int buttonStatus;

  PacketCarTelemtryData(DKByteData data,this.headder) {
    for(int i = 0; i < 20; i++) {
      carTelemtryData[i] = CarTelemtryData(data);
    }
    this.buttonStatus = data.nextUint();
  }
}