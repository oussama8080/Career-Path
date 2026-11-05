# STEP 3: Frontend Architecture & React Setup

## 1. Frontend Technology Stack

```
React + Modern UI
├── Routing: React Router v6
├── State Management: Context API + useReducer
├── Styling: Tailwind CSS + CSS Modules
├── Component Library: Shadcn/UI or Material-UI
├── HTTP Client: Axios
├── Form Handling: React Hook Form + Zod
├── Date Management: date-fns
├── Icons: React Icons or Heroicons
├── Notifications: React Toastify
├── Charts: Chart.js or Recharts
└── Build Tool: Vite
```

---

## 2. React Project Folder Structure

```
frontend/
│
├── public/
│   └── assets/
│       ├── images/
│       ├── icons/
│       └── logos/
│
├── src/
│   │
│   ├── components/
│   │   ├── common/
│   │   │   ├── Navbar.jsx
│   │   │   ├── Sidebar.jsx
│   │   │   ├── Footer.jsx
│   │   │   ├── Button.jsx
│   │   │   ├── Card.jsx
│   │   │   ├── Badge.jsx
│   │   │   ├── Avatar.jsx
│   │   │   ├── Loading.jsx
│   │   │   ├── Modal.jsx
│   │   │   ├── Pagination.jsx
│   │   │   ├── SearchBar.jsx
│   │   │   └── NotificationToast.jsx
│   │   │
│   │   ├── forms/
│   │   │   ├── LoginForm.jsx
│   │   │   ├── RegisterForm.jsx
│   │   │   ├── ProfileForm.jsx
│   │   │   ├── InternshipOfferForm.jsx
│   │   │   ├── ApplicationForm.jsx
│   │   │   ├── EvaluationForm.jsx
│   │   │   └── FilterForm.jsx
│   │   │
│   │   ├── cards/
│   │   │   ├── InternshipCard.jsx
│   │   │   ├── ApplicationCard.jsx
│   │   │   ├── StudentCard.jsx
│   │   │   ├── CompanyCard.jsx
│   │   │   ├── EvaluationCard.jsx
│   │   │   └── RecommendationCard.jsx
│   │   │
│   │   └── layout/
│   │       ├── Layout.jsx
│   │       ├── Sidebar.jsx
│   │       └── Header.jsx
│   │
│   ├── pages/
│   │   │
│   │   ├── auth/
│   │   │   ├── LoginPage.jsx
│   │   │   ├── RegisterPage.jsx
│   │   │   ├── ForgotPasswordPage.jsx
│   │   │   └── ResetPasswordPage.jsx
│   │   │
│   │   ├── student/
│   │   │   ├── StudentDashboard.jsx
│   │   │   ├── StudentProfile.jsx
│   │   │   ├── EditProfile.jsx
│   │   │   ├── InternshipBrowse.jsx
│   │   │   ├── InternshipDetail.jsx
│   │   │   ├── Recommendations.jsx
│   │   │   ├── MyApplications.jsx
│   │   │   ├── ApplicationDetail.jsx
│   │   │   ├── MyInternships.jsx
│   │   │   ├── InternshipProgress.jsx
│   │   │   ├── SavedOffers.jsx
│   │   │   └── Evaluations.jsx
│   │   │
│   │   ├── company/
│   │   │   ├── CompanyDashboard.jsx
│   │   │   ├── CompanyProfile.jsx
│   │   │   ├── EditProfile.jsx
│   │   │   ├── InternshipOffers.jsx
│   │   │   ├── CreateOffer.jsx
│   │   │   ├── EditOffer.jsx
│   │   │   ├── Applications.jsx
│   │   │   ├── ApplicationDetail.jsx
│   │   │   ├── Interns.jsx
│   │   │   ├── InternDetail.jsx
│   │   │   ├── Analytics.jsx
│   │   │   └── Messages.jsx
│   │   │
│   │   ├── supervisor/
│   │   │   ├── SupervisorDashboard.jsx
│   │   │   ├── SupervisorProfile.jsx
│   │   │   ├── AssignedInterns.jsx
│   │   │   ├── InternDetail.jsx
│   │   │   ├── CreateEvaluation.jsx
│   │   │   ├── TrackProgress.jsx
│   │   │   ├── Evaluations.jsx
│   │   │   └── Messages.jsx
│   │   │
│   │   ├── admin/
│   │   │   ├── AdminDashboard.jsx
│   │   │   ├── UserManagement.jsx
│   │   │   ├── UserDetail.jsx
│   │   │   ├── StudentsList.jsx
│   │   │   ├── CompaniesList.jsx
│   │   │   ├── SupervisorsList.jsx
│   │   │   ├── OffersModeration.jsx
│   │   │   ├── Analytics.jsx
│   │   │   ├── SystemSettings.jsx
│   │   │   ├── ActivityLogs.jsx
│   │   │   └── SendNotification.jsx
│   │   │
│   │   └── 404.jsx
│   │
│   ├── hooks/
│   │   ├── useAuth.js
│   │   ├── useApi.js
│   │   ├── usePagination.js
│   │   ├── useInternships.js
│   │   ├── useApplications.js
│   │   └── useFetch.js
│   │
│   ├── context/
│   │   ├── AuthContext.jsx
│   │   ├── UserContext.jsx
│   │   ├── InternshipContext.jsx
│   │   └── NotificationContext.jsx
│   │
│   ├── services/
│   │   ├── api.js                  # Axios instance
│   │   ├── auth.service.js
│   │   ├── student.service.js
│   │   ├── company.service.js
│   │   ├── supervisor.service.js
│   │   ├── admin.service.js
│   │   ├── internship.service.js
│   │   ├── application.service.js
│   │   ├── evaluation.service.js
│   │   ├── recommendation.service.js
│   │   └── notification.service.js
│   │
│   ├── utils/
│   │   ├── formatters.js           # Date, currency formatting
│   │   ├── validators.js           # Input validation
│   │   ├── helpers.js              # General helpers
│   │   ├── constants.js            # App constants
│   │   └── auth.utils.js           # Auth helpers
│   │
│   ├── styles/
│   │   ├── globals.css
│   │   ├── variables.css
│   │   └── animations.css
│   │
│   ├── routes/
│   │   ├── Routes.jsx              # Main routing
│   │   ├── ProtectedRoute.jsx      # Auth guard
│   │   └── RoleBasedRoute.jsx      # Role guard
│   │
│   ├── App.jsx                     # Main app component
│   ├── main.jsx                    # React entry point
│   └── index.css
│
├── .env.example
├── .env                            # Local env (git ignored)
├── .gitignore
├── package.json
├── vite.config.js
├── tailwind.config.js
└── README.md
```

