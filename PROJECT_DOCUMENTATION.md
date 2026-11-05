# Smart Internship Management and Recommendation Platform

## 📋 Complete Project Documentation

### Overview

A full-stack web application designed to manage internship offers, applications, and recommendations. The platform connects three main actors:

- **Students**: Browse and apply for internship offers
- **Companies**: Post internship offers and review applications
- **Supervisors**: Evaluate interns during their internship

With an integrated AI recommendation engine powered by Python.

---

## 🏗️ Project Architecture

### Frontend (React 18)

- **Framework**: React 18 with Vite bundler
- **Routing**: React Router v6
- **State Management**: Context API + useReducer
- **HTTP Client**: Axios with JWT interceptors
- **Styling**: Tailwind CSS
- **Form Handling**: React Hook Form + Zod validation
- **Location**: `/frontend`

### Backend (Express.js)

- **Framework**: Express.js (Node.js)
- **Database**: MySQL with connection pooling
- **Authentication**: JWT (7-day expiry)
- **Authorization**: Role-based access control (RBAC)
- **Logging**: Winston with file rotation
- **Validation**: Joi schemas
- **Security**: Helmet, CORS
- **Location**: `/backend`

### Python AI Service

- **Future Integration**: Machine learning recommendation engine
- **Port**: 5000
- **Usage**: Called from Node.js backend for recommendation scoring
- **Location**: `/ai-service` (to be created)

---

## 📁 Project Structure

```
Oussama-boukhrisse/
├── frontend/                      # React frontend application
│   ├── src/
│   │   ├── main.jsx              # React DOM mount
│   │   ├── App.jsx               # Main routes and provider setup
│   │   ├── services/             # API service classes (11 services)
│   │   ├── contexts/             # Context providers (4 providers)
│   │   ├── hooks/                # Custom React hooks (6 hooks)
│   │   ├── components/           # Reusable React components (28 components)
│   │   ├── pages/                # Page components (14 pages)
│   │   ├── utils/                # Utility functions (7 utilities)
│   │   └── routes/               # Route configurations
│   ├── public/                    # Static assets
│   ├── index.html                 # HTML entry point
│   ├── package.json               # Dependencies
│   ├── vite.config.js             # Vite configuration
│   ├── tailwind.config.js         # Tailwind CSS config
│   └── README.md                  # Frontend documentation
│
├── backend/                       # Express.js backend API
│   ├── config/                    # Configuration files
│   │   ├── environment.js         # Environment variables
│   │   ├── database.js            # MySQL connection pool
│   │   └── constants.js           # App constants and enums
│   ├── src/
│   │   ├── app.js                 # Express app setup
│   │   ├── middleware/            # Express middleware (5 files)
│   │   │   ├── auth.js            # JWT authentication
│   │   │   ├── errorHandler.js    # Global error handler
│   │   │   ├── logger.js          # Winston logger
│   │   │   ├── validation.js      # Joi validation
│   │   │   └── corsConfig.js      # CORS configuration
│   │   ├── controllers/           # HTTP request handlers (10 controllers)
│   │   ├── services/              # Business logic (11 services)
│   │   ├── routes/                # API endpoints (11 routes)
│   │   ├── models/                # Database models (11 models)
│   │   ├── exceptions/            # Custom error classes (4 classes)
│   │   └── utils/                 # Utilities (5 files)
│   ├── scripts/                   # Database setup scripts
│   │   ├── migrations.js          # Create database tables
│   │   └── seedDatabase.js        # Seed sample data
│   ├── tests/                     # Test files
│   │   ├── unit/                  # Unit tests
│   │   └── integration/           # Integration tests
│   ├── logs/                      # Application logs
│   ├── server.js                  # Main entry point
│   ├── package.json               # Dependencies
│   ├── .env.example               # Environment variables template
│   └── README.md                  # Backend documentation
│
└── ai-service/                    # Python ML recommendation engine (to be created)
    ├── models/                    # ML models
    ├── services/                  # AI services
    ├── app.py                     # Flask API
    └── requirements.txt           # Python dependencies
```

