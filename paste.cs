// paste.cs
// http://huddledmasses.org/jaykul/
// Original code by Joel 'Jaykul' Bennett
// Modified by David Anderle 'davidanderle'
// Usage: Put the compiled paste.exe to System32 folder, and call it from WSL
//  as 'paste'.

using System;
using System.Windows.Forms;
using System.Threading;
using System.Text;

public class Paste {
	[STAThread]
	static void Main( string[] args )
	{
		Console.OutputEncoding = Encoding.UTF8;
		foreach(string line in Clipboard.GetText().Split(new string[]{"\r\n","\n","\r"}, StringSplitOptions.None ))
			Console.Write(line+"\n");
	}
}
