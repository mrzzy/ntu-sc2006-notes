# Equivalence Class Testing

**Black Box** testing method that partition possible **input domain** by **expected output** [equivalence classes](#equivalence-classes).

Test ≥ 1 set of inputs for **each equivalence class**:

- **Assumption** If the code works for the set of input(s), it should work for
    **all other inputs** in the same equivalence class.

## Equivalence Classes

Equivalence Classes are sets of possible inputs with same **expected output**:

- **Valid (Testing by Contract)** Test successful / happy path for **valid** inputs eg. Login successful.
    - **Multiple Valid Values** test multiple valid input values for each test case.
    - **Exhaustive** Optionally, if the valid input domain is small **all valid inputs** can be tested.
- **Invalid (Defensive Testing)** Test unsuccessful path for **invalid** inputs eg. Bad login credentials.
    - **Single Invalid Value** test only 1 single input value (rest are valid inputs) for each test case
        to check code correctly rejects even with only 1 invalid input.
- **Exception** error case. eg. Unable to connect to Database.

> **Numeric Equivalence Classes are Contiguous**\
> Q: Suppose you have **Invalid** output for input range $`-5 \le x \le -2`$ and
> $`3 \le x \le 10`$.\
> What are the Equivalence Classes?
>
> A: 2 Equivalence classes since the input ranges are **non overlapping**:
>
> - **Invalid** $`-5 \le x \le -2`$
> - **Invalid** $`3 \le x \le 10`$
>
> Does **not** apply to **discrete** test inputs since they have no notion of "ranges".

# Boundary Value Testing

**Black Box** Testing **Heuristic** to select test input values for **numeric** input range $`x \in [a,b]`$:
test **around** boundary values $`a`$ & $`b`$:

- **Just Above** $`x + \epsilon > a, \epsilon > 0`$
- **At Boundary** $`x = a`$
- **Just Below** $`x - \epsilon < a, \epsilon > 0`$

> **Remove Duplicates** Suppose selected test inputs overlaps with the test
> inputs of another case. Remove the duplication, since it redundant to verify
> twice with exactly the inputs.
