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
    public static int newN(int n, int i, List<int> factors)
    {
        int rem, div;
        div = Math.DivRem(n, i, out rem);
        if (rem == 0) 
        {
            factors.Add(i);
            return div;
        }
        return n;
    }

    public static List<int> PrimeFactors(int n)
    {
        List<int> primes = new List<int>{2, 3};
        List<int> factors = new List<int>{};
        while (n > 1)
        {
            bool found = false;
            foreach(int i in primes)
            {
                int rem, div;
                div = Math.DivRem(n, i, out rem);
                if (rem == 0) 
                {
                    factors.Add(i);
                    n = div;
                    found = true;
                    break;
                }
            }

            if (found) continue;

            for (int j=primes.Last(); j<=n; j+=2)
            {
                if (!primes.Any(x => j % x == 0))
                {
                    int rem, div;
                    primes.Add(j);
                    div = Math.DivRem(n, j, out rem);
                    if (rem == 0) 
                    {
                        n = div;
                        factors.Add(j);
                        break;
                    }
                }
            }
        }

        return factors;
    }

    public static void Print(int[] xs) => Print(xs.ToList());
    
    public static void Print(List<int> xs)
    {
        Console.Write('[');
        foreach (int x in xs)
        {
            Console.Write(x);
            Console.Write(',');
        }
        Console.Write(']');
    }


    public static void Print(List<List<int>> ls)
    {
        Console.Write('[');
        foreach (List<int> xs in ls)
        {
            Print(xs);
        }
        Console.WriteLine(']');
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
 //       Print(ls);
 //       Console.WriteLine("");
        
        for (int i=0; i<ls.Count; i++)
        {
            for (int j=i+1; j<ls.Count; j++)
            {
                ls[j].AddRange(CartProd(ls[i], ls[j]));
            }
        }
        ls.ForEach(x=>Console.WriteLine(x.Count));
        Console.WriteLine(ls);
        return Flatten(ls);

    }

    public static Classification Classify(int number)
    {
        List<int> factors = Prod(ScanEach(GroupOf(PrimeFactors(number)), (x, y) => x*y));
        //Print(factors);
        //Console.WriteLine(factors.Count);
        int sum = factors.Sum() - number + 1;
        if (sum > number) return Classification.Abundant;
        if (sum < number) return Classification.Deficient;
        return Classification.Perfect;
    }
}
