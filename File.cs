﻿namespace Namespace
{
    public static class Class
    {
        public static System.UInt64 Number = 0;
        public static System.UInt64 Number2 = 0;
        public static System.UInt64 Number3 = System.UInt64.MaxValue;

        public static void Main(System.String[] args)
        {
            System.String File = "File.txt";
            if (!System.IO.File.Exists(File))
            {
                System.IO.File.WriteAllText(File, "Goodbye Cruel World!" + System.Environment.NewLine);

            }
            System.Console.WriteLine("WARNING! THIS A FILE CLONER! " +
                  "EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!");
            System.Console.ReadKey();
            Namespace.Class.End();
        }
        public static void End()
        {
            System.Console.Clear();
            System.String File = "File.txt";
            System.String Contents = System.IO.File.ReadAllText(File);
            System.String File2 = "File (" + Namespace.Class.Number2 + ").txt";
            for (Namespace.Class.Number = 0; Namespace.Class.Number < Namespace.Class.Number3; Namespace.Class.Number2++)
            {
                try
                {
                    System.IO.File.AppendAllText(File, Contents);
                    System.Console.Write('\r' + (Namespace.Class.Number2 + 1).ToString());
                    System.Console.Title = (Namespace.Class.Number2 + 1).ToString();
                    System.Console.Out.Flush();
                    try
                    {
                        File2 = "File (" + Namespace.Class.Number2 + ").txt";
                        System.IO.File.Copy(File, File2);
                        File = File2;
                    }
                    catch (System.Exception ex)
                    {
                        System.Console.WriteLine("Exception occurred: {0}", ex);
                        System.IO.File.Delete(File2);
                        Namespace.Class.End();
                    }
                }
                catch (System.Exception ex)
                {
                    System.Console.WriteLine("Exception occurred: {0}", ex);
                    System.IO.File.Delete(File);
                    Namespace.Class.End();
                }

            }
            System.Console.WriteLine();
        }
    }
}