import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather/ui/cities/cities_screen.dart';
import 'package:weather/ui/cities/cities_bloc.dart';
import 'package:weather/business/model/city.dart';

void main() {

  testWidgets('Verifes that CitiesScreen gets city name from bloc', (WidgetTester tester) async {
    final cityName = "Kyiv";
    final blocMock = CitiesBlocMock();

    when(blocMock.cities).thenReturn([City(42, cityName)]);

    await tester.pumpWidget(materialContainer(CitiesScreen(blocMock)));

    final textFined = find.text(cityName);

    expect(textFined, findsOneWidget);
  });
}

class CitiesBlocMock extends Mock implements CitiesBloc {}

Widget materialContainer(Widget testWidget) {
  return MaterialApp(
    title: 'Test',
    home: testWidget,
  );
}