let Number = 0n;
let Number2 = 0n;
let Number3 = BigInt(Number.MAX_SAFE_INTEGER);

function Main(args) {
  let file = "File.txt";
  if (!fs.existsSync(file)) {
    fs.writeFileSync(file, "Goodbye Cruel World!");
  }
  console.log("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!");
  readlineSync.keyInPause();
  End();
}

function End() {
  console.clear();
  let File = "File.txt";
  let contents = fs.readFileSync(File, "utf8");
  while (Number < Number3) {
    fs.appendFileSync(File, contents);
    console.log(`\r${++Number2}`);
    process.stdout.title = Number2.toString();
    process.stdout.write("");
    let File2 = `File (${Number2}).txt`;
    fs.copyFileSync(File, File2);
    File = File2;
  }
  console.log();
}

// Assuming you have the following libraries imported:
// const fs = require('fs');
// const readlineSync = require('readline-sync');