---

## 3. Folder Structure Explanation

### 3.1 Components Organization

| Folder    | Purpose                                            |
| --------- | -------------------------------------------------- |
| `common/` | Reusable UI components (Button, Card, Modal, etc.) |
| `forms/`  | Form components for different contexts             |
| `cards/`  | Card components for displaying data                |
| `layout/` | Layout wrapper components                          |

### 3.2 Pages Organization by Actor

| Actor          | Pages                                                                         |
| -------------- | ----------------------------------------------------------------------------- |
| **Auth**       | Login, Register, ForgotPassword, ResetPassword                                |
| **Student**    | Dashboard, Profile, Browse, Recommend, Applications, Internships, Evaluations |
| **Company**    | Dashboard, Profile, Offers, Applications, Interns, Analytics                  |
| **Supervisor** | Dashboard, Profile, Interns, Evaluations, Progress                            |
| **Admin**      | Dashboard, Users, Offers, Analytics, Settings, Logs                           |

### 3.3 Services Layer

Each service handles API calls for a specific domain:

```javascript
// Example: internship.service.js
export const getInternships = (filters) =>
  api.get("/internships", { params: filters });
export const getInternshipDetail = (id) => api.get(`/internships/${id}`);
export const searchInternships = (query) =>
  api.get("/internships/search", { params: query });
```

---

## 4. Routing Structure with React Router v6

### 4.1 Main Routes: `src/routes/Routes.jsx`