---

## 🗄️ Database Schema (MySQL)

### Core Tables

**users**

- Stores all user accounts (students, companies, supervisors, admins)
- Fields: id, email, passwordHash, firstName, lastName, role, timestamps

**students**

- Profile info for student users
- Fields: id, userId (FK), bio, gpa, university

**companies**

- Profile info for company users
- Fields: id, userId (FK), name, industry, location, description

**supervisors**

- Profile info for supervisor users
- Fields: id, userId (FK), department, specialization

**internship_offers**

- Internship opportunities posted by companies
- Fields: id, companyId (FK), title, description, location, salary, duration, requirements, status

**applications**

- Student applications to internship offers
- Fields: id, studentId (FK), offerId (FK), coverLetter, attachments, status, appliedDate

**internships**

- Active internships for students with supervisor
- Fields: id, studentId (FK), offerId (FK), supervisorId (FK), startDate, endDate, status

**evaluations**

- Supervisor evaluations of interns (5-point scale)
- Fields: id, internshipId (FK), supervisorId (FK), technicalSkills, communication, teamwork, timeManagement, comments

**recommendations**

- AI-generated recommendations for students
- Fields: id, studentId (FK), offerId (FK), matchScore, reason, generatedAt

**notifications**

- System notifications for users
- Fields: id, userId (FK), title, message, type, isRead, createdAt

**skills**

- Student skillsets
- Fields: id, studentId (FK), skillName, proficiency

**activity_logs**

- Audit trail for admin operations
- Fields: id, userId (FK), action, description, ipAddress, createdAt

---

## 🔌 API Endpoints

### Authentication (/api/auth/)

```
POST   /register          - Register new user
POST   /login             - User login
POST   /logout            - User logout
GET    /me                - Get current user
```

### Students (/api/students/)

```
GET    /profile           - Get student profile
PUT    /profile           - Update student profile
GET    /applications      - Get my applications
GET    /internships       - Get my active internships
GET    /saved-offers      - Get saved offers
```

### Companies (/api/companies/)

```
GET    /profile           - Get company profile
PUT    /profile           - Update company profile
POST   /offers            - Create internship offer
GET    /offers            - Get company offers
GET    /applications      - Get applications for company offers
```

### Supervisors (/api/supervisors/)

```
GET    /profile           - Get supervisor profile
GET    /interns           - Get assigned interns
POST   /evaluations       - Create evaluation
GET    /evaluations       - Get my evaluations
```

### Internships (/api/internships/)

```
GET    /offers            - Get all offers (paginated)
GET    /offers/:offerId   - Get offer details
GET    /search            - Search offers with filters
```

### Applications (/api/applications/)

```
POST   /                  - Submit application
GET    /                  - Get applications
GET    /:applicationId    - Get application details
PATCH  /:applicationId/status - Update status
DELETE /:applicationId    - Withdraw application
```

### Evaluations (/api/evaluations/)

```
POST   /                  - Create evaluation
GET    /:evaluationId     - Get evaluation details
PUT    /:evaluationId     - Update evaluation
```

### Recommendations (/api/recommendations/)

```
GET    /                  - Get recommendations
POST   /:id/save          - Save recommendation
```

### Notifications (/api/notifications/)

```
GET    /                  - Get notifications
PATCH  /:id/read          - Mark as read
DELETE /:id               - Delete notification
```

### Admin (/api/admin/)

```
GET    /users             - Get all users
GET    /users/:userId     - Get user details
GET    /statistics        - Get system statistics
GET    /activity-logs     - Get activity logs
```

---

## 🚀 Getting Started

### Prerequisites

- Node.js 16+ and npm
- MySQL 8.0+
- Python 3.8+ (for AI service)
- Git

