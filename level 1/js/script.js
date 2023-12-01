console.time();
const space = document.getElementById("space");

const input = space.innerHTML;

const rows = input.split("\n");
//console.table(rows);

let first = 0;
let last = 0;
let sum = 0;

const digits = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
const verbose = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];

rows.forEach((row, number) => {
  row = row.trim()
  if (row != "") {

    let first = -1;
    let last = 0;

    let newRow = ""
    for (let j = 0; j < row.length; j++) {
      if (digits.includes(row[j])) {
        newRow += row[j];
      } else {
        for (let k = 0; k < verbose.length; k++) {
          if (row.substring(j, j + verbose[k].length) == verbose[k]) {
            newRow += digits[k];
            j += verbose[k].length - 1;
          }
        }
      }
    }
    console.log(newRow);
    for (let j = 0; j < newRow.length; j++) {
      if (digits.includes(newRow[j])) {
        if (first == -1) first = newRow[j];
        last = newRow[j];
      }

    }

    sum = sum + parseInt(first) * 10 + parseInt(last);
    console.log(number, sum, parseInt(first) * 10 + parseInt(last))
  }
})


console.log(sum);

console.timeEnd();