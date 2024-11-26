# Software Architecture

**High Level** overview of how system **components** & **interactions** between them:

- **Components** units of software system eg. frontend, backend
- **Interactions** communication between components eg. API call.

## Software Architecture Motivation

Software Architecture / System Design is needed for:

- **Non Functional Requirements** must be **implemented** in System Design.
- **Larger Software** Lowering **complexity** in larger software systems by organising components.
- **Costs & Schedule** Correcting **bad System Design** gets progressively **more costly** as development progresses and might **delay** timely software release.

# Software Architecture Diagram

```plantuml
@startuml
package "Frontend" {
    [UI]
    [Login]
    [Dashboard]
}

package "Backend" {
    [API Gateway] as API
    [Auth Service] as Auth
    [User Service] as User
}

package "Database" {
    [User DB] as DB
}

UI --> Login : "Handles login"
UI --> Dashboard : "Displays data"
UI --> API: "Makes API calls"
API  --> Auth : "Auth routes"
API --> User : "User data routes"
Auth --> User : "Authentication"
User --> DB : "Fetch user data"
@enduml
```

- **Hierarchical** child components (eg. `UI`) are **nested** with parent components (eg. `Frontend`)
- **Abstract** obmits **unnecessary** details.
- **Purposeful** focused on **structure & interactions** of components.

# Software Architecture Style

**Pattern** (well known solution) of organising components in Software Architecture Designk

# Layered Architecture

```mermaid
graph TD
    subgraph Presentation_Layer[Presentation Layer]
        UI[UI]
        Login_View[Login View]
        Dashboard_View[Dashboard View]
    end

    subgraph Business_Logic_Layer[Buiness Logic]
        Auth_Service[Auth Service]
        User_Service[User Service]
        Dashboard_Service[Dashboard Service]
    end

    subgraph Data_Layer[Data Layer]
        User_DB[User DB]
        Settings_DB[Settings DB]
    end

    UI -->|User interacts| Login_View
    UI -->|Displays user data| Dashboard_View
    Login_View -->|Requests login| Auth_Service
    Dashboard_View -->|Fetches dashboard data| Dashboard_Service
    Auth_Service -->|Validates credentials| User_Service
    Dashboard_Service -->|Fetches user data| User_Service
    User_Service -->|Fetches user info| User_DB
    Dashboard_Service -->|Fetches settings| Settings_DB
```

Software Architecture Style that groups components into **layers**

- **Upper -> Lower** Upper layers can call lower layers, but **not the other way around**.
- **Pros**
    - **Code Reuse** for components in **lower layers**.
    - **Extensibility** for components in **upper layers**.
- **Cons**
    - **Performance** overhead.
    - **Hard to Design** which layer a component should belong to could be **unclear**.
