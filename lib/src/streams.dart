import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dk_byte_data/dk_byte_data.dart.dart';
import 'package:f1_udp/udp.dart';
import 'variables.dart';

StreamController<PacketCarTelemtryData> carTelemtryDataStream = StreamController();

void startF1UDPStream(int port) {
  RawDatagramSocket.bind(InternetAddress.anyIPv4, port).then((RawDatagramSocket socket){
    socket.listen((RawSocketEvent e){
      Datagram d = socket.receive();
      if(d == null) return;
      ByteBuffer buffer = Uint8List.fromList(d.data).buffer;
      DKByteData data = DKByteData(buffer);
      PacketHeadder packetHeadder = PacketHeadder(data);
      if(packetHeadder.id == PacketId.CAR_TELEMTRY){
        PacketCarTelemtryData carTelemtryData = PacketCarTelemtryData(data, packetHeadder);
        carTelemtryDataStream.add(carTelemtryData);
      }
    });
  });
}