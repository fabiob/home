/**
 * A function to export MongoDB results as CSV.
 * 
 * Source: https://github.com/Studio3T/robomongo/wiki/How-to-export-to-CSV
 */
function toCSV(delim, quote) {
  var count = -1;
  var headers = [];
  var data = {};

  var cursor = this;

  delim = delim == null ? "," : delim;
  quote = quote == null ? '"' : quote;

  while (cursor.hasNext()) {
    var array = new Array(cursor.next());

    count++;

    for (var index in array[0]) {
      if (headers.indexOf(index) === -1) {
        headers.push(index);
      }
    }

    for (var i = 0; i < array.length; i++) {
      for (var index in array[i]) {
        data[count + "_" + index] = array[i][index];
      }
    }
  }

  var line = "";

  for (var index in headers) {
    line += quote + headers[index] + quote + delim;
  }

  line = line.slice(0, -1);
  print(line);

  for (var i = 0; i < count + 1; i++) {
    var line = "";
    var cell = "";
    for (var j = 0; j < headers.length; j++) {
      cell = data[i + "_" + headers[j]];
      if (cell == undefined) cell = "";
      line += quote + cell + quote + delim;
    }

    line = line.slice(0, -1);
    print(line);
  }
}

DBQuery.prototype.toCSV = DBCommandCursor.prototype.toCSV = toCSV; // regular find and aggregates
