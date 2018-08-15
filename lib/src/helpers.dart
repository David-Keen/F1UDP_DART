part of '../udp.dart';

StreamController<PacketCarTelemtryData> carTelemtryDataStream = StreamController();

void startF1UDP(int port) {
  RawDatagramSocket.bind(InternetAddress.anyIPv4, port).then((RawDatagramSocket socket){
    socket.listen((RawSocketEvent e){
      Datagram datagram = socket.receive();
      ByteBuffer buffer = Uint8List.fromList(datagram.data).buffer;
      DKByteData data = DKByteData(buffer);
      PacketHeadder packetHeadder = PacketHeadder(data);
      if(packetHeadder.id == PacketId.CAR_TELEMTRY) {
        PacketCarTelemtryData packetCarTelemtryData = PacketCarTelemtryData(data, packetHeadder);
        carTelemtryDataStream.add(packetCarTelemtryData);
      }
    });
  });
}