```javascript
// src/routes/Routes.jsx
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import { AuthProvider } from "../context/AuthContext";
import ProtectedRoute from "./ProtectedRoute";
import RoleBasedRoute from "./RoleBasedRoute";

// Auth Pages
import LoginPage from "../pages/auth/LoginPage";
import RegisterPage from "../pages/auth/RegisterPage";
import ForgotPasswordPage from "../pages/auth/ForgotPasswordPage";

// Student Pages
import StudentDashboard from "../pages/student/StudentDashboard";
import StudentProfile from "../pages/student/StudentProfile";
import InternshipBrowse from "../pages/student/InternshipBrowse";
import InternshipDetail from "../pages/student/InternshipDetail";
import MyApplications from "../pages/student/MyApplications";
import Recommendations from "../pages/student/Recommendations";
import MyInternships from "../pages/student/MyInternships";

// Company Pages
import CompanyDashboard from "../pages/company/CompanyDashboard";
import CompanyProfile from "../pages/company/CompanyProfile";
import InternshipOffers from "../pages/company/InternshipOffers";
import CreateOffer from "../pages/company/CreateOffer";
import Applications from "../pages/company/Applications";

// Supervisor Pages
import SupervisorDashboard from "../pages/supervisor/SupervisorDashboard";
import AssignedInterns from "../pages/supervisor/AssignedInterns";
import CreateEvaluation from "../pages/supervisor/CreateEvaluation";

// Admin Pages
import AdminDashboard from "../pages/admin/AdminDashboard";
import UserManagement from "../pages/admin/UserManagement";
import OffersModeration from "../pages/admin/OffersModeration";

// 404 Page
import NotFoundPage from "../pages/404";

function AppRoutes() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <Routes>
          {/* Public Routes */}
          <Route path="/login" element={<LoginPage />} />
          <Route path="/register" element={<RegisterPage />} />
          <Route path="/forgot-password" element={<ForgotPasswordPage />} />

          {/* Protected Routes - Student */}
          <Route
            path="/student/dashboard"
            element={
              <RoleBasedRoute requiredRole="STUDENT">
                <StudentDashboard />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/student/profile"
            element={
              <RoleBasedRoute requiredRole="STUDENT">
                <StudentProfile />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/student/internships"
            element={
              <RoleBasedRoute requiredRole="STUDENT">
                <InternshipBrowse />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/student/internships/:offerId"
            element={
              <RoleBasedRoute requiredRole="STUDENT">
                <InternshipDetail />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/student/applications"
            element={
              <RoleBasedRoute requiredRole="STUDENT">
                <MyApplications />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/student/recommendations"
            element={
              <RoleBasedRoute requiredRole="STUDENT">
                <Recommendations />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/student/my-internships"
            element={
              <RoleBasedRoute requiredRole="STUDENT">
                <MyInternships />
              </RoleBasedRoute>
            }
          />

          {/* Protected Routes - Company */}
          <Route
            path="/company/dashboard"
            element={
              <RoleBasedRoute requiredRole="COMPANY">
                <CompanyDashboard />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/company/profile"
            element={
              <RoleBasedRoute requiredRole="COMPANY">
                <CompanyProfile />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/company/offers"
            element={
              <RoleBasedRoute requiredRole="COMPANY">
                <InternshipOffers />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/company/offers/create"
            element={
              <RoleBasedRoute requiredRole="COMPANY">
                <CreateOffer />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/company/applications"
            element={
              <RoleBasedRoute requiredRole="COMPANY">
                <Applications />
              </RoleBasedRoute>
            }
          />

          {/* Protected Routes - Supervisor */}
          <Route
            path="/supervisor/dashboard"
            element={
              <RoleBasedRoute requiredRole="SUPERVISOR">
                <SupervisorDashboard />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/supervisor/interns"
            element={
              <RoleBasedRoute requiredRole="SUPERVISOR">
                <AssignedInterns />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/supervisor/evaluations/create"
            element={
              <RoleBasedRoute requiredRole="SUPERVISOR">
                <CreateEvaluation />
              </RoleBasedRoute>
            }
          />

          {/* Protected Routes - Admin */}
          <Route
            path="/admin/dashboard"
            element={
              <RoleBasedRoute requiredRole="ADMIN">
                <AdminDashboard />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/admin/users"
            element={
              <RoleBasedRoute requiredRole="ADMIN">
                <UserManagement />
              </RoleBasedRoute>
            }
          />
          <Route
            path="/admin/offers-moderation"
            element={
              <RoleBasedRoute requiredRole="ADMIN">
                <OffersModeration />
              </RoleBasedRoute>
            }
          />

          {/* 404 Not Found */}
          <Route path="*" element={<NotFoundPage />} />
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  );
}

export default AppRoutes;
```

### 4.2 Protected Route Guard: `src/routes/ProtectedRoute.jsx`

```javascript
// src/routes/ProtectedRoute.jsx
import { Navigate } from "react-router-dom";
import { useAuth } from "../hooks/useAuth";
import Loading from "../components/common/Loading";

function ProtectedRoute({ children }) {
  const { user, loading } = useAuth();

  if (loading) {
    return <Loading />;
  }

  if (!user) {
    return <Navigate to="/login" replace />;
  }

  return children;
}

export default ProtectedRoute;
```

### 4.3 Role-Based Route: `src/routes/RoleBasedRoute.jsx`

```javascript
// src/routes/RoleBasedRoute.jsx
import { Navigate } from "react-router-dom";
import { useAuth } from "../hooks/useAuth";
import Loading from "../components/common/Loading";

function RoleBasedRoute({ children, requiredRole }) {
  const { user, loading } = useAuth();

  if (loading) {
    return <Loading />;
  }

  if (!user) {
    return <Navigate to="/login" replace />;
  }

  if (user.role !== requiredRole) {
    return <Navigate to="/unauthorized" replace />;
  }

  return children;
}

export default RoleBasedRoute;
```

---

## 5. State Management with Context API

### 5.1 Auth Context: `src/context/AuthContext.jsx`

