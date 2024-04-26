import 'dart:developer';
import 'dart:isolate';
import 'dart:math';
import 'package:isolate_classy/isolate_classy.dart';

Future<void> main() async {
  //
  //There are only functions for positional parameters(No more than 6)
  //Just add ".isolate" to the name of a function to make it run on a isolate
  var result=await positionArgument0.isolate();
  print('positionArgument0 return $result');
  result=await positionArgument1.isolate(1);
  print('positionArgument1 return $result');
  result=await positionArgument2.isolate(1,2);
  print('positionArgument2 return $result');
  result=await positionArgument3.isolate(1,2,3);
  print('positionArgument3 return $result');

  result=await positionArgument4.isolate(1,2,3,4);
  print('positionArgument4 return $result');
  result=await positionArgument5.isolate(1,2,3,4,5);
  print('positionArgument5 return $result');
  result=await positionArgument6.isolate(1,2,3,4,5,6);
  print('positionArgument6 return $result');

  //
  //Functions with named parameters, running on isolate(No more than 6 positional parameters)
  //If the function has 1 positional argument called ".isolate1", 2 called ".isolate2", and none direct call ".isolate"
  String value=await nameArgument0.isolate({#desc: "No positional parameter with named parameter function"});
  print('nameArgument0 return $value');
  value=await nameArgument1.isolate1(1,{#desc: "1 positional parameter with named parameter function"});
  print('nameArgument1 return $value');
  value=await nameArgument2.isolate2(1,2,{#desc: "2 positional parameter with named parameter function"});
  print('nameArgument2 return $value');
  value=await nameArgument3.isolate3(1,2,3,{#desc: "3 positional parameter with named parameter function"});
  print('nameArgument3 return $value');

  value=await nameArgument4.isolate4(1,2,3,4,{#desc: "4 positional parameter with named parameter function"});
  print('nameArgument4 return $value');
  value=await nameArgument5.isolate5(1,2,3,4,5,{#desc: "4 positional parameter with named parameter function"});
  print('nameArgument5 return $value');
  value=await nameArgument6.isolate6(1,2,3,4,5,6,{#desc: "4 positional parameter with named parameter function"});
  print('nameArgument6 return $value');
}

Future<String> nameArgument0({required String desc, String? other}) async {
  print("nameArgument0:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$desc:${Random().nextInt(1000000)}, other=$other");
}

Future<String> nameArgument1(int a1,{required String desc, String? other}) async {
  print("nameArgument1:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$desc:$a1, other=$other");
}

Future<String> nameArgument2(int a1, int a2, {required String desc, String? other}) async {
  print("nameArgument2:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$desc:${a1 + a2}, other=$other");
}

Future<String> nameArgument3(int a1, int a2, int a3, {required String desc, String? other}) async {
  print("nameArgument3:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$desc:${a1 + a2 + a3}, other=$other");
}

Future<String> nameArgument4(int a1, int a2, int a3, int a4, {required String desc, String? other}) async {
  print("nameArgument4:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$desc:${a1 + a2 + a3 + a4}, other=$other");
}

Future<String> nameArgument5(int a1, int a2, int a3, int a4, int a5, {required String desc, String? other}) async {
  print("nameArgument5:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$desc:${a1 + a2 + a3 + a4 + a5}, other=$other");
}

Future<String> nameArgument6(int a1, int a2, int a3, int a4, int a5, int a6, {required String desc, String? other}) async {
  print("nameArgument6:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$desc:${a1 + a2 + a3 + a4 + a5 + a6}, other=$other");
}

Future<int> positionArgument0() async {
  print("positionArgument0:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(Random().nextInt(1000000));
}

Future<int> positionArgument1(int a1) async {
  print("positionArgument1:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(a1);
}

Future<int> positionArgument2(int a1, int a2) async {
  print("positionArgument2:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(a1 + a2);
}

Future<int> positionArgument3(int a1, int a2, int a3) async {
  print("positionArgument3:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(a1 + a2 + a3);
}

Future<int> positionArgument4(int a1, int a2, int a3, int a4) async {
  print("positionArgument4:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(a1 + a2 + a3 + a4);
}

Future<int> positionArgument5(int a1, int a2, int a3, int a4, int a5) async {
  print("positionArgument5:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(a1 + a2 + a3 + a4 + a5);
}

Future<int> positionArgument6( int a1, int a2, int a3, int a4, int a5, int a6) async {
  print("positionArgument6:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(a1 + a2 + a3 + a4 + a5 + a6);
}
