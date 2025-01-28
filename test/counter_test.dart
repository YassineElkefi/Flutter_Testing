import 'package:flutter_testing/counter.dart';
import 'package:test/test.dart';

void main(){

  test('Counter value should be incremented', (){

    Counter counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });

  test('Counter should be decremented', (){
    Counter counter = Counter();

    counter.decrement();

    expect(counter.value, -1);
  });


}