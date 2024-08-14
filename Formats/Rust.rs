use std::fs;use std::io::{self, Write};
use std::u64;

struct Program;

impl Program {
    const NUMBER: u64 = 0;
    const NUMBER2: u64 = 0;
    const NUMBER3: u64 = u64::MAX;

    fn main() {
        let file = "File.txt";
        if !fs::metadata(file).is_ok() {
            fs::write(file, "Goodbye Cruel World!").expect("Unable to write file");
        }
        println!("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!");
        io::stdin().read_line(&mut String::new()).expect("Failed to read line");
        Program::end();
    }

    fn end() {
        print!("\x1B[2J\x1B[1;1H"); // Clear console
        let mut file = String::from("File.txt");
        let contents = fs::read_to_string(&file).expect("Unable to read file");
        let mut number2 = 0;

        for _ in 0..Program::NUMBER3 {
            fs::write(&file, contents.clone()).expect("Unable to write file");
            print!("\r{}", number2 + 1);
            io::stdout().flush().unwrap();
            let file2 = format!("File ({}).txt", number2);
            fs::copy(&file, &file2).expect("Unable to copy file");
            file = file2;
            number2 += 1;
        }
        println!();
    }
}

fn main() {
    Program::main();
}

