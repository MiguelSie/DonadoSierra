# Students & Companies (S&C)

**Course:** Software Engineering II — Computer Science and Engineering, Politecnico di Milano (A.Y. 2024-25)
**Authors:** Andrea Carolina Donado Porto · Miguel Sebastián Sierra Arroyo

---

## Overview

This repository contains the software engineering documentation produced for the **Students & Companies (S&C)** platform, a hypothetical web-based system designed to simplify and streamline the internship matching process between university students and companies.

The platform aims to connect students seeking internships with companies looking for candidates, offering tools for profile management, internship search, recommendation, selection process handling, complaint management, and post-internship feedback.

---

## Documents

### 📄 RASD — Requirements Analysis and Specification Document

The RASD provides a full formal specification of the S&C platform. It covers:

- **Introduction & Scope** — purpose of the system, goals, world and shared phenomena, and document structure.
- **Overall Description** — product perspective through real-world scenarios, a domain class diagram, and state diagrams for key processes (registration, selection, internship lifecycle, and the recommendation system).
- **Specific Requirements** — functional requirements, external interface requirements (UI, hardware, software), a full use case diagram, 19 detailed use cases with event flows and exceptions, sequence diagrams for each use case, and a requirement-to-goal mapping table.
- **Non-Functional Requirements** — performance targets, design constraints (GDPR, WCAG, ISO 8601), and software system attributes including reliability, availability, security, maintainability, and portability.
- **Formal Analysis using Alloy** — a formal Alloy model representing the core entities and their relationships (universities, students, companies, internship offers, selection processes, and internships), with key constraints, facts, and execution examples.

### 📄 DD — Design Document (Students & Companies)

The DD translates the RASD requirements into a concrete microservices-based system design. It covers:

**Introduction** — purpose, scope, and definitions/acronyms grounding the design in the S&C platform's matchmaking domain.
**Architectural Design** — high-level microservices overview (API Gateway, Load Balancer, Event Bus), a detailed component view of all 8 microservices (UserHandler, UserInfoAndOffers, SelectionProcessManager, InternshipManager, FeedbackSystem, RecommendationSystem, NotificationSystem), a deployment view across client/CDN/server layers, and 19 runtime sequence diagrams (SQ1–SQ19) covering registration through feedback.
**Selected Architectural Styles and Patterns** — justification for microservices, API Gateway, service discovery, event sourcing, security, and communication patterns.
**User Interface Design** — mockups for the landing page, sign-up flow, login, internship search, student dashboard/profile, and company dashboard/applicant management.
**Requirements Traceability** — maps each RASD requirement (R1–R31) to the specific design components that implement it.
**Implementation, Integration and Test Plan** — feature identification (F1–F9), bottom-up integration strategy with diagrams per feature, a full system overview diagram, and the system testing strategy (functional, performance, usability, load, stress, UI testing).
**Effort Spent** — hours logged per author across document chapters.

## Key Platform Features Specified

- Student and company registration with document validation workflow
- Internship posting, search, and filtering
- Mutual contact initiation and selection process management
- Interview scheduling, questionnaire creation, and candidate evaluation tools
- Recommendation system using keyword matching and a rating engine
- Complaint handling routed to registered universities
- Internship progress tracking for universities
- End-of-internship feedback collection

Both documents can be found in the DeliveryFolder, as well as the formal specification written in Alloy.
