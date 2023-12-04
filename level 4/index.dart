import 'dart:math';
import 'data.dart';

void main() {
  int points = 0;
  List<String> cards = getRows();

  /* for every card */
  for (int i = 0; i < cards.length; i++) {
    int found = 0;
    int value = 0;
    cards[i] = cards[i].split(": ")[1];
    String card = cards[i];
    card = card.trim().replaceAll("  ", " ");

    List<String> numbers = card.split(" | ");
    List<String> winningNumbers = numbers[0].split(" ");
    List<String> myNumbers = numbers[1].split(" ");

    /* for every winning number */
    for (int j = 0; j < winningNumbers.length; j++) {
      /* if I won a number */
      if (myNumbers.contains(winningNumbers[j])) {
        value = pow(2, found) as int;
        found++;
      }
    }
    points += value;
  }

  print(points);
}
