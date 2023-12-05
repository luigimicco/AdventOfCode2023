import 'data.dart';

void main() {
  List<String> rows = getRows();
  List<String> ranges = rows[0].split(": ")[1].trim().split(" ");

  List<List<List<int>>> map = [];
  for (int m = 0; m < 7; m++) {
    map.add([]);
  }

  for (int i = 1; i < rows.length; i++) {
    if (rows[i].trim().isEmpty) continue;

    int m = -1;
    if (rows[i].trim() == "seed-to-soil map:")
      m = 0;
    else if (rows[i].trim() == "soil-to-fertilizer map:")
      m = 1;
    else if (rows[i].trim() == "fertilizer-to-water map:")
      m = 2;
    else if (rows[i].trim() == "water-to-light map:")
      m = 3;
    else if (rows[i].trim() == "light-to-temperature map:")
      m = 4;
    else if (rows[i].trim() == "temperature-to-humidity map:")
      m = 5;
    else if (rows[i].trim() == "humidity-to-location map:") m = 6;

    if (m != -1) {
      bool flag = true;
      i++;
      do {
        List<String> temp = rows[i].trim().split(" ");
        map[m]
            .add([int.parse(temp[1]), int.parse(temp[0]), int.parse(temp[2])]);
        i++;
        if (i >= rows.length) {
          flag = false;
        } else {
          flag = rows[i].trim().isNotEmpty;
        }
      } while (flag);
    }
  }

  List<int> locations = [];
  int rangesLen = ranges.length;

  int mapLen = map.length;
  print(rangesLen);
  for (int i = 0; i < rangesLen; i = i + 2) {
    print(i);
    int start = int.parse(ranges[i]);
    int interval = int.parse(ranges[i + 1]);
    for (int s = 0; s < interval; s++) {
      int temp = start + s;
      for (var m = 0; m < mapLen; m++) {
        int len = map[m].length;
        for (var k = 0; k < len; k++) {
          if (temp >= map[m][k][0] && temp < (map[m][k][0] + map[m][k][2])) {
            temp = map[m][k][1] + (temp - map[m][k][0]);
            break;
          }
        }
      }

      locations.add(temp);
    }
  }

  int min = locations[0];
  int locLen = locations.length;
  for (int i = 1; i < locLen; i++) {
    if (locations[i] < min) min = locations[i];
  }

  print(min);
}
