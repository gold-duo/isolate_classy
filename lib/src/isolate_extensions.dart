/*
 * Copyright (c) 2024 gold.duo(https://github.com/gold-duo)
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'dart:async';
import 'dart:isolate';

typedef IsolateBlock0<R>=Future<R> Function();
typedef IsolateBlock1<R,T>=Future<R> Function(T);
typedef IsolateBlock2<R,T1,T2>=Future<R> Function(T1,T2);
typedef IsolateBlock3<R,T1,T2,T3>=Future<R> Function(T1,T2,T3);
typedef IsolateBlock4<R,T1,T2,T3,T4>=Future<R> Function(T1,T2,T3,T4);
typedef IsolateBlock5<R,T1,T2,T3,T4,T5>=Future<R> Function(T1,T2,T3,T4,T5);
typedef IsolateBlock6<R,T1,T2,T3,T4,T5,T6>=Future<R> Function(T1,T2,T3,T4,T5,T6);

@pragma('vm:prefer-inline')
List<T1> _toList1<T1>(T1 arg1) =>List.filled(1, arg1);
@pragma('vm:prefer-inline')
List<dynamic> _toList2(arg1, arg2) =>List.filled(2, arg1)..[1]=arg2;
@pragma('vm:prefer-inline')
List<dynamic> _toList3(arg1, arg2, arg3) =>List.filled(3, arg1)..[1]=arg2..[2]=arg3;
@pragma('vm:prefer-inline')
List<dynamic> _toList4(arg1, arg2, arg3, arg4) =>List.filled(4, arg1)..[1]=arg2..[2]=arg3..[3]=arg4;
@pragma('vm:prefer-inline')
List<dynamic> _toList5(arg1, arg2, arg3, arg4, arg5) =>List.filled(5, arg1)..[1]=arg2..[2]=arg3..[3]=arg4..[4]=arg5;
@pragma('vm:prefer-inline')
List<dynamic> _toList6(arg1, arg2, arg3, arg4, arg5, arg6) =>List.filled(6, arg1)..[1]=arg2..[2]=arg3..[3]=arg4..[4]=arg5..[5]=arg6;

final class IsolateUtils {
  static const _empty=Object();

  @pragma('vm:prefer-inline')
  static Future<R> runOnIsoLate<R>(IsolateBlock0<R> block,[Map<Symbol, dynamic>? namedArguments]) =>
      _runOnIsoLate(block,null,namedArguments);

  @pragma('vm:prefer-inline')
  static Future<R> runOnIsoLate1<R, T>(IsolateBlock1<R,T> block, T arg,[Map<Symbol, dynamic>? namedArguments]) =>
      _runOnIsoLate(block,_toList1(arg),namedArguments);

  @pragma('vm:prefer-inline')
  static Future<R> runOnIsoLate2<R, T1, T2>(IsolateBlock2<R,T1,T2> block, T1 arg1, T2 arg2,[Map<Symbol, dynamic>? namedArguments]) =>
      _runOnIsoLate(block, _toList2(arg1, arg2),namedArguments);

  @pragma('vm:prefer-inline')
  static Future<R> runOnIsoLate3<R, T1, T2, T3>(IsolateBlock3<R,T1,T2,T3> block, T1 arg1, T2 arg2, T3 arg3,[Map<Symbol, dynamic>? namedArguments]) =>
      _runOnIsoLate( block, _toList3(arg1, arg2, arg3),namedArguments);

  @pragma('vm:prefer-inline')
  static Future<R> runOnIsoLate4<R, T1, T2, T3, T4>(IsolateBlock4<R,T1,T2,T3,T4> block, T1 arg1, T2 arg2, T3 arg3, T4 arg4,[Map<Symbol, dynamic>? namedArguments]) =>
      _runOnIsoLate( block, _toList4(arg1, arg2, arg3, arg4),namedArguments);

  @pragma('vm:prefer-inline')
  static Future<R> runOnIsoLate5<R, T1, T2, T3, T4,T5>(IsolateBlock5<R,T1,T2,T3,T4,T5> block, T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5,[Map<Symbol, dynamic>? namedArguments]) =>
      _runOnIsoLate(block, _toList5(arg1, arg2, arg3, arg4, arg5),namedArguments);

  @pragma('vm:prefer-inline')
  static Future<R> runOnIsoLate6<R, T1, T2, T3, T4, T5, T6>(IsolateBlock6<R,T1,T2,T3,T4,T5,T6> block,T1 arg1, T2 arg2, T3 arg3, T4 arg4, T5 arg5, T6 arg6,[Map<Symbol, dynamic>? namedArguments]) =>
      _runOnIsoLate(block, _toList6(arg1, arg2, arg3, arg4, arg5, arg6),namedArguments);

  static void _handle<R>(dynamic response, Completer<R> completer, RawReceivePort resultPort) {
    resultPort.close();
    if (response == null) {
      completer.completeError( RemoteError("block ended without result", ""), StackTrace.empty);
    }else if (response==_empty){
      completer.complete(null as R);
    }else if (response is List){
      var error = response[0];
      var stack = response[1];
      if (stack is StackTrace) {
        completer.completeError(error!, stack);
      } else {
        completer.completeError(RemoteError(error.toString(), stack.toString()), error.stackTrace);
      }
    }else{
      completer.complete(response as R);
    }
  }

  static Future<R> _runOnIsoLate<R>(Function block,List<dynamic>? arguments,[Map<Symbol, dynamic>? namedArguments]) {
    final complete = Completer<R>();
    final RawReceivePort resultPort = RawReceivePort();
    resultPort.handler =(response) => _handle(response, complete, resultPort);

    final List<dynamic> msg;
    if( arguments?.isNotEmpty==true){
      if(namedArguments?.isNotEmpty==true){
        msg =_toList4(resultPort.sendPort, block, arguments, namedArguments);
      }else{
        msg =_toList3(resultPort.sendPort, block, arguments);
      }
    }else if(namedArguments?.isNotEmpty==true){
      msg =_toList3(resultPort.sendPort, block, namedArguments);
    }else{
      msg =_toList2(resultPort.sendPort, block);
    }

    try {
      /*final isolate = */Isolate.spawn(_execute, msg,
          onError: resultPort.sendPort,
          onExit: resultPort.sendPort,
          errorsAreFatal: true,
          debugName: 'runOnIsoLate')
          .then((value) => {}, onError: (error, stack) {
        resultPort.close();
        complete.completeError(error, stack);
      });
      // isolate.onError((error, stackTrace) => null)
      // isolate.catchError(onError)
    } on Object {
      resultPort.close();
      rethrow;
    }
    return complete.future;
  }

  static _execute(List<dynamic> msg) async {
    final SendPort port = msg[0];
    try {
      final List<dynamic>? arg;
      final Map<Symbol, dynamic>? namedArg;
      final len=msg.length;
      if (len == 4) {
        arg = msg[2];
        namedArg = msg[3];
      } else if (len == 3) {
        final p = msg[2];
        if (p is List<dynamic>) {
          arg = p;
          namedArg = null;
        } else {
          namedArg = p;
          arg = null;
        }
      } else {
        arg = null;
        namedArg = null;
      }
      Isolate.exit(port,await Function.apply(msg[1], arg,namedArg) ?? _empty);
    } catch (e, s) {
      Isolate.exit(port, List.filled(2, e)..[1] = s);
    }
  }
}

