def longest_unique_substring_in(s):
	last_seen_index_of = {}
	start = 0
	longest_seen = 0
	for index, letter in enumerate(s):
		if letter in last_seen_index_of:
			start = last_seen_index_of(letter) + 1

		last_seen_index_of(letter) = index

		if index - start > longest_seen:
			longest_seen = index - start

	return longest_seen

