using System;
using System.Collections.Generic;
using System.Linq;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}


public static class PerfectNumbers
{
    public static bool isFactor(int n, int i) => n % i == 0;

    public static int GetNextPrime(int n, List<int> ps)
    {
        return isFactor(n, ps.Last()) ? ps.Last() : AddPrimes(n, ps);
    }

    public static List<int> PrimeFactors(int n)
    {
        List<int> primes = new List<int>{2};
        List<int> factors = new List<int>{};
        while (n > 1)
        {
            int p = GetNextPrime(n, primes);

            factors.Add(p);
            n = n / p;
       }

        return factors;
    }

    public static int AddPrimes(int n, List<int> primes)
    {
        for (int i=primes.Last(); i<Math.Sqrt(n); i+=2)
        {
            if (i == 2) i = 3;
            if (!primes.Any(x => isFactor(i, x)))
            {
                primes.Add(i);
                if (isFactor(n, i)) return i;
            }
        }
        return n;
    }

    public static List<List<int>> GroupOf(List<int> l)
    {
        List<List<int>> result = new List<List<int>>();
        int lower = 0;
        int currentNum = l[0];
        l.Add(-1); //Wacky but this is so the last item is different.
        for(int i=1; i<l.Count; i++)
        {
            if (l[i] == currentNum) continue;
            result.Add(Enumerable.Repeat(currentNum, i - lower).ToList());
            lower = i;
            currentNum = l[i];
        }
        return result;
    }

    public static List<int> Scan(List<int> ls, Func<int, int, int> f)
    {
        for (int i = 1; i < ls.Count; i++) ls[i] = f(ls[i-1], ls[i]);
        return ls;
    }

    public static int[] CartProd(List<int> l1, List<int> l2)
    {
        int[] result = new int[l1.Count * l2.Count];
        for (int i=0; i < l1.Count; i++)
        {
            for (int j=0; j < l2.Count; j++)
            {
                result[i + j] = l1[i] * l2[j];
            }
        }
        return result;
    }

    public static List<List<int>> ScanEach(List<List<int>> ls, Func<int, int, int> f)
    {
        return ls.Select(xs => Scan(xs, f)).ToList();
    }
        
    public static List<int> Flatten(List<List<int>> ls) 
    {
        return (from inner in ls from value in inner select value).ToList();
    }

    public static List<int> Prod(List<List<int>> ls)
    {
        
        for (int i=0; i<ls.Count; i++)
        {
            for (int j=i+1; j<ls.Count; j++)
            {
                ls[j].AddRange(CartProd(ls[i], ls[j]));
            }
        }
        return Flatten(ls);

    }

    public static Classification ClassOf(int n, int sum)
    {
        if (sum > n) return Classification.Abundant;
        if (sum < n) return Classification.Deficient;
        return Classification.Perfect;
    }

    public static Classification Classify(int number)
    {
        if (number == 1) return Classification.Deficient;
        if (number < 1) throw new ArgumentOutOfRangeException();

        List<int> factors = Prod(ScanEach(GroupOf(PrimeFactors(number)), (x, y) => x*y));
        return ClassOf(number, factors.Sum() - number + 1);
    }
}
