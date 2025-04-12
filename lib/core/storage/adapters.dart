// import 'dart:ui';

// import 'package:hive/hive.dart';
// import 'package:get/get.dart';


// class ColorAdapter extends TypeAdapter<Color> {
//   @override
//   final int typeId = 43;

//   @override
//   Color read(BinaryReader reader) {
//     final int a = reader.readByte();
//     final int r = reader.readByte();
//     final int g = reader.readByte();
//     final int b = reader.readByte();

//     return Color.fromARGB(a, r, g, b);
//   }

//   @override
//   void write(BinaryWriter writer, Color obj) {
//     writer.writeByte(obj.a.toInt());
//     writer.writeByte(obj.r.toInt());
//     writer.writeByte(obj.g.toInt());
//     writer.writeByte(obj.b.toInt());
//   }
// }

// class RxSetAdapter<T> extends TypeAdapter<RxSet<T>> {
//   @override
//   final int typeId;

//   RxSetAdapter(this.typeId);

//   @override
//   RxSet<T> read(BinaryReader reader) {
//     final length = reader.readInt();
//     final Set<T> set = {};

//     for (var i = 0; i < length; i++) {
//       // Read the string directly
//       set.add(reader.read() as T);
//     }

//     return set.obs;
//   }

//   @override
//   void write(BinaryWriter writer, RxSet<T> obj) {
//     writer.writeInt(obj.length);

//     for (final value in obj) {
//       // Write the value directly
//       writer.write(value);
//     }
//   }
// }

// void registerAdapter() {
//   // Register the adapter with a unique typeId for RxSet<String>
//   Hive.registerAdapter(RxSetAdapter<String>(42));
//   Hive.registerAdapter(UserInfoAdapter());
//   Hive.registerAdapter(DailyProfitAdapter());
//   Hive.registerAdapter(ProfitReportImplAdapter());
//   Hive.registerAdapter(SubCustomerImplAdapter());
//   Hive.registerAdapter(TradeAccountsImplAdapter());
//   Hive.registerAdapter(CustomerInfoImplAdapter());
//   Hive.registerAdapter(PartnerValueDetailImplAdapter());
//   Hive.registerAdapter(AffiliateCountriesImplAdapter());
//   Hive.registerAdapter(StatusColumnsImplAdapter());
//   Hive.registerAdapter(IbUserImplAdapter());
//   Hive.registerAdapter(PartnerProfitImplAdapter());
//   Hive.registerAdapter(PeriodProfitValueImplAdapter());
//   Hive.registerAdapter(ProfitValuesImplAdapter());
//   Hive.registerAdapter(LinkImplAdapter());
//   Hive.registerAdapter(TypeDataImplAdapter());
//   Hive.registerAdapter(TradeHistoryImplAdapter());
//   Hive.registerAdapter(WithdrawalHistoryImplAdapter());
//   Hive.registerAdapter(ChartCustomerDetailsImplAdapter());
//   Hive.registerAdapter(LeadMismatchImplAdapter());
//   Hive.registerAdapter(PositionMismatchImplAdapter());
//   Hive.registerAdapter(BackofficeSettingsImplAdapter());
//   Hive.registerAdapter(CommissionsImplAdapter());
//   Hive.registerAdapter(CountryImplAdapter());
//   Hive.registerAdapter(PlatformOptionImplAdapter());
//   Hive.registerAdapter(GroupImplAdapter());
//   Hive.registerAdapter(ColorAdapter());
// }

// extension HexColor on Color {
//   static Color fromHex(String hexString) {
//     final buffer = StringBuffer();
//     if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
//     buffer.write(hexString.replaceFirst('#', ''));
//     return Color(int.parse(buffer.toString(), radix: 16));
//   }

//   // Updated toHex method with proper type casting
//   String toHex() {
//     return '#${a.toInt().toRadixString(16).padLeft(2, '0')}'
//         '${r.toInt().toRadixString(16).padLeft(2, '0')}'
//         '${g.toInt().toRadixString(16).padLeft(2, '0')}'
//         '${b.toInt().toRadixString(16).padLeft(2, '0')}';
//   }
// }