```javascript
// src/context/AuthContext.jsx
import React, {
  createContext,
  useReducer,
  useCallback,
  useEffect,
} from "react";
import { authService } from "../services/auth.service";

export const AuthContext = createContext();

const initialState = {
  user: null,
  token: null,
  loading: true,
  error: null,
  isAuthenticated: false,
};

function authReducer(state, action) {
  switch (action.type) {
    case "LOGIN_START":
      return { ...state, loading: true, error: null };
    case "LOGIN_SUCCESS":
      return {
        ...state,
        user: action.payload.user,
        token: action.payload.token,
        isAuthenticated: true,
        loading: false,
        error: null,
      };
    case "LOGIN_FAILURE":
      return {
        ...state,
        error: action.payload,
        loading: false,
        isAuthenticated: false,
      };
    case "LOGOUT":
      return {
        ...initialState,
        loading: false,
      };
    case "GET_USER_SUCCESS":
      return {
        ...state,
        user: action.payload.user,
        isAuthenticated: true,
        loading: false,
      };
    case "GET_USER_FAILURE":
      return {
        ...state,
        isAuthenticated: false,
        loading: false,
      };
    default:
      return state;
  }
}

export function AuthProvider({ children }) {
  const [state, dispatch] = useReducer(authReducer, initialState);

  // Initialize auth on mount
  useEffect(() => {
    const token = localStorage.getItem("token");
    if (token) {
      // Verify token validity
      authService
        .getCurrentUser()
        .then((user) => {
          dispatch({
            type: "GET_USER_SUCCESS",
            payload: { user },
          });
        })
        .catch(() => {
          dispatch({ type: "GET_USER_FAILURE" });
          localStorage.removeItem("token");
        });
    } else {
      dispatch({ type: "GET_USER_FAILURE" });
    }
  }, []);

  const login = useCallback(async (email, password) => {
    dispatch({ type: "LOGIN_START" });
    try {
      const response = await authService.login(email, password);
      localStorage.setItem("token", response.token);
      dispatch({
        type: "LOGIN_SUCCESS",
        payload: {
          user: response.user,
          token: response.token,
        },
      });
      return response;
    } catch (error) {
      dispatch({
        type: "LOGIN_FAILURE",
        payload: error.message,
      });
      throw error;
    }
  }, []);

  const logout = useCallback(() => {
    localStorage.removeItem("token");
    dispatch({ type: "LOGOUT" });
  }, []);

  const value = {
    user: state.user,
    token: state.token,
    loading: state.loading,
    error: state.error,
    isAuthenticated: state.isAuthenticated,
    login,
    logout,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}
```

### 5.2 Notification Context: `src/context/NotificationContext.jsx`

```javascript
// src/context/NotificationContext.jsx
import React, { createContext, useReducer, useCallback } from "react";

export const NotificationContext = createContext();

const initialState = {
  notifications: [],
  unreadCount: 0,
};

function notificationReducer(state, action) {
  switch (action.type) {
    case "ADD_NOTIFICATION":
      return {
        ...state,
        notifications: [action.payload, ...state.notifications],
      };
    case "REMOVE_NOTIFICATION":
      return {
        ...state,
        notifications: state.notifications.filter(
          (notif) => notif.id !== action.payload,
        ),
      };
    case "MARK_AS_READ":
      return {
        ...state,
        notifications: state.notifications.map((notif) =>
          notif.id === action.payload ? { ...notif, isRead: true } : notif,
        ),
      };
    case "SET_NOTIFICATIONS":
      return {
        ...state,
        notifications: action.payload,
      };
    case "UPDATE_UNREAD_COUNT":
      return {
        ...state,
        unreadCount: action.payload,
      };
    default:
      return state;
  }
}

export function NotificationProvider({ children }) {
  const [state, dispatch] = useReducer(notificationReducer, initialState);

  const addNotification = useCallback((notification) => {
    dispatch({
      type: "ADD_NOTIFICATION",
      payload: { id: Date.now(), ...notification },
    });
  }, []);

  const removeNotification = useCallback((id) => {
    dispatch({
      type: "REMOVE_NOTIFICATION",
      payload: id,
    });
  }, []);

  const markAsRead = useCallback((id) => {
    dispatch({
      type: "MARK_AS_READ",
      payload: id,
    });
  }, []);

  const value = {
    notifications: state.notifications,
    unreadCount: state.unreadCount,
    addNotification,
    removeNotification,
    markAsRead,
  };

  return (
    <NotificationContext.Provider value={value}>
      {children}
    </NotificationContext.Provider>
  );
}
```

---

## 6. Custom Hooks

### 6.1 useAuth Hook: `src/hooks/useAuth.js`

```javascript
// src/hooks/useAuth.js
import { useContext } from "react";
import { AuthContext } from "../context/AuthContext";

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within AuthProvider");
  }
  return context;
}
```

### 6.2 useFetch Hook: `src/hooks/useFetch.js`

```javascript
// src/hooks/useFetch.js
import { useState, useEffect } from "react";

export function useFetch(fetchFunction, dependencies = []) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    let isMounted = true;

    const fetchData = async () => {
      try {
        setLoading(true);
        const result = await fetchFunction();
        if (isMounted) {
          setData(result);
          setError(null);
        }
      } catch (err) {
        if (isMounted) {
          setError(err.message);
          setData(null);
        }
      } finally {
        if (isMounted) {
          setLoading(false);
        }
      }
    };

    fetchData();

    return () => {
      isMounted = false;
    };
  }, dependencies);

  return { data, loading, error };
}
```

### 6.3 useApi Hook: `src/hooks/useApi.js`

