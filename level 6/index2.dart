import 'data.dart';

void main() {
  List<String> rows = getRows();

  /* get the int values for the time and distance */
  int time = int.parse(rows[0].replaceAll(RegExp(' +'), '').split(":")[1]);
  int distance = int.parse(rows[1].replaceAll(RegExp(' +'), '').split(":")[1]);

  int btnTime, btnDistance;

  int way = 0;

  way = 0;
  for (int j = 1; j < time; j++) {
    // skip zero
    btnTime = j;
    btnDistance = (time - btnTime) * btnTime;

    if (btnDistance > distance) way++;
  }

  print("Result = $way");
}
