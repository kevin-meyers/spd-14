using System;
using System.Linq;
using System.Collections.Generic;

public static class Acronym
{
    public static string Abbreviate(string phrase)
    {
        char[] splitters = { ' ', '_', '-' };
        IEnumerable<string> words = phrase.Split(splitters).Where(x => !string.IsNullOrEmpty(x));
        return string.Join("", from word in words select Char.ToUpper(word[0]));
    }
}
