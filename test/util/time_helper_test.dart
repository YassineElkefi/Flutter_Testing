import 'package:flutter_testing/util/time_helper.dart';
import 'package:test/test.dart';

void main(){

group('TimeHelper.getTimeOfTheDay tests', (){
  test('TimeHelper should return morning', (){
    DateTime morningTime = DateTime(2025,01,01, 10, 00);

    String time = TimeHelper.getTimeOfTheDay(dateTime: morningTime);

    expect(time, 'Morning');
  });

  test('TimeHelper should return afternoon', (){
    DateTime afternoonTime = DateTime(2025,01,01, 14, 00);
    String time = TimeHelper.getTimeOfTheDay(dateTime: afternoonTime);

    expect(time, 'Afternoon');
  });

  test('TimeHelper should return evening', (){
    DateTime eveningTime = DateTime(2025,01,01, 19, 00);
    String time = TimeHelper.getTimeOfTheDay(dateTime: eveningTime);

    expect(time, 'Evening');
  });

  test('TimeHelper should return night', (){
    DateTime nightTime = DateTime(2025,01,01, 02, 00);
    String time = TimeHelper.getTimeOfTheDay(dateTime: nightTime);

    expect(time, 'Night');
  });

});
}