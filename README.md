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

### 📄 DD — Design Document *(coming soon)*

The Design Document will detail the architectural decisions, component design, and implementation guidelines derived from the RASD.

---

## Key Platform Features Specified

- Student and company registration with document validation workflow
- Internship posting, search, and filtering
- Mutual contact initiation and selection process management
- Interview scheduling, questionnaire creation, and candidate evaluation tools
- Recommendation system using keyword matching and a rating engine
- Complaint handling routed to registered universities
- Internship progress tracking for universities
- End-of-internship feedback collection

---

## Repository Structure

```
/
├── RASD/
│   └── RASDv1.pdf       # Requirements Analysis and Specification Document
└── README.md
```
