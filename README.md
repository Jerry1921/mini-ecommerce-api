# Mini E-Commerce API (Spring Boot)

A RESTful backend application that simulates a basic online shopping platform.
The system supports authentication, role-based authorization, product management, shopping cart operations, and order processing with proper business rules and data consistency.



##  Features

### Authentication & Authorization

* User Registration
* User Login (JWT Based)
* Role Based Access Control

    * **ADMIN**
    * **CUSTOMER**
* Secure password encryption (BCrypt)



### Product Management (Admin)

* Add new product
* Update product information
* Delete product
* Update stock quantity


### Customer Operations

* Add product to cart
* Remove product from cart
* View cart items
* Place order



### Order System

* Order total calculated in backend
* Automatic stock deduction after successful order
* Prevent ordering more than available stock
* Prevent negative inventory
* Data consistency using database transactions


## Tech Stack

| Technology       | Usage                          |
|------------------| ------------------------------ |
| Java 21          | Programming language           |
| Spring Boot 3    | Backend framework              |
| Spring Security 6 | Authentication & Authorization |
| JWT (JSON Web Token) | Stateless authentication       |
| Spring Data JPA  | Database ORM                   |
| Hibernate        | Persistence provider           |
| MySQL            | Database                       |
| Maven            | Dependency management          |
| Lombok           | Boilerplate reduction          |
| Postman          | API testing                    |

---

## Setup Instructions

### 1️⃣ Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/mini-ecommerce-api.git
cd mini-ecommerce-api
```

### 2️⃣ Configure Database

Open:

```
src/main/resources/application.properties
```

MySQL:

```
spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce
spring.datasource.username=root
spring.datasource.password=yourpassword

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

---

### 3️⃣ Run the Application

```bash
mvn spring-boot:run
```

Application runs at:

```
http://localhost:8080
```

---

## Authentication

Login endpoint:

```
POST /api/auth/login
```

Response:

```
JWT Token
```

Use token in headers:

```
Authorization: Bearer YOUR_TOKEN
```

---

## Database Schema (Entities)

* User
* Product
* Cart
* CartItem
* Order
* OrderItem

### Relationships

* One User → One Cart
* One Cart → Many CartItems
* One Order → Many OrderItems
* One Product → Many OrderItems

---

## Key Architectural Decisions

* Stateless authentication using JWT instead of session
* Separation of ADMIN and CUSTOMER endpoints
* Stock deducted only after successful order placement
* Service layer handles business logic
* Repository layer handles database operations
* Transaction management ensures data integrity

---

## Business Rules Implemented

* Customer cannot order more than available stock
* Order total calculated on server
* Product stock cannot go negative
* Order placed only if all items available
* Stock updated atomically (transactional)

---

## Assumptions

* Each user has one cart
* Payment system is simulated
* Orders are considered successful after placement
* Email is unique for each user

---

## API Documentation

Postman collection included in repository.

---

## Author

Jerry Jeriomio Joydhor |
Java Spring Boot Backend Developer
