import 'package:flutter_testing/counter.dart';
import 'package:test/test.dart';

void main(){


  group('Test counter start, Increment & decrement', (){

    test('Counter initial value should be 0', (){
      Counter counter = Counter();

      expect(counter.value, 0);
    });

    test('Counter value should be incremented', (){

    Counter counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });

    test('Counter value should be decremented', (){
      Counter counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });

  });
  


}