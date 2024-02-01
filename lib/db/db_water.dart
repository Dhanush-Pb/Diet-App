// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:project/model/data_water.dart';

// int glassconsumed = 0;
// void svaeWaterintake() async {
//   var WaterintakeBox = Hive.box<WaterintakeModel>('Waterbox');
//   var currentdate = DateTime.now().toString().split(' ')[0];

//   var waterintake = WaterintakeBox.get(currentdate,
//       defaultValue: WaterintakeModel(0, currentdate));

//   waterintake?.glassconsumed = glassconsumed;
//   await WaterintakeBox.put(currentdate, waterintake!);
// }
