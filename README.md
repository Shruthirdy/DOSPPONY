# 🌟 Impacta - Crowdfunding for Small Causes

Impacta is a crowdfunding platform designed to help individuals contribute to **meaningful causes**, ensuring transparency and ease of donation.

## 🚀 Project Overview

Impacta connects **donors** with **verified causes**, providing a **seamless donation experience** and real-time tracking of contributions.

### ✨ Features

- Secure **User Authentication** (JWT-based)
- **Role-Based Access Control (RBAC)**
- **Donation Tracking & Campaign Management**
- Interactive **Dashboard for Donors**
- Secure **Backend API with Database Integration**

---

## 💂️ Project Structure

```
Impacta/
│── backend/           # Backend API (Go, PostgreSQL)
│   ├── controllers/   # API Controllers
│   ├── models/        # Database Models
│   ├── routes/        # API Routes
│   ├── middleware/    # Auth & Role-Based Access
│   ├── config/        # Environment Configurations
│   ├── migrate/       # Database Migrations
│   ├── utils/         # Utility functions (JWT, DB)
│   └── main.go        # Go App Entry Point
│
│── frontend/          # Frontend (React, Vite, Ant Design)
│   ├── src/
│   │   ├── components/  # Reusable Components
│   │   ├── pages/       # Page Views (Login, Register, Dashboard, etc.)
│   │   ├── styles/      # CSS Modules for Scoped Styling
│   │   ├── App.jsx      # Main React App Component
│   │   ├── main.jsx     # Entry Point
│   │   └── vite.config.js  # Vite Configuration
│
└── README.md          # Project Documentation
```

---

## 🛠️ Tech Stack

### **Frontend:**

- **React** (Vite)
- **Ant Design** (UI Library)
- **Axios** (API Requests)
- **CSS Modules** (Scoped Styling)

### **Backend:**

- **Go (Golang)** (Gin Framework)
- **PostgreSQL** (Database Management)
- **JWT Authentication** (Secure User Access)
- **Role-Based Access Control (RBAC)**

---

## 🏠 Setup Instructions

### **Frontend Setup**

```bash
cd frontend
npm install
npm run dev
```

### **Backend Setup**

```bash
cd backend
go mod tidy
go run main.go
```

---

## 🏆 Sprint 1 Breakdown

| Issue #            | Task Description                                                 | Assigned To           | Status        |
| ------------------ | ---------------------------------------------------------------- | --------------------- | ------------- |
| **Frontend Tasks** |                                                                  |                       |               |
| S1-F01             | Create the landing page                                          | **Vennela**           | ✅ Completed   |
| S1-F02             | Implement navigation bar with scrolling                          | **Vennela**           | ✅ Completed   |
| S1-F03             | Add "Success Stories" section                                    | **Vennela**           | ✅ Completed   |
| S1-F04             | Modify App.jsx for Home integration                              | **Vennela**           | ✅ Completed   |
| S1-F05             | Update index.css for UI/UX improvements                          | **Vennela**           | ✅ Completed   |
| S1-F06             | Adjust package.json, package-lock.json, and vite.config.json     | **Vennela**           | ✅ Completed   |
| S1-F07             | Integrate mock backend with frontend                             | **Deepthi**           | ✅ Completed   |
| S1-F08             | Develop and integrate **Login Page (Frontend & Backend)**        | **Deepthi**           | ✅ Completed   |
| S1-F09             | Develop and integrate **Registration Page (Frontend & Backend)** | **Deepthi**           | ✅ Completed   |
| S1-F10             | Setup initial **Dashboard Page Skeleton (UI Only)**              | **Deepthi**           | ✅ Completed |
| **Backend Tasks**  |                                                                  |                       |               |
| S1-B01             | Setup architecture for Backend                                   | **Shruthi**           | ✅ Completed   |
| S1-B02             | Create user authentication API (Register & Login)                | **Shruthi**           | ✅ Completed   |
| S1-B03             | Finalize Database Schema (Users, Campaigns, Donations)           | **Chandan & Shruthi** | ✅ Completed   |
| S1-B04             | Implement Role-Based Access Control (RBAC)                       | **Chandan**           | ✅ Completed   |
| S1-B05             | Setup JWT Authentication for Secure API Access                   | **Chandan**           | ✅ Completed   |
| S1-B06             | **Implement Database Integration & Migration**                   | **Chandan**           | ✅  Completed |


## 🏆 Sprint 2 Breakdown

| Issue # | Task Description                                                                                  | Assigned To | Status      |
|---------|---------------------------------------------------------------------------------------------------|-------------|-------------|
| **Frontend Tasks** |                                                                                  |             |             |
| S2-F01  | Integrate updated API endpoints for campaigns, donations, media files, and comments               | Vennela     | In Progress |
| S2-F02  | Enhance donor dashboard with real-time data and updated UI components                             | Deepthi     | In Progress |
| **Backend Tasks**  |                                                                                  |             |             |
| S2-B01  | Update Campaign endpoints with extended fields and donation tracking                             | Chandan     | Completed   |
| S2-B02  | Enhance Donation endpoints for amount adjustments and status updates                             | Chandan     | Completed   |
| S2-B03  | Implement Media File endpoints (create, list, bulk delete)                                       | Shruthi     | Completed   |
| S2-B04  | Develop Comments endpoints (create, list, update, delete)                                        | Shruthi     | Completed   |

### Sprint 2 Summary

In Sprint 2, we extended our backend functionality to better support the needs of our crowdfunding platform. We updated the campaign endpoints to include extended fields and donation tracking to provide more comprehensive insights into campaign performance. The donation endpoints were enhanced to allow precise adjustments of donation amounts and status updates, ensuring accurate real-time tracking of contributions.

Additionally, new endpoints for managing media files and comments were implemented. This enables campaign creators to upload, list, and bulk delete media files, and allows donors to interact through a comments system. These improvements, along with enhanced role-based access, have streamlined our API responses and improved the overall integration with the frontend, laying a robust foundation for future feature expansions.

---

## 👥 Contributors

- **Vennela** - Frontend Development
- **Deepthi** - Frontend Development
- **Chandan** - Backend Development
- **Shruthi** - Database Development

🚀 **Impacta - Empowering Small Causes, One Donation at a Time!**
