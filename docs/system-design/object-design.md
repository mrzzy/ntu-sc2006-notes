# Object Design

Object design: how to design Objects / Classes in [Class Diagram](../requirements/analysis.md#class-diagram)?

- **Interface Specification** defining **boundaries** between components eg. operations, arguments, properties.
- **Identifying Reuse** leveraging **existing** libraries & [Design Patterns](#design-patterns).
- **Restructuring** refactoring done to preserve code maintainability.
- **Optimisation** improve speed or memory performance.

# Design Patterns

Existing **solution** to a **design problem**:

- **Name** terminology used to talk about the design pattern.
- **Problem** that design pattern attempts to resolve.
- **Solution** how to implement the design pattern.
- **Consequences** trade offs in implementing the design pattern.

## Types of Design Patterns

Design Patterns classified by the problem they solve:

- **Creation Patterns**: how to **create** objects?
- **Structural Patterns**: how to **compose** (combine) objects?
- **Behavioural Patterns**: how to **implement** specific **behaviour** with objects?

# Strategy Pattern

```plantuml
@startuml
interface PaymentStrategy {
    + pay(amount: double)
}

class CreditCardPayment implements PaymentStrategy {
    + pay(amount: double)
}

class PayPalPayment implements PaymentStrategy {
    + pay(amount: double)
}

class PaymentContext {
    - strategy: PaymentStrategy
    + setStrategy(strategy: PaymentStrategy)
    + executePayment(amount: double)
}

PaymentContext --> PaymentStrategy : uses

@enduml
```

Strategy is **Behavioural Pattern**:

- **Problem** a set of algorithms (eg. `CreditCardPayment`, `PayPalPayment`) should be **interchangeable** (eg. `PaymentStrategy`)
- **Solution** implement algorithms behind a **common interface**.
- **Consequences**
    - **Pros**:
        - **Encapsulation** hides implementation details.
        - **Extensiblity** ie. code dependent on `PaymentStrategy` does **not need to change**
            to add a new `PaymentStrategy` implementation.
        - **Hot Swappable** Software behaviour change at runtime by swapping classes (eg. `CreditCardPayment` -> `PayPalPayment`).
    - **Cons**: Increases complexity.

# Observer Pattern

```plantuml
@startuml
class WeatherStation {
    -observers: List<Observer>
    +register(o: Observer)
    +remove(o: Observer)
    +notify()
    +setWeatherData(temperature: float, humidity: float)
}

interface Observer {
    +update(temperature: float, humidity: float)
}

Observer <|.. MobileDisplay
Observer <|.. WebDisplay
WeatherStation ..> Observer

class MobileDisplay {
    +update(temperature: float, humidity: float)
    +updateDisplay()
}

class WebDisplay {
    +update(temperature: float, humidity: float)
    +updateDisplay()
}
@enduml
```

```plantuml
@startuml
participant "WeatherStation\n(Subject)" as WeatherStation
participant "MobileDisplay\n(Observer)" as MobileDisplay
participant "WebDisplay\n(Observer)" as WebDisplay

' == Register Observers ==
MobileDisplay -> WeatherStation : register(self)
WebDisplay -> WeatherStation : register(self)

' == Set Weather Data and Notify Observers ==
WeatherStation -> WeatherStation : setWeatherData(temperature, humidity)
WeatherStation -> MobileDisplay : notify(temperature, humidity)
WeatherStation -> WebDisplay : notify(temperature, humidity)

@enduml
```

Strategy is **Behavioural Pattern**:

- **Problem** Broadcast: Update **≥1** observer objects when a subject object **changes** without polling.
- **Solution**
    1. Observers (eg. `MobileDisplay`, `WebDisplay`) `register()` themselves with the Subject (`WeatherStation`)
    2. Subject calls `notify()` on Observers to notify them of changes.
    3. Observer obtains changes from Subject and does what it needs to do.
- **Pros**
    - **Loose Coupling** subject is **not dependent** on Observer implementations. Observer does not have to **poll** Subject constantly for changes.
- **Cons**
    - **Performance** overhead.
    - **Complexity** increases code complexity.

## Change Propagation

How changes are propagated from Subject to Observer:

- **Pull Approach** changes "pulled" by observer via calling methods on the Subject (call back).
    - **2-Way** communication (Subject -> Observer, Observer -> Subject) **increased** coupling.
    - **Selective Changes** each Observer can retrieve only the changes it needs by selective calling subject.
- **Push Approach** changes "pushed" by subject via `notify(changes)` parameter.
    - **1-Way** communication (Subject -> Observer) **reduced** coupling.
    - **All Changes** same set of changes are pushed to all observers.
- **Push + Pull** combines both approaches by having subject **push** minimal changes
    and the observer **pull** any additional changes that it requires.

# Factory Pattern

```plantuml
@startuml
interface Shape {
  + draw() : void
}

class Circle extends Shape {
  + draw() : void
}

class Rectangle extends Shape {
  + draw() : void
}

class Square extends Shape {
  + draw() : void
}

class ShapeFactory {
  + createShape(type: String) : Shape
}

class App {
}

App --> ShapeFactory : <<uses>>
App --> Shape : <<uses>>
ShapeFactory --> Shape : <<creates>>
@enduml
```

Factory is **Creational Pattern**

- **Problem** How to encapulate & defer creation of an implementation (eg. `Circle`, `Square`) of interface (eg. `Shape`)?
- **Solution** App uses Factory (eg. `ShapeFactory`) to create an implementation (eg. `Circle`) of the interface (eg. `Shape`).
- **Pros**
    - **Encapulation** hides creation logic.
    - **Extensiblity** in creation logic, adding new implementations to interface.

# Facade Pattern

```plantuml
@startuml
class HomeTheaterFacade {
  + watchMovie(movie: String) : void
  + endMovie() : void
}

class Amplifier {
  + on() : void
  + setVolume(level: int) : void
  + off() : void
}

class DVDPlayer {
  + on() : void
  + play(movie: String) : void
  + stop() : void
  + off() : void
}

class Projector {
  + on() : void
  + setInput(source: String) : void
  + off() : void
}

class Client {
  + main() : void
}

Client --> HomeTheaterFacade : <<uses>>
HomeTheaterFacade --> Amplifier : <<controls>>
HomeTheaterFacade --> DVDPlayer : <<controls>>
HomeTheaterFacade --> Projector : <<controls>>
@enduml
```

Facade is **Structural Pattern**

- **Problem** How can **reduce** dependencies on **multiple** objects (eg. `Amplifier`, `DVDPlayer`, `Projector`)?
- **Solution** Group interfaces into a single Facade (eg. `HomeTheaterFacade`) and depend on the Facade instead.
- **Pros**
    - **Ease of Use** code has to call 1 Facade instead of juggling multiple objects.
    - **Reduces Dependencies** on multiple objects to 1 Facade.
    - **Decoupling** code from multiple objects.
- **Cons**
    - **Extra Work** to replicate functionality behind Facade.
    - **Complexity** due to indirection.
    - **Performance** overhead.
