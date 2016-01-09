using System.IO;
using SHDocVw;
using AxSHDocVw;
using System;

// http://omegacoder.com/?p=63

// http://www.bolinfest.com/pullrank/helloIE.php

class HelloCsharp
{
    static void Main()
    {
        SHDocVw.ShellWindows shellWindows = new SHDocVw.ShellWindows();

        //SHDocVw.
        string filename;

        foreach (SHDocVw.InternetExplorer ie in shellWindows)
        {
            filename = Path.GetFileNameWithoutExtension(ie.FullName).ToLower();

            /*
            if (filename.Equals("iexplore"))
                Console.WriteLine("Web Site   : {0}", ie.LocationURL);

            if (filename.Equals("explorer"))
                Console.WriteLine("Hard Drive : {0}", ie.LocationURL);
            */
            if (filename.Equals("explorer"))
                Console.WriteLine("{0}", ie.LocationURL);
        }
    }
}

