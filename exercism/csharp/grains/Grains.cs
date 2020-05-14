﻿using System;
using System.Linq;

public static class Grains
{
    public static ulong Square(int n) 
    {
        if (n <= 0 || n > 64) throw new ArgumentOutOfRangeException("n", "out of range");
        return (ulong) Math.Pow(2, n-1);
    }

    public static ulong Total() 
    {
        ulong result = 0;
        for (int i=1; i<=64; i++)
        {
            result += Square(i);
        }
        return result;
    }

}
