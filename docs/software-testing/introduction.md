# Software Bug

> A software bug is an **error, flaw, failure or fault** in a computer program or system that causes it to produce an **incorrect or unexpected result**, or to behave in **unintended ways**.

Bugs are **unexpected** behaviour in a Software System that **deviates** from requirements:

- **Debugging** identifying the **root cause** of the bug.

# Software Testing

Testing: checking software system for **known bugs**:

- **User Acceptance** reduce risk of failing User Acceptance Test done by Customer.

> Software Testing can be used to show the **presence of bugs** but **never** to
> show their **absence**.

## Black Box & White Box Testing

Types of Software Testing:

- **Black Box** testing done **without** knowledge of code implementation (requirements only).
  - [Equivalence Class Testing](#equivalence-class-testing)
  - [Boundary Value Testing](#boundary-value-testing)
- **White Box** testing done **with** knowledge of code implementation (code + requirements).
  - [Control Flow Testing](#control-flow-testing)

| Testing       | Test Complexity | Test Thoroughness | Test Coverage |
| ------------- | --------------- | ----------------- | ------------- |
| **Black Box** | Lower           | Lower             | No            |
| **White Box** | Higher          | Higher            | Yes           |

## Unit, Integration, System, Acceptance Testing

- **Unit Test** Test a single **unit** of software (eg. function) in **isolation**.
- **Integration Test** Test **interoperability** of **multiple components**
- **System Test** Test functionality of system **as a whole**.
- **Acceptance Test** Testing done by customer to verify **quality** of software delivered.

## Test Case

Components of a Test Case are derived from **verifiable** [Requirements](../requirements/analysis.md)

| Component  | Description               |
| ---------- | ------------------------- |
| **Name**   | Name of the test case     |
| **Path**   | Location of the test case |
| **Input**  | Test input                |
| **Oracle** | **Expected** test output  |
| **Log**    | **Actual** test output    |

## Order of Testing

Order of running Test Cases:

- **Cascading** test cases must be run **in order** as they **depend** on prior test cases.
- **Independent** test cases can be run in **any order**.

| Order of Testing | Test Complexity | Parallel Execution |
| ---------------- | --------------- | ------------------ |
| **Cascading**    | Lower           | No                 |
| **Independent**  | Higher          | Yes                |