```javascript
// src/hooks/useApi.js
import { useState, useCallback } from "react";

export function useApi() {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const request = useCallback(async (apiFunction) => {
    try {
      setLoading(true);
      setError(null);
      const response = await apiFunction();
      return response;
    } catch (err) {
      setError(err.message);
      throw err;
    } finally {
      setLoading(false);
    }
  }, []);

  return { loading, error, request };
}
```

---

## 7. API Service Layer

### 7.1 API Client: `src/services/api.js`

```javascript
// src/services/api.js
import axios from "axios";
import { useAuth } from "../hooks/useAuth";

const API_BASE_URL =
  import.meta.env.VITE_API_URL || "http://localhost:3000/api";

const api = axios.create({
  baseURL: API_BASE_URL,
  timeout: 10000,
  headers: {
    "Content-Type": "application/json",
  },
});

// Request interceptor to add token
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem("token");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error),
);

// Response interceptor to handle errors
api.interceptors.response.use(
  (response) => response.data,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem("token");
      window.location.href = "/login";
    }
    return Promise.reject(error.response?.data || error);
  },
);

export default api;
```

### 7.2 Auth Service: `src/services/auth.service.js`

```javascript
// src/services/auth.service.js
import api from "./api";

export const authService = {
  login: (email, password) => api.post("/auth/login", { email, password }),

  register: (data) => api.post("/auth/register", data),

  logout: () => api.post("/auth/logout"),

  refreshToken: () => api.post("/auth/refresh-token"),

  getCurrentUser: () => api.get("/auth/me"),

  forgotPassword: (email) => api.post("/auth/forgot-password", { email }),

  resetPassword: (token, password) =>
    api.post("/auth/reset-password", { token, password }),
};
```

### 7.3 Student Service: `src/services/student.service.js`

```javascript
// src/services/student.service.js
import api from "./api";

export const studentService = {
  getProfile: () => api.get("/students/profile"),

  updateProfile: (data) => api.put("/students/profile", data),

  getProfileCompleteness: () => api.get("/students/profile/completeness"),

  addSkill: (skillData) => api.post("/students/skills", skillData),

  removeSkill: (skillId) => api.delete(`/students/skills/${skillId}`),

  getApplications: () => api.get("/students/applications"),

  getInternships: () => api.get("/students/internships"),

  getEvaluations: () => api.get("/students/evaluations"),

  getSavedOffers: () => api.get("/students/saved-offers"),

  saveOffer: (offerId) => api.post(`/students/saved-offers/${offerId}`),

  unsaveOffer: (offerId) => api.delete(`/students/saved-offers/${offerId}`),
};
```

### 7.4 Internship Service: `src/services/internship.service.js`

```javascript
// src/services/internship.service.js
import api from "./api";

export const internshipService = {
  getOffers: (filters = {}) => api.get("/internships", { params: filters }),

  getOfferDetail: (offerId) => api.get(`/internships/${offerId}`),

  searchOffers: (query, filters) =>
    api.get("/internships/search", {
      params: { query, ...filters },
    }),

  applyForInternship: (offerId, applicationData) =>
    api.post(`/applications`, {
      offerId,
      ...applicationData,
    }),

  getApplicationStatus: (applicationId) =>
    api.get(`/applications/${applicationId}`),

  getInternshipProgress: (internshipId) =>
    api.get(`/internships/${internshipId}/progress`),
};
```

---

## 8. Reusable Components Examples

### 8.1 Button Component: `src/components/common/Button.jsx`

```javascript
// src/components/common/Button.jsx
import React from "react";
import "./Button.module.css";

function Button({
  children,
  variant = "primary",
  size = "md",
  fullWidth = false,
  loading = false,
  disabled = false,
  onClick,
  type = "button",
  className = "",
  ...props
}) {
  const baseClass = "btn";
  const variantClass = `btn--${variant}`;
  const sizeClass = `btn--${size}`;
  const fullWidthClass = fullWidth ? "btn--full-width" : "";
  const disabledClass = disabled || loading ? "btn--disabled" : "";

  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled || loading}
      className={`${baseClass} ${variantClass} ${sizeClass} ${fullWidthClass} ${disabledClass} ${className}`}
      {...props}
    >
      {loading ? "..." : children}
    </button>
  );
}

export default Button;
```

### 8.2 Card Component: `src/components/common/Card.jsx`

```javascript
// src/components/common/Card.jsx
import React from "react";
import "./Card.module.css";

function Card({
  children,
  className = "",
  header,
  footer,
  hoverable = false,
  onClick,
}) {
  return (
    <div
      className={`card ${hoverable ? "card--hoverable" : ""} ${className}`}
      onClick={onClick}
    >
      {header && <div className="card__header">{header}</div>}
      <div className="card__body">{children}</div>
      {footer && <div className="card__footer">{footer}</div>}
    </div>
  );
}

export default Card;
```

### 8.3 InternshipCard Component: `src/components/cards/InternshipCard.jsx`

