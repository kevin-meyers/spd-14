using System;

public static class Gigasecond
{
    public static TimeSpan GSecond() => new TimeSpan(0, 0, 0, (int) Math.Pow(10, 9));

    public static DateTime Add(DateTime moment) => moment.Add(GSecond());
}
