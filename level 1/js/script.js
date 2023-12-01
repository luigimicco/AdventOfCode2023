const space = document.getElementById("space");

const input = space.innerHTML;

const rows = input.split("\n");
//console.table(rows);

let first = 0;
let last = 0;
let sum = 0;

const digits = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
const verbose = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];


for (let i = 0; i < rows.length; i++) {
  let row = rows[i].trim()

  if (row == "") continue;

  let first = -1;
  let last = 0;

  let newRow = ""
  for (let j = 0; j < row.length; j++) {


    for (let k = 0; k < verbose.length; k++) {
      if (row.substring(j, j + verbose[k].length) == verbose[k]) {
        newRow = newRow + digits[k];
        k = k + verbose[k].length;
      } else {
        newRow = newRow + row[j];

      }

    }
  }


  for (let j = 0; j < newRow.length; j++) {
    if (digits.includes(newRow[j])) {
      if (first == -1) first = newRow[j];
      last = newRow[j];
    }

  }
  console.log(first, last)
  sum = sum + parseInt(first) * 10 + parseInt(last);
}
console.log(sum);