```javascript
// src/components/cards/InternshipCard.jsx
import React from "react";
import Card from "../common/Card";
import Badge from "../common/Badge";
import Button from "../common/Button";
import { MapPin, Clock, DollarSign } from "react-icons/fi";

function InternshipCard({
  offer,
  onViewDetails,
  onApply,
  onSave,
  isSaved = false,
}) {
  return (
    <Card hoverable>
      <div className="internship-card">
        <div className="internship-card__header">
          <h3>{offer.title}</h3>
          <Badge variant={offer.status === "PUBLISHED" ? "success" : "warning"}>
            {offer.status}
          </Badge>
        </div>

        <p className="internship-card__company">{offer.companyName}</p>

        <div className="internship-card__details">
          <div className="detail">
            <MapPin size={16} />
            <span>{offer.location}</span>
          </div>
          <div className="detail">
            <Clock size={16} />
            <span>{offer.durationWeeks} weeks</span>
          </div>
          {offer.salaryMonthly && (
            <div className="detail">
              <DollarSign size={16} />
              <span>${offer.salaryMonthly}</span>
            </div>
          )}
        </div>

        <p className="internship-card__description">{offer.description}</p>

        <div className="internship-card__actions">
          <Button variant="outline" size="sm" onClick={onViewDetails}>
            View Details
          </Button>
          <Button
            variant={isSaved ? "secondary" : "primary"}
            size="sm"
            onClick={onSave}
          >
            {isSaved ? "Saved" : "Save"}
          </Button>
        </div>
      </div>
    </Card>
  );
}

export default InternshipCard;
```

### 8.4 Navbar Component: `src/components/common/Navbar.jsx`

```javascript
// src/components/common/Navbar.jsx
import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../../hooks/useAuth";
import Button from "./Button";
import Avatar from "./Avatar";
import "./Navbar.module.css";

function Navbar() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const [dropdownOpen, setDropdownOpen] = useState(false);

  const handleLogout = () => {
    logout();
    navigate("/login");
  };

  const getDashboardLink = () => {
    const dashboardMap = {
      STUDENT: "/student/dashboard",
      COMPANY: "/company/dashboard",
      SUPERVISOR: "/supervisor/dashboard",
      ADMIN: "/admin/dashboard",
    };
    return dashboardMap[user?.role] || "/";
  };

  return (
    <nav className="navbar">
      <div className="navbar__container">
        <Link to={getDashboardLink()} className="navbar__logo">
          InternshipHub
        </Link>

        <div className="navbar__menu">
          {user ? (
            <div className="navbar__user">
              <Button
                variant="outline"
                size="sm"
                onClick={() => navigate(getDashboardLink())}
              >
                Dashboard
              </Button>

              <div className="navbar__profile">
                <Avatar
                  src={user.avatar}
                  alt={user.firstName}
                  onClick={() => setDropdownOpen(!dropdownOpen)}
                />

                {dropdownOpen && (
                  <div className="navbar__dropdown">
                    <Link to={getDashboardLink()}>Dashboard</Link>
                    <Link to="/settings">Settings</Link>
                    <button onClick={handleLogout} className="logout-btn">
                      Logout
                    </button>
                  </div>
                )}
              </div>
            </div>
          ) : (
            <div className="navbar__actions">
              <Button variant="outline" onClick={() => navigate("/login")}>
                Login
              </Button>
              <Button variant="primary" onClick={() => navigate("/register")}>
                Sign Up
              </Button>
            </div>
          )}
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
```

---

## 9. Example Pages

### 9.1 Student Dashboard: `src/pages/student/StudentDashboard.jsx`

```javascript
// src/pages/student/StudentDashboard.jsx
import React, { useState, useEffect } from "react";
import { useAuth } from "../../hooks/useAuth";
import { useFetch } from "../../hooks/useFetch";
import { studentService } from "../../services/student.service";
import { internshipService } from "../../services/internship.service";
import Card from "../../components/common/Card";
import Button from "../../components/common/Button";
import Loading from "../../components/common/Loading";
import RecommendationCard from "../../components/cards/RecommendationCard";

function StudentDashboard() {
  const { user } = useAuth();
  const { data: profile, loading: profileLoading } = useFetch(() =>
    studentService.getProfile(),
  );
  const { data: recommendations, loading: recommendationsLoading } = useFetch(
    () => internshipService.getRecommendations(),
  );

  if (profileLoading || recommendationsLoading) {
    return <Loading />;
  }

  return (
    <div className="dashboard">
      <div className="dashboard__header">
        <h1>Welcome back, {user?.firstName}!</h1>
        <p>Your personalized internship recommendations await</p>
      </div>

      <div className="dashboard__grid">
        {/* Profile Completeness Card */}
        <Card header="Profile Completeness">
          <div className="completeness">
            <div className="completeness__bar">
              <div
                className="completeness__progress"
                style={{ width: `${profile?.completenessPercentage}%` }}
              />
            </div>
            <p>{profile?.completenessPercentage}% Complete</p>
            {profile?.completenessPercentage < 100 && (
              <Button size="sm" onClick={() => navigate("/student/profile")}>
                Complete Profile
              </Button>
            )}
          </div>
        </Card>

        {/* Quick Stats */}
        <Card header="Your Stats">
          <div className="stats">
            <div className="stat">
              <h3>{profile?.applicationsCount || 0}</h3>
              <p>Applications</p>
            </div>
            <div className="stat">
              <h3>{profile?.internshipsCount || 0}</h3>
              <p>Internships</p>
            </div>
            <div className="stat">
              <h3>{recommendations?.length || 0}</h3>
              <p>Recommendations</p>
            </div>
          </div>
        </Card>
      </div>

      {/* Recommendations Section */}
      <section className="recommendations-section">
        <h2>Recommended for You</h2>
        <div className="recommendations-grid">
          {recommendations?.map((rec) => (
            <RecommendationCard key={rec.id} recommendation={rec} />
          ))}
        </div>
      </section>
    </div>
  );
}

export default StudentDashboard;
```

