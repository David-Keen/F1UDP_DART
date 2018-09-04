library f1_udp;
import 'package:dk_byte_data/dk_byte_data.dart';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

part 'src/variables.dart';
part 'src/ClassStructure/PacketHeadder.dart';
part 'src/ClassStructure/CarTelemtry.dart';
part 'src/ClassStructure/CarSetupData.dart';
part 'src/ClassStructure/SessionInfo.dart';
part 'src/ClassStructure/CarStatus.dart';
part 'src/ClassStructure/ParticipantsData.dart';

part 'src/PacketStructure/CarTelemtry.dart';
part 'src/PacketStructure/CarSetup.dart';
part 'src/PacketStructure/CarStatus.dart';
part 'src/PacketStructure/SessionInfo.dart';
part 'src/PacketStructure/ParticipantsData.dart';
part 'src/helpers.dart';