# patternCounting

What we need to do?

Implementing a function which gets two arrays as its input:
 - an array in which we want to find a pattern
 - a pattern
And returns an int. This int shows how many times can we "subtract" the pattern from the array.

The function is implemented in both Haskell and Erlang. The two solutions are almost identical.
Both solutions try to split the big problem into smaller ones.

Time complexity:
- best case: n (where the array conretely includes the pattern) or m (where the first element of the pattern is not in the array)
- worst cane: n * m (where every element of the pattern are different and the array includes the reverse pattern)
 where n > 0 is the length of the pattern array and m > 0 is the length of the array
