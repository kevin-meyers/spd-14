using System;
using System.Collections.Generic;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        HashSet<char> seenChars = new HashSet<char>();
        foreach (char c in word.ToLower())
        {
            if (!Char.IsLetter(c)) continue;
            if (seenChars.Contains(c)) return false;
            seenChars.Add(c);
        }

        return true;
    }
}
