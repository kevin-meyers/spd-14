using System;
//using Math;


public static class Leap
{
    public static bool IsLeapYear(int year)
    {
        int rem;
        int div = Math.DivRem(year, 4, out rem);

        if (rem != 0) 
        {
            return false;
        }

        if (div % 100 == 0)
        {
            return true;
        }

        if (div % 25 == 0)
        {
            return false;
        }

        return true;
    }
}
