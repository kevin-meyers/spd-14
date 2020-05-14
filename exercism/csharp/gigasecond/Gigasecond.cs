using System;

public static class Gigasecond
{
    public static DateTime Add(DateTime moment) => moment.AddSeconds((int) Math.Pow(10, 9));
}
