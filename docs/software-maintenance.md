# Software Maintenance

Software Maintenance is

> The process of **modifying** a software system after delivery to **correct faults,
> improve performance or other attributes**, or **adapt to a changed environment**.

## Software Maintenance Problems

- **Unstructured Code** spaghetti code, bad naming, deep code block nesting etc.
- **Insufficient Knowledge** about the codebase, problem domain.
- **Insufficient Documentation** missing, out of date, insufficient documentation.

## Software Mantainance Activities

- **Fault Repairs (24%)** fixing bugs, vulnerabilities.
- **Environmental Adaptation (19%)** changing software runtime environment eg. Windows Software to run on Linux OS.
- **Functionality Addition / Modification (58%)** modifying system to satisfy **new requirements**.

# Software Refactoring

Making **improvements** to codebase **without changing functionality** to
improve **structure**, reduce **complexity** and ease of code **understanding**.

## Code Smells

Refactoring removes **Code Smells**:

- duplicate code: need to correct in **multiple places** if bugged.
- long methods / functions / classes: increased **complexity** of code.
- temporary variables: with **meaningless names** eg. `a`, `b`.
- switch statement: missing `default` case, missing `break`.
- lazy class: runtime initialisation
- data redundnancy / duplication
- tight coupling
