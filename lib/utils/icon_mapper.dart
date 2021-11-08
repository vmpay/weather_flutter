String mapStringToAsset(String? id) {
  switch (id) {
    case '01d':
    case '01n':
      return 'assets/graphics/sun_icon.png';
    case '02d':
    case '02n':
      return 'assets/graphics/few_clouds.png';
    case '03d':
    case '03n':
      return 'assets/graphics/clouds.png';
    case '04d':
    case '04n':
      return 'assets/graphics/clouds.png';
    case '09d':
    case '09n':
      return 'assets/graphics/rain.png';
    case '10d':
    case '10n':
      return 'assets/graphics/rain.png';
    case '11d':
    case '11n':
      return 'assets/graphics/thunder.png';
    case '13d':
    case '13n':
      return 'assets/graphics/snowflake.png';
    case '50d':
    case '50n':
      return 'assets/graphics/fog.png';
    default:
      return 'assets/graphics/orangeSun.png';
  }
}
