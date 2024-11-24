# Requirements Elicitation III

### Use Case Description
Use Case Description contains:

- **Participating Actors** 
    - 1 **initiating actor** triggers the use case.
- **Entry Conditions** start state before the use case begins as a set of conditions.
- **Exit Conditions** end state after the use case ends as a set of conditions.
- **Flow of Events** steps performed in the **successful**/happy path:
    - Actor steps "The Actor ..."
    - System steps "The System ..."
- **Alternative Flows** steps performed on deviations from the successful path.
    - ID format: `AF-[0-9]+` **variations** from successful path.
    - ID format: `EX-[0-9]+` **exceptions** (errors) from successful path.
- **Includes** & **Extends** [Use Case Associations](./requirements-elicitation-2.md#use-case-diagram-associations)
