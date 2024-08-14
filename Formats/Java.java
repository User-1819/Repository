import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class Main {
    public static long Number = 0;
    public static long Number2 = 0;
    public static long Number3 = Long.MAX_VALUE;

    public static void main(String[] args) {
        String file = "File.txt";
        if (!new File(file).exists()) {
            try {
                Files.write(Paths.get(file), "Goodbye Cruel World!".getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!");
        System.console().readLine();
        End();
    }

    public static void End() {
        System.out.flush();
        String File = "File.txt";
        try {
            String contents = new String(Files.readAllBytes(Paths.get(File)));
            for (Number = 0; Number < Number3; Number2++) {
                Files.write(Paths.get(File), contents.getBytes(), StandardOpenOption.APPEND);
                System.out.print('\r' + (Number2 + 1));
                System.setProperty("sun.java.command", (Number2 + 1) + "");
                String File2 = "File (" + Number2 + ").txt";
                Files.copy(Paths.get(File), Paths.get(File2));
                File = File2;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println();
    }
}