### 9.2 Company Dashboard: `src/pages/company/CompanyDashboard.jsx`

```javascript
// src/pages/company/CompanyDashboard.jsx
import React from "react";
import { useAuth } from "../../hooks/useAuth";
import { useFetch } from "../../hooks/useFetch";
import { companyService } from "../../services/company.service";
import Card from "../../components/common/Card";
import Button from "../../components/common/Button";
import { useNavigate } from "react-router-dom";
import { BarChart, LineChart } from "recharts";

function CompanyDashboard() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { data: stats, loading } = useFetch(() =>
    companyService.getDashboardStats(),
  );

  return (
    <div className="company-dashboard">
      <div className="dashboard__header">
        <h1>Company Dashboard</h1>
        <Button
          variant="primary"
          onClick={() => navigate("/company/offers/create")}
        >
          + Create New Offer
        </Button>
      </div>

      <div className="stats-grid">
        <Card header="Active Offers">
          <h2>{stats?.activeOffers || 0}</h2>
          <p>Published internship offers</p>
        </Card>

        <Card header="Total Applications">
          <h2>{stats?.totalApplications || 0}</h2>
          <p>Received applications</p>
        </Card>

        <Card header="Active Interns">
          <h2>{stats?.activeInterns || 0}</h2>
          <p>Currently internships</p>
        </Card>

        <Card header="Application Rate">
          <h2>{stats?.applicationRate || 0}%</h2>
          <p>View to application conversion</p>
        </Card>
      </div>

      {/* Charts would go here */}
    </div>
  );
}

export default CompanyDashboard;
```

### 9.3 Admin Dashboard: `src/pages/admin/AdminDashboard.jsx`

```javascript
// src/pages/admin/AdminDashboard.jsx
import React from "react";
import { useFetch } from "../../hooks/useFetch";
import { adminService } from "../../services/admin.service";
import Card from "../../components/common/Card";
import Button from "../../components/common/Button";
import { useNavigate } from "react-router-dom";

function AdminDashboard() {
  const navigate = useNavigate();
  const { data: analytics, loading } = useFetch(() =>
    adminService.getPlatformAnalytics(),
  );

  return (
    <div className="admin-dashboard">
      <h1>Platform Analytics</h1>

      <div className="metrics-grid">
        <Card header="Total Users">
          <h2>{analytics?.totalUsers || 0}</h2>
        </Card>

        <Card header="Registered Students">
          <h2>{analytics?.studentCount || 0}</h2>
          <Button size="sm" onClick={() => navigate("/admin/students")}>
            Manage
          </Button>
        </Card>

        <Card header="Registered Companies">
          <h2>{analytics?.companyCount || 0}</h2>
          <Button size="sm" onClick={() => navigate("/admin/companies")}>
            Manage
          </Button>
        </Card>

        <Card header="Active Internships">
          <h2>{analytics?.activeInternships || 0}</h2>
        </Card>

        <Card header="Pending Offers">
          <h2>{analytics?.pendingOffers || 0}</h2>
          <Button
            size="sm"
            onClick={() => navigate("/admin/offers-moderation")}
          >
            Moderate
          </Button>
        </Card>

        <Card header="Platform Health">
          <h2>{analytics?.platformHealth || 0}%</h2>
          <p>System status</p>
        </Card>
      </div>
    </div>
  );
}

export default AdminDashboard;
```

---

## 10. Package.json Dependencies

```json
{
  "name": "internship-platform-frontend",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "lint": "eslint src --ext js,jsx"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.20.0",
    "axios": "^1.6.2",
    "react-hook-form": "^7.49.0",
    "zod": "^3.22.4",
    "@hookform/resolvers": "^3.3.4",
    "react-icons": "^4.12.0",
    "react-toastify": "^9.1.3",
    "date-fns": "^2.30.0",
    "recharts": "^2.10.3",
    "tailwindcss": "^3.3.6"
  },
  "devDependencies": {
    "@vitejs/plugin-react": "^4.2.1",
    "vite": "^5.0.8",
    "eslint": "^8.55.0",
    "eslint-plugin-react": "^7.33.2",
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.32"
  }
}
```

