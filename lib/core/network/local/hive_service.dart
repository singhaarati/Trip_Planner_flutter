import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../config/constants/hive_table_constant.dart';
import '../../../features/destination/data/model/destination_hive_model.dart';
import '../../../features/user/data/model/user_hive_model.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(UserHiveModelAdapter());
    //Hive.registerAdapter(DestinationHiveModelAdapter());

    // Add dummy data
    await addDummydestination();
  }

  // ======================== Destination Queries ========================

  Future<void> addDestination(DestinationHiveModel destination) async {
    var box = await Hive.openBox<DestinationHiveModel>(
        HiveTableConstant.destinationBox);
    await box.put(destination.destinationId, destination);
  }

  Future<List<DestinationHiveModel>> getAllDestination() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
   // Hive.registerAdapter(DestinationHiveModelAdapter());
    var box = await Hive.openBox<DestinationHiveModel>(
        HiveTableConstant.destinationBox);
    var destinations = box.values.toList();
    box.close();
    return destinations;
  }

  Future<List<DestinationHiveModel>> getDestinationById() async {
     var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    var box = await Hive.openBox<DestinationHiveModel>(
        HiveTableConstant.destinationBox);
    var destinations = box.values.toList();
    box.close();
    return destinations;
  }

  // ======================== User Queries ========================
  Future<void> addUser(UserHiveModel user) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.put(user.userId, user);
  }

  Future<List<UserHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    var users = box.values.toList();
    box.close();
    return users;
  }

  //Login
  Future<UserHiveModel?> login(String username, String password) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) =>
        element.username == username && element.password == password);
    box.close();
    return user;
  }

  // ======================== Insert Dummy Data ========================
  // Batch Dummy Data
  Future<void> addDummydestination() async {
    // check of destination box is empty
    var box = await Hive.openBox<DestinationHiveModel>(
        HiveTableConstant.destinationBox);
    if (box.isEmpty) {
      final destination1 = DestinationHiveModel(
        name: 'swayambu',
        location: 'swayambu',
        picture: '',
        price: '2000',
      );
      final destination2 = DestinationHiveModel(
        name: 'bouddha',
        location: 'bouddha',
        picture: '',
        price: '2300',
      );
      final destination3 = DestinationHiveModel(
        name: 'pashupati',
        location: 'gausala',
        picture: '',
        price: '3000',
      );
      final destination4 = DestinationHiveModel(
        name: 'hunumandhoka',
        location: 'new road',
        picture: '',
        price: '1500',
      );

      List<DestinationHiveModel> destinations = [
        destination1,
        destination2,
        destination3,
        destination4
      ];

      // Insert batch with key
      for (var destination in destinations) {
        await addDestination(destination);
      }
    }
  }

  // ======================== Delete All Data ========================
  Future<void> deleteAllData() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.clear();
  }

  // ======================== Close Hive ========================
  Future<void> closeHive() async {
    await Hive.close();
  }

  // ======================== Delete Hive ========================
  Future<void> deleteHive() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
    await Hive.deleteFromDisk();
  }
}
