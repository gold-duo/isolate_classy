import 'dart:developer';
import 'dart:isolate';
import 'package:isolate_classy/isolate_classy.dart';
import 'package:test/test.dart';

void main() async {
  await _testOnlyPositionArgument();
  await _testNamedArgumentsFunc();
}

Future<int> positionArgument0() async {
  print("positionArgument0:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(-1000);
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

Future<int> positionArgument6(int a1, int a2, int a3, int a4, int a5, int a6) async {
  print("positionArgument6:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value(a1 + a2 + a3 + a4 + a5 + a6);
}

Future<void> _testOnlyPositionArgument() async {
  final x = positionArgument2.call(1, 2);
  test("positionArgument0", () async {
    expect(await positionArgument0.isolate(), -1000);
  });
  test("positionArgument1", () async {
    expect(await positionArgument1.isolate(1), 1);
  });
  test("positionArgument2", () async {
    expect(await positionArgument2.isolate(1, 2), 3);
  });
  test("positionArgument3", () async {
    expect(await positionArgument3.isolate(1, 2, 3), 6);
  });
  test("positionArgument4", () async {
    expect(await positionArgument4.isolate(1, 2, 3, 4), 10);
  });
  test("positionArgument5", () async {
    expect(await positionArgument5.isolate(1, 2, 3, 4, 5), 15);
  });
  test("positionArgument6", () async {
    expect(await positionArgument6.isolate(1, 2, 3, 4, 5, 6), 21);
  });
}

Future<void> _testNamedArgumentsFunc() async {
  test("nameArgument0", () async {
    expect(await nameArgument0.isolate({#description: "nameArgument0"}),
        "nameArgument0:-1000, other=null");
  });
  test("nameArgument1", () async {
    expect(await nameArgument1.isolate1<String>(1, {#description: "nameArgument1"}),
        "nameArgument1:1, other=null");
  });
  test("nameArgument2", () async {
    expect(
        await nameArgument2.isolate2<String>(1, 2, {#description: "nameArgument2"}),
        "nameArgument2:3, other=null");
  });
  test("nameArgument3", () async {
    expect(
        await nameArgument3
            .isolate3<String>(1, 2, 3, {#description: "nameArgument3"}),
        "nameArgument3:6, other=null");
  });
  test("nameArgument4", () async {
    expect(
        await nameArgument4
            .isolate4<String>(1, 2, 3, 4, {#description: "nameArgument4"}),
        "nameArgument4:10, other=null");
  });
  test("nameArgument5", () async {
    expect(
        await nameArgument5
            .isolate5<String>(1, 2, 3, 4, 5, {#description: "nameArgument5"}),
        "nameArgument5:15, other=null");
  });
  test("nameArgument6", () async {
    expect(
        await nameArgument6
            .isolate6<String>(1, 2, 3, 4, 5, 6, {#description: "nameArgument6"}),
        "nameArgument6:21, other=null");
  });
}

Future<String> nameArgument0({required String description, String? other}) async {
  print("nameArgument0:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$description:${-1000}, other=$other");
}

Future<String> nameArgument1(int a1,
    {required String description, String? other}) async {
  print("nameArgument1:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$description:$a1, other=$other");
}

Future<String> nameArgument2(int a1, int a2,
    {required String description, String? other}) async {
  print("nameArgument2:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$description:${a1 + a2}, other=$other");
}

Future<String> nameArgument3(int a1, int a2, int a3,
    {required String description, String? other}) async {
  print("nameArgument3:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$description:${a1 + a2 + a3}, other=$other");
}

Future<String> nameArgument4(int a1, int a2, int a3, int a4,
    {required String description, String? other}) async {
  print("nameArgument4:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$description:${a1 + a2 + a3 + a4}, other=$other");
}

Future<String> nameArgument5(int a1, int a2, int a3, int a4, int a5,
    {required String description, String? other}) async {
  print("nameArgument5:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$description:${a1 + a2 + a3 + a4 + a5}, other=$other");
}

Future<String> nameArgument6(int a1, int a2, int a3, int a4, int a5, int a6,
    {required String description, String? other}) async {
  print("nameArgument6:${Service.getIsolateId(Isolate.current)}");
  await Future.delayed(const Duration(microseconds: 100));
  return Future.value("$description:${a1 + a2 + a3 + a4 + a5 + a6}, other=$other");
}
