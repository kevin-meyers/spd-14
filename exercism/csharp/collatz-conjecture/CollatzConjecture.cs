using System;

public static class CollatzConjecture
{
    private static int Recur(int n, int s)
    {
        if (n <= 1) return s;
        return n % 2 == 0 ? Recur(n/2, s + 1) : Recur(3*n + 1, s + 1);
    }
    public static int Steps(int number)
    {
        if (number < 1) throw new ArgumentOutOfRangeException();
        return Recur(number, 0);
    }
}
