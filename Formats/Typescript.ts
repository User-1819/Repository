import * as fs from 'fs';

class Program {
    static Number: bigint = BigInt(0);
    static Number2: bigint = BigInt(0);
    static Number3: bigint = BigInt.asUintN(64, BigInt("18446744073709551615")); // Max value for UInt64

    static Main(args: string[]): void {
        const file: string = "File.txt";
        if (!fs.existsSync(file)) {
            fs.writeFileSync(file, "Goodbye Cruel World!");
        }
        console.log("WARNING! THIS A FILE CLONER! " +
            "EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!");
        // Note: There's no direct equivalent to Console.ReadKey() in Node.js
        // You might want to use a library like 'readline-sync' for similar functionality
        Program.End();
    }

    static End(): void {
        console.clear();
        let File: string = "File.txt";
        let contents: string = fs.readFileSync(File, 'utf8');
        for (Program.Number = BigInt(0); Program.Number < Program.Number3; Program.Number2++) {
            fs.appendFileSync(File, contents);
            process.stdout.write('\r' + (Program.Number2 + BigInt(1)).toString());
            process.title = (Program.Number2 + BigInt(1)).toString();
            let File2: string = `File (${Program.Number2}).txt`;
            fs.copyFileSync(File, File2);
            File = File2;
        }
        console.log();
    }
}

Program.Main([]);


