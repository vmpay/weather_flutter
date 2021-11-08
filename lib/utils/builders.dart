import 'package:weather_flutter_architecture/repository/weather_list_response.dart';

ListElement buildListElement() => ListElement.fromRawJson(
    '{"coord": {"lon": -0.1257,"lat": 51.5085},"sys": {"country": "GB","timezone": 0,"sunrise": 1636268685,"sunset": 1636302219},"weather": [{"id": 804,"main": "Clouds","description": "overcast clouds","icon": "03d"}],"main": {"temp": 10.59,"feels_like": 9.53,"temp_min": 9.37,"temp_max": 11.67,"pressure": 1022,"humidity": 70},"visibility": 10000,"wind": {"speed": 5.14,"deg": 270},"clouds": {"all": 100},"dt": 1636279752,"id": 2643743,"name": "London"}');
