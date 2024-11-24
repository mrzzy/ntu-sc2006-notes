# Requirements Elicitation II

## Unified Modelling Language (UML)

Set of Diagrams for designing Software, **not** a programming language.

- Class Diagram
- Activity Diagram
- Use Case Diagram
- State Machine Diagram
- Communication Diagram

## Use Case

Use Case:

- describes how a user **uses a system** to accomplish a particular **goal**.
- summary of &ge;1 functional requirements **utilised together** by an **actor**.

## Use Case Model

Use Case Model combines:

- Use Case Diagram
- Use Case Description

## Use Case Diagram

```plantuml
@startuml
left to right direction
actor "Food Critic" as fc
rectangle Restaurant {
  usecase "Eat Food" as UC1
  (UC1) .> (UC2): <<include>>
  (UC3) ..> (UC1): <<extends>>
  usecase "Pay for Food" as UC2
  usecase "Drink" as UC3
}
fc -- UC1
fc -- UC2
fc -- UC3
@enduml
```

### Use Case Diagram Associations

- `<<include>>` large use case includes functionality from smaller use case (arrow side).
- `<<extends>>` use case **optionally** extends functionality of another use case (arrow side).
