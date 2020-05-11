using System;
using System.Collections.Generic;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        HashSet<char> seenChars = new HashSet<char>();
        for (char c = 'a'; c <= 'z'; c++)
        {
            seenChars.Add(c);
        }

        foreach (char c in input)
        {
            seenChars.Remove(Char.ToLower(c));
        }
        
        return seenChars.Count == 0;
    }
}
