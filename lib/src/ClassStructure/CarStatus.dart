part of '../../udp.dart';

class CarStatus{
  int tractionControl;
  int abs;
  int fuelMix;
  int frontBreakBias;
  int pitLimiterStatus;
  double fuelInTank;
  double fuelCapacity;
  int maxRPM;
  int idleRPM;
  int maxGears;
  int drsAllowed;
  List<int> tyresWear;
  int tyreCompound;
  List<int> tyresDamage;
  int flWingDamage;
  int frWingDamage;
  int rWingDamage;
  int engineDamage;
  int gboxDamage;
  int exhaustDamage;
  int fiaFlag;
  double ersStoreEnergy;
  int ersDeployMode;
  double mgukHarvested;
  double mguhHarvested;
  double ersUsedThisLap;

  CarStatus(DKByteData data){
    tractionControl =             data.nextUint8();
    abs =                         data.nextUint8();
    fuelMix =                     data.nextUint8();
    frontBreakBias =              data.nextUint8();
    pitLimiterStatus =            data.nextUint8();
    fuelInTank =                  data.nextFloat();
    fuelCapacity =                data.nextFloat();
    maxRPM =                      data.nextUint16();
    idleRPM =                     data.nextUint16();
    maxGears =                    data.nextUint8();
    drsAllowed =                  data.nextUint8();
    tyresWear =                   [data.nextUint8(), data.nextUint8(), data.nextUint8(), data.nextUint8()];
    tyreCompound =                data.nextUint8();
    tyresDamage =                 [data.nextUint8(), data.nextUint8(), data.nextUint8(), data.nextUint8()];
    flWingDamage =                data.nextUint8();
    frWingDamage =                data.nextUint8();
    rWingDamage =                 data.nextUint8();
    engineDamage =                data.nextUint8();
    gboxDamage =                  data.nextUint8();
    exhaustDamage =               data.nextUint8();
    fiaFlag =                     data.nextInt8();
    ersStoreEnergy =              data.nextFloat();
    ersDeployMode =               data.nextUint8();
    mgukHarvested =               data.nextFloat();
    mguhHarvested =               data.nextFloat();
    ersUsedThisLap =              data.nextFloat();
  }

  @override String toString() {
    return """
    Traction Control  $tractionControl
    ABS               $abs
    fuelMix           $fuelMix
    fuelCapacity      $fuelCapacity
    maxRPM            $maxRPM
    idleRPM           $idleRPM
    maxGears          $maxGears
    drsAllowed        $drsAllowed
    tyresWear         ${tyresWear[0]}, ${tyresWear[1]}, ${tyresWear[2]}, ${tyresWear[3]}
    tyreCompound      $tyreCompound
    tyresDamage       ${tyresDamage[0]}, ${tyresDamage[0]}, ${tyresDamage[0]}, ${tyresDamage[0]},
    fiaFlag           $fiaFlag
    ersStoreEnergy    $ersStoreEnergy
    ersDeployMode     $ersDeployMode
    mgukHarvested     $mgukHarvested
    mguhHarvested     $mguhHarvested
    ersUsedThisLap    $ersUsedThisLap
    """;
  }
}