extension IsolateExtensions0<R> on IsolateBlock0<R>{
  @pragma('vm:prefer-inline')
  IsolateBlock0<R>  get isolate=> ()=>IsolateUtils.runOnIsoLate(this);
}
extension IsolateExtensions1<R,T> on IsolateBlock1<R,T>{
  @pragma('vm:prefer-inline')
  IsolateBlock1<R,T>  get isolate=> (arg)=>IsolateUtils.runOnIsoLate1(this, arg);
}

extension IsolateExtensions2<R,T1,T2> on IsolateBlock2<R,T1,T2>{
  @pragma('vm:prefer-inline')
  IsolateBlock2<R,T1,T2>  get isolate=> (arg1,arg2)=>IsolateUtils.runOnIsoLate2(this, arg1,arg2);
}
extension IsolateExtensions3<R,T1,T2,T3> on IsolateBlock3<R,T1,T2,T3>{
  @pragma('vm:prefer-inline')
  IsolateBlock3<R,T1,T2,T3>  get isolate=> (arg1,arg2,arg3)=>IsolateUtils.runOnIsoLate3(this, arg1,arg2,arg3);
}
extension IsolateExtensions4<R,T1,T2,T3,T4> on IsolateBlock4<R,T1,T2,T3,T4>{
  @pragma('vm:prefer-inline')
  IsolateBlock4<R,T1,T2,T3,T4>  get isolate=> (arg1,arg2,arg3,arg4)=>IsolateUtils.runOnIsoLate4(this, arg1,arg2,arg3,arg4);
}
extension IsolateExtensions5<R,T1,T2,T3,T4,T5> on IsolateBlock5<R,T1,T2,T3,T4,T5>{
  @pragma('vm:prefer-inline')
  IsolateBlock5<R,T1,T2,T3,T4,T5>  get isolate=> (arg1,arg2,arg3,arg4,arg5)=>IsolateUtils.runOnIsoLate5(this, arg1,arg2,arg3,arg4,arg5);
}
extension IsolateExtensions6<R,T1,T2,T3,T4,T5,T6> on IsolateBlock6<R,T1,T2,T3,T4,T5,T6>{
  @pragma('vm:prefer-inline')
  IsolateBlock6<R,T1,T2,T3,T4,T5,T6>  get isolate=> (arg1,arg2,arg3,arg4,arg5,arg6)=>IsolateUtils.runOnIsoLate6(this, arg1,arg2,arg3,arg4,arg5,arg6);
}