### Quick Setup

#### 1. Backend Setup

```bash
cd backend
npm install
cp .env.example .env
# Edit .env with your database credentials
npm run migrate      # Create database tables
npm run seed         # Add sample data
npm run dev          # Start development server
```

#### 2. Frontend Setup

```bash
cd frontend
npm install
npm run dev          # Start development server
```

#### 3. Access the Application

- Frontend: http://localhost:5173
- Backend API: http://localhost:3000
- API Docs: http://localhost:3000/api/health

---

## 🔐 Authentication Flow

1. **User Registration**
   - Email uniqueness check
   - Password hashing with bcryptjs
   - JWT token generation

2. **User Login**
   - Email + password verification
   - JWT token issued (7-day expiry)
   - Token stored in browser localStorage

3. **Protected Requests**
   - JWT automatically included in Authorization header (Axios interceptor)
   - Backend validates token and extracts user info
   - Role-based access control applied

4. **Token Validation**
   - Invalid/expired tokens trigger 401 response
   - Frontend redirects to login page
   - User can request token refresh

---

## 🛠️ Technology Stack Summary

| Component     | Technology      | Version |
| ------------- | --------------- | ------- |
| Frontend      | React           | 18.x    |
| Build Tool    | Vite            | 4.x     |
| Styling       | Tailwind CSS    | 3.x     |
| Routing       | React Router    | 6.x     |
| Form Library  | React Hook Form | 7.x     |
| Validation    | Zod             | 3.x     |
| HTTP Client   | Axios           | 1.x     |
| Backend       | Express.js      | 4.x     |
| Database      | MySQL           | 8.0+    |
| Auth          | JWT             | Node    |
| Password Hash | bcryptjs        | 2.x     |
| Logging       | Winston         | 3.x     |
| Validation    | Joi             | 17.x    |
| Security      | Helmet          | 7.x     |
| CORS          | cors            | 2.x     |

---

## 📊 File Counts

- **Frontend**: 89 files (React components, services, hooks, pages, utilities)
- **Backend**: 50+ files (controllers, services, routes, models, middleware, config)
- **Total**: 139+ files

---

## 🔄 Development Workflow

### Running Both Servers

```bash
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend
cd frontend
npm run dev

# Terminal 3 (Optional) - Monitor database
mysql -u root -p internship_db
```

### Making Changes

1. **Frontend**: Changes hot-reload via Vite
2. **Backend**: Changes trigger restart via nodemon
3. **Database**: Use migration scripts for schema changes

---

## 🧪 Testing

### Backend Tests

```bash
cd backend
npm test                # Run all tests
npm run test:watch     # Watch mode
```

### Frontend Tests

```bash
cd frontend
npm test               # Run tests
npm run test:watch    # Watch mode
```

---

## 📝 Environment Variables

### Backend (.env)

```
PORT=3000
NODE_ENV=development
DB_HOST=localhost
DB_NAME=internship_db
JWT_SECRET=your-secret-key
FRONTEND_URL=http://localhost:5173
SMTP_HOST=smtp.gmail.com
LOG_LEVEL=info
```

### Frontend (.env)

```
VITE_API_URL=http://localhost:3000
VITE_APP_NAME=Internship Platform
```

---

## 🐛 Troubleshooting

### Backend won't start

- Check MySQL is running: `mysql -u root -p`
- Verify .env file exists with correct DB credentials
- Check logs in `logs/app.log`

### Frontend can't connect to API

- Ensure backend is running on port 3000
- Check CORS is enabled in backend
- Review browser console for errors

### Database connection issues

- Verify MySQL service is running
- Check DB credentials in .env
- Run migrations: `npm run migrate`

---

## 📞 Support

For issues or questions:

1. Check existing issue tracker
2. Review logs in `logs/` directory
3. Check documentation in each component's README

---

## 📄 License

MIT License - see LICENSE file for details
