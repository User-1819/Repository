public class Program
    {
        public static System.UInt64 Number = 0;
        public static System.UInt64 Number2 = 0;
        public static System.UInt64 Number3 = System.UInt64.MaxValue;

    public static void Main(System.String[] args)
    {
        System.String file = "File.txt";
        if (!System.IO.File.Exists(file))
        {
            System.IO.File.WriteAllText(file, "Goodbye Cruel World!");
  
        }
        System.Console.WriteLine("WARNING! THIS A FILE CLONER! " +
              "EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!");
        System.Console.ReadKey();
        Program.End();
    }
    public static void End()
    {
        System.Console.Clear();
        System.String File = "File.txt";
        System.String contents = System.IO.File.ReadAllText(File);
        for (Program.Number = 0; Program.Number < Program.Number3; Program.Number2++)
        {
                    System.IO.File.AppendAllText(File, contents);
                    System.Console.Write('\r' + (Program.Number2 + 1).ToString());
                    System.Console.Title = (Program.Number2 + 1).ToString();
                    System.Console.Out.Flush();
                    System.String File2 = "File (" + Program.Number2 + ").txt";
                    System.IO.File.Copy(File, File2);
                    File = File2;
        }   
     System.Console.WriteLine();
    }
}