//named arguments
final class FunctionWrapper0 {
  final Function _fn;
  FunctionWrapper0(this._fn);
  @pragma('vm:prefer-inline')
  Future<R> call<R>([Map<Symbol, dynamic>? namedArguments]) =>
      IsolateUtils._runOnIsoLate(_fn, null, namedArguments);
}
final class FunctionWrapper1 {
  final Function _fn;
  FunctionWrapper1(this._fn);
  @pragma('vm:prefer-inline')
  Future<R> call<R>( arg, [Map<Symbol, dynamic>? namedArguments]) =>
      IsolateUtils._runOnIsoLate(_fn, _toList1(arg), namedArguments);
}
final class FunctionWrapper2 {
  final Function _fn;
  FunctionWrapper2(this._fn);
  @pragma('vm:prefer-inline')
  Future<R> call<R>(dynamic arg1,dynamic arg2, [Map<Symbol, dynamic>? namedArguments]) =>
      IsolateUtils._runOnIsoLate( _fn, _toList2(arg1,arg2),namedArguments);
}
final class FunctionWrapper3 {
  final Function _fn;
  FunctionWrapper3(this._fn);
  @pragma('vm:prefer-inline')
  Future<R> call<R>( arg1,  arg2,  arg3, [Map<Symbol, dynamic>? namedArguments]) =>
      IsolateUtils._runOnIsoLate( _fn, _toList3(arg1,arg2,arg3),namedArguments);
}
final class FunctionWrapper4 {
  final Function _fn;
  FunctionWrapper4(this._fn);
  @pragma('vm:prefer-inline')
  Future<R> call<R>(arg1,  arg2,  arg3, arg4, [Map<Symbol, dynamic>? namedArguments]) =>
      IsolateUtils._runOnIsoLate( _fn,  _toList4(arg1, arg2, arg3, arg4),namedArguments);
}
final class FunctionWrapper5 {
  final Function _fn;
  FunctionWrapper5(this._fn);
  @pragma('vm:prefer-inline')
  Future<R> call<R>(arg1, arg2, arg3,arg4,arg5, [Map<Symbol, dynamic>? namedArguments]) =>
      IsolateUtils._runOnIsoLate( _fn,_toList5(arg1, arg2, arg3, arg4, arg5),namedArguments);
}
final class FunctionWrapper6 {
  final Function _fn;
  FunctionWrapper6(this._fn);
  @pragma('vm:prefer-inline')
  Future<R> call<R>(arg1, arg2, arg3, arg4, arg5, arg6, [Map<Symbol, dynamic>? namedArguments]) =>
      IsolateUtils._runOnIsoLate( _fn, _toList6(arg1, arg2, arg3, arg4, arg5, arg6),namedArguments);
}
extension FunctionForIsolateExtensions on Function {
  @pragma('vm:prefer-inline')
  FunctionWrapper0 get isolate=> FunctionWrapper0(this);
  @pragma('vm:prefer-inline')
  FunctionWrapper1 get isolate1=> FunctionWrapper1(this);
  @pragma('vm:prefer-inline')
  FunctionWrapper2 get isolate2=> FunctionWrapper2(this);
  @pragma('vm:prefer-inline')
  FunctionWrapper3 get isolate3=> FunctionWrapper3(this);
  @pragma('vm:prefer-inline')
  FunctionWrapper4 get isolate4=> FunctionWrapper4(this);
  @pragma('vm:prefer-inline')
  FunctionWrapper5 get isolate5=> FunctionWrapper5(this);
  @pragma('vm:prefer-inline')
  FunctionWrapper6 get isolate6=> FunctionWrapper6(this);
}