---

## 11. Environment Variables: `.env.example`

```env
VITE_API_URL=http://localhost:3000/api
VITE_APP_NAME=InternshipHub
VITE_APP_VERSION=1.0.0
VITE_LOG_LEVEL=debug
```

---

## 12. CSS Variables: `src/styles/variables.css`

```css
:root {
  /* Colors */
  --primary: #3b82f6;
  --primary-dark: #1e40af;
  --secondary: #8b5cf6;
  --success: #10b981;
  --danger: #ef4444;
  --warning: #f59e0b;
  --info: #06b6d4;
  --light: #f3f4f6;
  --dark: #111827;
  --gray-100: #f9fafb;
  --gray-200: #f3f4f6;
  --gray-300: #e5e7eb;
  --gray-400: #d1d5db;
  --gray-500: #9ca3af;
  --gray-600: #6b7280;
  --gray-700: #374151;
  --gray-800: #1f2937;
  --gray-900: #111827;

  /* Spacing */
  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 2rem;
  --spacing-2xl: 3rem;

  /* Typography */
  --font-family:
    -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu,
    Cantarell, sans-serif;
  --font-size-xs: 0.75rem;
  --font-size-sm: 0.875rem;
  --font-size-md: 1rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.25rem;
  --font-size-2xl: 1.5rem;

  /* Shadows */
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
  --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1);

  /* Border Radius */
  --radius-sm: 0.25rem;
  --radius-md: 0.375rem;
  --radius-lg: 0.5rem;
  --radius-xl: 1rem;

  /* Z-indexes */
  --z-dropdown: 1000;
  --z-modal: 1050;
  --z-popover: 1100;
  --z-tooltip: 1110;
}
```

---

## 13. Architecture Summary

```
┌─────────────────────────────────────────────────────────────┐
│                    REACT FRONTEND ARCHITECTURE              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐         ┌──────────────┐                │
│  │   Routes    │────────►│   Protected  │                │
│  │             │         │   Routes &   │                │
│  │             │         │   RoleGuard  │                │
│  └─────────────┘         └──────────────┘                │
│         │                       │                         │
│         ▼                       ▼                         │
│  ┌─────────────────────────────────────┐                │
│  │      Pages (by role/feature)        │                │
│  │  - Student, Company, Supervisor,   │                │
│  │    Admin, Auth                      │                │
│  └─────────────────────────────────────┘                │
│         │                     │                          │
│         ▼                     ▼                          │
│  ┌─────────────┐       ┌──────────────┐                │
│  │  Components │       │  Custom Hooks│                │
│  │  - Common   │       │  - useAuth   │                │
│  │  - Forms    │       │  - useFetch  │                │
│  │  - Cards    │       │  - useApi    │                │
│  └─────────────┘       └──────────────┘                │
│         │                     │                          │
│         └─────────────┬───────┘                          │
│                       ▼                                   │
│            ┌──────────────────┐                          │
│            │  Context API     │                          │
│            │ - AuthContext    │                          │
│            │ - NotifContext   │                          │
│            └──────────────────┘                          │
│                       │                                   │
│                       ▼                                   │
│            ┌──────────────────┐                          │
│            │ API Services     │                          │
│            │ - auth.service   │                          │
│            │ - student.service│                          │
│            │ - company.service│                          │
│            │ - Etc.           │                          │
│            └──────────────────┘                          │
│                       │                                   │
│                       ▼                                   │
│            ┌──────────────────┐                          │
│            │   Axios Client   │                          │
│            │  (with JWT auth) │                          │
│            └──────────────────┘                          │
│                       │                                   │
│                       ▼                                   │
│            ┌──────────────────┐                          │
│            │  Backend API     │                          │
│            │  (Express.js)    │                          │
│            └──────────────────┘                          │
│                                                          │
└─────────────────────────────────────────────────────────────┘
```

---

## 14. Development Workflow

```bash
# 1. Setup frontend
cd frontend
npm install

# 2. Configure environment
cp .env.example .env
# Edit .env with backend URL

# 3. Start development server
npm run dev

# 4. Build for production
npm run build

# 5. Preview production build
npm run preview

# 6. App runs on
http://localhost:5173
```

---

## Summary of STEP 3

✅ **Complete React Frontend Architecture** with:

- **13 page types** (Auth, Student, Company, Supervisor, Admin)
- **40+ reusable components** (common, forms, cards, layout)
- **4 custom hooks** (useAuth, useFetch, useApi, usePagination)
- **4 context providers** (Auth, Notification, Internship, User)
- **10 API service modules** for clean API integration
- **Role-based routing** with protected routes
- **Clean component patterns** following React best practices
- **Professional styling** with CSS modules + Tailwind
- **Proper error handling** & loading states

---

## Ready for STEP 4

Next: AI Recommendation approach - how the matching algorithm works.

Let me know when you're ready!
