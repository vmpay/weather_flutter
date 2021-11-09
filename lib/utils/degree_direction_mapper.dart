String mapDegrees(int degree) {
  final int direction = (degree / 8).round();
  switch (direction) {
    case 1:
      return '↗';
    case 2:
      return '→';
    case 3:
      return '↘';
    case 4:
      return '↓';
    case 5:
      return '↙';
    case 6:
      return '←';
    case 7:
      return '↖';
    default:
      return '↑';
  }
}
