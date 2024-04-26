It makes very easy and elegant for your asynchronous functions to run on isolate, just add ".isolate" or ".isolateX" (x is the number [0-6])
## Features

Just call ".isolate" or ".isolateX" to make your asynchronous function to run on isolate

## Getting started

```dart
import 'package:isolate_classy/isolate_classy.dart';
```

## Usage

- 1.Asynchronous functions without named parameters run on isolate

Just add ".isolate" to the name of a function to make it run on a isolate。

```dart
Future<int> func(int a1,int a2,int a3) async{
}

await func(1,2,3);//runs on the main isolate
await func.isolate(1,2,3);//runs on the new isolate
```

- 2.Asynchronous functions with named parameters run on isolate
```dart
Future<int> func({double width,double height,Color? color})async{
}
Future<int> func6(int a1,int a2,int a3,int a4,int a5,int a6,{double width,double height,Color? color})async{
}

await func.isolate({#width:100,#height:200,#color: Colors.blue});//There are no positional parameters
await func1.isolate1(1,{#width:100,#height:200,#color: Colors.blue});//1 positional parameters
//...
await func1.isolate6(1,2,3,4,5,6,{#width:100,#height:200,#color: Colors.blue});//1 positional parameters
```

## Additional information

This [article](https://gold-duo.github.io/posts/dart-isolate-elegantly/) explains the principle.

If an asynchronous function with named parameters uses the return value, you need to specify the return value type.

```dart
int ret=await func.isolate({#width:100,#height:200,#color: Colors.blue});
//or
ret=await func.isolate<int>({#width:100,#height:200,#color: Colors.blue});
```