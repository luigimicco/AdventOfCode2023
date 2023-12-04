import 'data.dart';

void main() {
  List<String> cards = getRows();

  List<int> copies = [];
  for (int i = 0; i < cards.length; i++) {
    copies.add(1);
  }

  /* for every card */
  for (int i = 0; i < cards.length; i++) {
    int found = 0;
    cards[i] = cards[i].split(": ")[1];
    String card = cards[i];
    card = card.trim().replaceAll("  ", " ");

    List<String> numbers = card.split(" | ");
    List<String> winningNumbers = numbers[0].split(" ");
    List<String> myNumbers = numbers[1].split(" ");

    for (int j = 0; j < winningNumbers.length; j++) {
      if (myNumbers.contains(winningNumbers[j])) {
        found++;
      }
    }

    for (int k = 0; k < found; k++) {
      copies[i + 1 + k] += copies[i];
    }
  }

  print(copies.reduce((acc, element) => acc + element));
}
