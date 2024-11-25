# Software Engineering

Software Engineering is the:

> The production of **maintainable**, **fault-free** software that meets the user’s **requirements** and is delivered **on time** and **within budget**.

**not** just coding.

# Software Development Activities

```mermaid
flowchart LR
    s((Start)) --> r[Requirements]

    r --> d[Design]
    d --> i[Implementation]
    i --> t[Testing]
    t --> e

    e((End))
```

Software Engineering Activities & their deliverables:

1. **Requirements** specify how the system should function
    - [Requirements Ellicitation](./requirements/elicitation.md): Software Requirements Specification (SRS)
    - [Requirements Analysis](./requirements/analysis.md): Prototype System Design
2. **Design** System Design & review:
    - Software Design Document
    - Interface Design Document
    - Test Cases
    - Data Models
3. **Implementation**
    - Source Code
    - Software
    - Documentation: eg. User Manual
4. **Testing** checking that the software conforms to requirements
    - Test Report eg. User Acceptance test
5. **Maintenance** evolving software to changing customer needs.
    - Feature requests
    - Bug Fixes
