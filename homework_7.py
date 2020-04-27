""" Given an input string, reverse the string word by word.

s: 'the sky is blue   '
-> s: 'the sky is blue'
-> ['the', 'sky', 'is', 'blue']
-> iter(['blue', 'is', 'sky', 'the'])
-> 'blue is sky the'
"""

class Solution:
    def reverseWords(self, s: str) -> str:
        return ' '.join(reversed(s.strip().split()))


"""
Given a paragraph and a list of banned words, return the most frequent word that is not in the list of banned words.  It is guaranteed there is at least one word that isn't banned, and that the answer is unique.

Words in the list of banned words are given in lowercase, and free of punctuation.  Words in the paragraph are not case sensitive.  The answer is in lowercase.
"""


from collections import defaultdict
import re

class FreqTable:
    def __init__(self):
        self.table = defaultdict(lambda: 0)
        self.ordering = []
        self._add_freq()

    def _add_freq(self):
        self.ordering.append(set())

    def add_1(self, word):
        if word not in self.table:
            self.table[word] = 0
            self.ordering[0].add(word)

        ind = self.table[word]

        self.ordering[ind].remove(word)
        if ind >= len(self.ordering) - 1:
            self._add_freq()
        self.ordering[ind + 1].add(word)

        self.table[word] += 1

    def get_highest(self):
        return self.ordering[-1].pop()


class Solution:
    def mostCommonWord(self, paragraph: str, banned: List[str]) -> str:
        word_freqs = FreqTable()
        banned_set = set(banned)
        words = re.sub(r'[^\w\s]', ' ', paragraph).lower().split()
        for word in words:
            if not word or word in banned_set:
                continue

            word_freqs.add_1(word)

        return word_freqs.get_highest()
