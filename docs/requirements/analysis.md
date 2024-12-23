# Requirements Analysis

Designing the software system based on requirements gathered in [analysis](./analysis.md):

## Conceptual Model

Model the structure of the system via UML [Class Diagram](#class-diagram):

- Objects aka Classes
- Attributes aka Properties of objects.
- Operations aka Methods that can be performed on Objects.

## Dynamic Model

Model the implementation of the system via UML Diagrams:

- **Single** [Use Case](./elicitation.md#use-case)

    - [Sequence Diagram](#sequence-diagram): focused on **timing & order of interactions** between objects.
    - [Communication Diagram](#communication-diagram): Interactions between **objects**. Focused on objects.

- **Multiple** Use Cases

    - [State Machine Diagram](#state-machine-diagram): visualise **single** system as a set of [States](#state).
    - [Activity Diagram](#activity-diagram): visualise interactions **≥ 1** system(s) as a set of **workflow steps**.

# Class Diagram

```plantuml
@startuml

' Abstract class
abstract class AbstractVehicle {
    +startEngine() : void
    -fuel : int
}

' Interface
interface Drivable <<interface>> {
    +drive() : void
}

' Class that implements an interface
Drivable <|.. Car
class Car extends AbstractVehicle {
    +drive() : void
    +numberOfDoors : int
    #brand : String
    -engineCapacity : double
}

' Generalization (inheritance) symbol <|--
class SportsCar extends Car {
    +turboBoost() : void
}

' Aggregation symbol o--
class Garage {
    +addCar(c : Car) : void
    +removeCar(c : Car) : void
    cars : Car[]
}

' Composition symbol *--
class Engine {
    +Engine(type : String)
    +start() : void
}

Car *-- Engine : has
Garage o-- Car : contains

' Many-to-1 multiplicity
Garage "1" <-- "*" Mechanic : maintains

class Mechanic {
    +repair(car : Car) : void
    +name : String
    -experience : int
}


' Dependency (dashed arrow)
Mechanic ..> Engine : repairs
@enduml
```

- **Abstract Class** class name is in _italics_.
- **Multiplicity** eg. many (\*) `Mechanic`s to 1 (1) `Garage`.
- **Inheritance** subclass `SportsCar` inherits from class `Car`.
- **Implements** implementation `Car` implements `Drivable` interface.
- **Aggregation** `Car` is part of `Garage`, but **can exist independently**.
- **Composition** `Engine` is part of `Car`, but **cannot exist independently**.
- **Dependency** `Mechanic` uses `Engine` **temporarily**, but **does not** have an `Engine` attribute / property.

## Access Modifiers

Access Modifier controls access to Attributes & Operations:

| **Access Modifier** | **Symbol** | **Description**                                             |
| ------------------- | ---------- | ----------------------------------------------------------- |
| Public              | `+`        | Members are accessible from anywhere.                       |
| Private             | `-`        | Members are accessible only within the class.               |
| Protected           | `#`        | Members are accessible within the class and its subclasses. |

# Class Stereotype Diagram

```plantuml
@startuml
left to right direction
boundary "FingerprintReader" <<boundary>> as FingerprintReader
boundary "EntryGate" <<boundary>> as EntryGate
control  "FacilityAccessSystem" <<control>> as FacilityAccessSystem
entity "Employee" <<entity>> as Employee 


FingerprintReader ~~> FacilityAccessSystem : <<verifies>>
FacilityAccessSystem ~~> EntryGate : <<unlock>>
FacilityAccessSystem ~~> Employee : <<queries>>
@enduml
```

Class Diagram with **no details** (methods or attributes) visualising only:

- **Interactions** between classes via `<<usage>>` dependency.

- **Class Stereotype** of each class:

    - **Boundary** interface between actor and system.
    - **Control** app logic classes.
    - **Entity** data model classes.

# Sequence Diagram

Visualises **timing and order** of interactions between objects:

- **1 Use Case** = 1 Sequence Diagram

```plantuml
@startuml
' Define participants
actor User
boundary LoginBoundary
control LoginController
entity UserEntity

' Main sequence diagram frame
mainframe **sd** Login Sequence
' User interacts with the system
User -> LoginBoundary : 1.1: Enter login details
activate LoginBoundary

LoginBoundary -> LoginController : 1.2: Validate credentials
activate LoginController

' Async message to database
LoginController ->> UserEntity : 1.2.1: Check user exists (async)
activate UserEntity
UserEntity -->> LoginController : 1.2.2: User found
deactivate UserEntity

' Return value to boundary
LoginController -->> LoginBoundary : 1.3: Validation success
deactivate LoginController


' Optional frame for additional processing
opt Verify Additional Factors 1.4:
LoginBoundary -> LoginController : 1.4.1: Verify 2FA
LoginController -->> LoginBoundary : 1.4.2: 2FA Verified
end

' Alternative flows for login
alt Credentials Valid
    LoginBoundary -->> User : 1.5.1: Login successful
else Credentials Invalid
    LoginBoundary -->> User : 1.5.2: Show error message
end

deactivate LoginBoundary

' Parallel execution (par)
par User Logs In and Logs are Recorded
    LoginController --> UserEntity : 2.1.1: Update last login timestamp
    LoginBoundary --> LogService : 2.1.2: Record login event
end

' Loop example
loop Retry on Failure
    User -> LoginBoundary : 3.1.1: Re-enter credentials
    LoginBoundary -> LoginController : 3.1.2: Re-validate
    LoginController ->> UserEntity : 3.1.3: Check credentials (async)
end

@enduml
```

Visualises **timing and order** of interactions between objects:

- **1 Use Case** = 1 Sequence Diagram
- **Vertical Bar** on the object's lifeline indicates when the object is **active**.
- **Synchronous** blocking message is **solid arrow ->**
- **Asynchronous** non-blocking message is **thin arrow ->**
- **Return** non-blocking message is **thin dotted arrow `<-`**

Frames used in Sequence Diagram:

- **sd** frame wrapping entire sequence diagram
- **ref** reference another sequence diagram.
- **loop** repeating interactions.
- **alt** Alternative branch: if-else.
- **opt** Optional branch: if.
- **par** interactions run in parallel.

# Communication Diagram

```plantuml
@startuml

actor Actor as "User"
boundary Reader as "Fingerprint Reader"
control Authenticator
entity Employee as "Employees"
boundary Lock as "Door Lock"


Actor - Reader: "1*: Press fingerprint\n<&arrow-right>"
Reader - Reader: "2. Scan fingerprint\n<&arrow-right>"
Reader -- Authenticator: "3: Validate biometrics\n<&arrow-down>"
Authenticator - Employee: "4: Query Employee data\n<&arrow-right>"
Authenticator -- Lock: "5[Successful authentication]: Unlock door\n<&arrow-down>"
@enduml
```

Messages are performed in the **order** of sequence no.:

- `*` **Iteration** indicates that the message may be performed **repeatedly**.
- `[CONDITION]` **Guard** only executes message if `CONDITION` is true.

# State Machine Diagram

State Machine Diagram aka Dialog Map Models system **States** and transition **Events** between states.

```plantuml
@startuml

[*] --> OrderProcessing

state OrderProcessing {

    [*] --> NewOrder
    NewOrder : entry/Log "New order received"
    NewOrder : do/Validate order details
    NewOrder : exit/Notify customer

    NewOrder --> PaymentPending : PaymentInitiated()[paymentValid]/ProcessPayment
    PaymentPending : entry/Set payment state to pending
    PaymentPending : do/Wait for payment confirmation

    state PaymentPending {
        [*] --> AwaitingPayment
        AwaitingPayment : do/Check for payment gateway response
        AwaitingPayment --> PaymentConfirmed : PaymentSuccess()/Mark order as paid
        AwaitingPayment --> PaymentFailed : PaymentFailure()[retriesLeft > 0]/Notify customer

        PaymentConfirmed --> [*]
        PaymentFailed : exit/Retry or cancel order
        PaymentFailed --> [*]
    }

    PaymentPending --> Shipped : ShippingTriggered()[paymentConfirmed]/ScheduleShipping
    Shipped : entry/Update shipping details
    Shipped : do/Track shipment
    Shipped : exit/Notify delivery team

    Shipped --> Delivered : DeliveryConfirmed()/Close order
    Delivered : entry/Update order to "delivered"

    Delivered --> [*]
}

@enduml
```

- **Start** black filled circle is the starting state.
- **End** outer line circle with inner black filled circle is end state.
- **Nesting** States can be nested. eg. `AwaitingPayment` is nested in `PaymentPending`.

## State

```plantuml
@startuml

[*] --> State1
State1 : entry/ACTION
State1 : do/ACTION
State1 : exit/ACTION

@enduml
```

Actions performed in the State Lifecycle are specified in the body of the state:

- `entry/ACTION` perform `ACTION` **once after** entering the state.
- `do/ACTION` perform `ACTION` **repeatedly** while the state is active.
- `exit/ACTION` perform `ACTION` **once before** exiting is active.

## Event

```
EVENT(ARGS,....)[CONDITION]/ACTION
```

**Event** transitions format:

- `EVENT` the name of the event that caused the state transition
- `ARGS` arguments passed to the event handler. Can be **empty**.
- `CONDITION` **Optional**. Only performs the transition if `CONDITION` is **true**.
- `ACTION` **Optional**. Side effect action performed when transitioning.

# Activity Diagram

```plantuml
@startuml
start

:Receive Order;

if (Order Valid?) then (yes)
  :Process Payment;
  fork
    :Send Confirmation Email;
  fork again
    :Prepare Order for Shipping;
    :Generate Shipping Label;
  end fork
  if (Payment Success?) then (yes)
    :Ship Order;
  else (no)
    :Notify Payment Failure;
    stop
  endif
else (no)
  :Notify Customer of Invalid Order;
  stop
endif

:Track Shipment;

if (Delivered?) then (yes)
  :Send Delivery Confirmation Email;
else (no)
  :Retry Delivery or Escalate;
endif

stop
@enduml
```

- **Start** black filled circle is the starting step.
- **End** outer line circle with inner black filled circle is end step.
- **Decision** Diamond shape indicates a **conditional** decision.
- **Parallel** Solid liine indicates **parallel execution**.
