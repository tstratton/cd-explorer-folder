using System.IO;
using SHDocVw;
using System;

// code and development hints from these pages
// http://omegacoder.com/?p=63
// http://www.bolinfest.com/pullrank/helloIE.php

class ListExplorerPaths
{
    static int Main(string[] args)
    {
        SHDocVw.ShellWindows shellWindows = new SHDocVw.ShellWindowsClass();

        string filename;
        string prefix = "";
        Uri uri;
        int count = 0;
        int choice = -1;
        
        Console.Out.NewLine="\n";
        Console.Error.NewLine="\n";

        if (args.Length >= 1) {
            //choice = Int32.ParseInt(args[0]);
            if (!Int32.TryParse(args[0], out choice)) {
                Console.Error.WriteLine("Error! argument could not be parsed.");
                choice = -1;
                return 1;
            }
        }
        foreach ( SHDocVw.InternetExplorer ie in shellWindows )
        {
            filename = Path.GetFileNameWithoutExtension( ie.FullName ).ToLower();
            
            /*
            if ( filename.Equals( "iexplore" ) ) {
                Console.WriteLine( "Web Site   : {0} == {1}", ie.LocationURL, ie.LocationName);
            }
            */

            if ( filename.Equals( "explorer" ) && ie.LocationURL.StartsWith( "file://" )) {
                if (choice > -1) {
                    if (choice == count) {
                        prefix = "";
                    } else if (count < choice) {
                        count++;
                        continue;
                    } else {
                        break;
                    }
                } else {
                    prefix = count + ": ";
                }
                ///Console.WriteLine("after choice check");
                if (ie.LocationURL.StartsWith("file:///")) {
                    uri = new Uri(ie.LocationURL);
                    Console.WriteLine( "{0}{1}", prefix, uri.GetComponents(UriComponents.Path, UriFormat.Unescaped));
                } else {
                    uri = new Uri(ie.LocationURL);
                    Console.WriteLine( "{0}//{1}", prefix,
                        uri.GetComponents(UriComponents.Path | UriComponents.Host, UriFormat.Unescaped));
                }
                count++;
            }
        }
        if (choice > -1 && choice >= count) {
            Console.Error.WriteLine("Error! argument too large");
            return 1;
        }
        return 0;
    }
}

