def longest_unique_substring_in(s):
    last_seen_index_of = {}
    start = 0
    longest_seen = 0
    for index, l in enumerate(s):
        if l in last_seen_index_of and last_seen_index_of[l] >= start:
            start = last_seen_index_of[l] + 1

        last_seen_index_of[l] = index

        if index - start > longest_seen:
            longest_seen = index - start

    return longest_seen + 1

if __name__ == '__main__':
    print(longest_unique_substring_in('absafionamcopkfa'))
