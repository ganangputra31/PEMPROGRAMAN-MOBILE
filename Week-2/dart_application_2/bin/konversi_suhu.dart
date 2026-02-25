void main() {
  double celsius = 30;
  double kelvin = celsius + 273.15;
  double fahrenheit = (celsius * 9 / 5) + 32;
 

  print('${celsius.toStringAsFixed(1)}°C = ${fahrenheit.toStringAsFixed(1)}°F');
  print('${celsius.toStringAsFixed(1)}°C = ${kelvin.toStringAsFixed(2)} K');
}
