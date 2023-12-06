import 'data.dart';

void main() {
  List<String> rows = getRows();

  /* get the int values for the times and distances */

  List<int> times =
      turnStr2Int(rows[0].replaceAll(RegExp(' +'), ' ').split(": ")[1].trim());
  List<int> distances =
      turnStr2Int(rows[1].replaceAll(RegExp(' +'), ' ').split(": ")[1].trim());

  int btnTime, btnDistance;
  List<int> totalWays = [];
  int way = 0;

  for (int i = 0; i < times.length; i++) {
    way = 0;
    for (int j = 1; j < times[i]; j++) {
      // skip zero
      btnTime = j;
      btnDistance = (times[i] - btnTime) * btnTime;

      if (btnDistance > distances[i]) way++;
    }
    if (way != 0) totalWays.add(way);
  }

  /* Calculate the final value -> multiply all values of the TOTALWAYS list */
  int p = totalWays.reduce((acc, element) => acc * element);

  print("Result = $p");
}

List<int> turnStr2Int(String s) {
  return s.split(" ").map(int.parse).toList();
}
