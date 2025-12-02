[assembly: System.Reflection.AssemblyTitle("AssemblyTitle")]
[assembly: System.Reflection.AssemblyProduct("AssemblyProduct")]
[assembly: System.Reflection.AssemblyDescription("AssemblyDescription")]
[assembly: System.Reflection.AssemblyTrademark("AssemblyTrademark")]
namespace Namespace
{
    public static class Class
    {
        private static System.UInt64 Number = 0;
        private static System.UInt64 Number2 = 0;
        private static System.String File = "File.txt";
        private static System.String File2 = "File.txt";
        private static System.String Contents = System.String.Empty;
        private static System.Exception Exception;
        private static readonly System.UInt64 Number3 = System.UInt64.MaxValue;
        private static void Main(System.String[] _)
        {
            if (!System.IO.File.Exists(Namespace.Class.File))
            {
                System.IO.File.WriteAllText(Namespace.Class.File, "Goodbye Cruel World!" + System.Environment.NewLine);
            }
            System.Console.Out.WriteLine("WARNING! THIS A FILE CLONER! " +
                  "EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!");
            System.Console.Out.WriteLine("ARE YOU SURE YOU WANT TO CONTINUE? Y OR N");
            if (System.Console.ReadLine().ToUpper().Contains("Y"))
            {
                Namespace.Class.End();
            }
            else
            {
                System.Environment.Exit(0);
                return;
            }
        }
        private static void End()
        {
            System.Console.Clear();
            Namespace.Class.Contents = System.IO.File.ReadAllText(Namespace.Class.File);
            Namespace.Class.File2 = "File (" + Namespace.Class.Number2 + ").txt";
            for (Namespace.Class.Number = 0; Namespace.Class.Number < Namespace.Class.Number3; Namespace.Class.Number2++)
            {
                try
                {
                    System.IO.File.AppendAllText(Namespace.Class.File, Namespace.Class.Contents);
                    System.Console.Out.Write('\r' + (Namespace.Class.Number2 + 1).ToString());
                    System.Console.Title = (Namespace.Class.Number2 + 1).ToString();
                    System.Console.Out.Flush();
                    try
                    {
                        Namespace.Class.File2 = "File (" + Namespace.Class.Number2 + ").txt";
                        System.IO.File.Copy(Namespace.Class.File, Namespace.Class.File2);
                        Namespace.Class.File = Namespace.Class.File2;
                    }
                    catch (System.Exception ex)
                    {
                        Namespace.Class.Exception = ex;
                        System.Console.Out.WriteLine("Exception occurred: {0}", Namespace.Class.Exception);
                        System.IO.File.Delete(Namespace.Class.File2);
                        Namespace.Class.End();
                    }
                }
                catch (System.Exception ex)
                {
                    Namespace.Class.Exception = ex;
                    System.Console.Out.WriteLine("Exception occurred: {0}", Namespace.Class.Exception);
                    System.IO.File.Delete(Namespace.Class.File);
                    Namespace.Class.End();
                }
            }
            System.Console.Out.WriteLine();
        }
    }
}