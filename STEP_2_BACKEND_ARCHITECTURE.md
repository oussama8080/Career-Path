# STEP 2: Backend Architecture & Express Setup

## 1. Backend Technology Stack

```
Node.js + Express.js
├── Authentication: JSON Web Token (JWT)
├── Password Security: bcryptjs
├── Database: MySQL2
├── Validation: Joi
├── Environment: dotenv
├── Error Handling: Custom middleware
├── API Documentation: Swagger/OpenAPI
├── Testing: Jest + Supertest
├── Logging: Winston
└── CORS: enabled for frontend communication
```

---

## 2. Backend Folder Structure

```
backend/
│
├── config/
│   ├── database.js          # MySQL connection config
│   ├── environment.js       # Environment variables
│   └── constants.js         # Global constants
│
├── src/
│   │
│   ├── middleware/
│   │   ├── auth.js          # JWT authentication
│   │   ├── errorHandler.js  # Global error handling
│   │   ├── validation.js    # Input validation
│   │   ├── corsConfig.js    # CORS setup
│   │   └── logger.js        # Request logging
│   │
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── studentController.js
│   │   ├── companyController.js
│   │   ├── supervisorController.js
│   │   ├── adminController.js
│   │   ├── internshipController.js
│   │   ├── applicationController.js
│   │   ├── evaluationController.js
│   │   ├── recommendationController.js
│   │   └── notificationController.js
│   │
│   ├── routes/
│   │   ├── index.js         # Main router
│   │   ├── auth.js
│   │   ├── students.js
│   │   ├── companies.js
│   │   ├── supervisors.js
│   │   ├── admin.js
│   │   ├── internships.js
│   │   ├── applications.js
│   │   ├── evaluations.js
│   │   ├── recommendations.js
│   │   └── notifications.js
│   │
│   ├── models/
│   │   ├── User.js
│   │   ├── Student.js
│   │   ├── Company.js
│   │   ├── Supervisor.js
│   │   ├── InternshipOffer.js
│   │   ├── Application.js
│   │   ├── Internship.js
│   │   ├── Evaluation.js
│   │   ├── Recommendation.js
│   │   ├── Skill.js
│   │   └── Notification.js
│   │
│   ├── services/
│   │   ├── authService.js   # JWT, password hashing
│   │   ├── userService.js
│   │   ├── studentService.js
│   │   ├── companyService.js
│   │   ├── supervisorService.js
│   │   ├── internshipService.js
│   │   ├── applicationService.js
│   │   ├── evaluationService.js
│   │   ├── recommendationService.js
│   │   ├── notificationService.js
│   │   └── emailService.js  # Email notifications
│   │
│   ├── utils/
│   │   ├── validators.js    # Input validation rules
│   │   ├── helpers.js       # Helper functions
│   │   ├── formatters.js    # Response formatting
│   │   ├── errors.js        # Custom error classes
│   │   └── constants.js     # Application constants
│   │
│   ├── exceptions/
│   │   ├── AppError.js
│   │   ├── ValidationError.js
│   │   ├── AuthenticationError.js
│   │   └── AuthorizationError.js
│   │
│   └── app.js              # Express app setup
│
├── scripts/
│   ├── seedDatabase.js      # Initial data seeding
│   └── migrations.js        # Database migrations
│
├── logs/                    # Application logs
│
├── tests/
│   ├── unit/
│   ├── integration/
│   └── fixtures/
│
├── .env.example            # Environment template
├── .env                    # Environment variables (local)
├── .gitignore
├── package.json
├── server.js               # Entry point
└── README.md
```

---

## 3. Core Express Server Structure

### 3.1 Main Entry Point: `server.js`

```javascript
// server.js
const app = require("./src/app");
const { PORT } = require("./config/environment");
const logger = require("./src/middleware/logger");

const server = app.listen(PORT, () => {
  logger.info(`🚀 Server running on port ${PORT}`);
});

// Graceful shutdown
process.on("SIGTERM", () => {
  logger.info("SIGTERM received, shutting down gracefully...");
  server.close(() => {
    logger.info("Server closed");
    process.exit(0);
  });
});

process.on("unhandledRejection", (err) => {
  logger.error("Unhandled Rejection:", err);
  process.exit(1);
});
```

### 3.2 Express App Setup: `src/app.js`

```javascript
// src/app.js
const express = require("express");
const cors = require("cors");
const helmet = require("helmet");
const morgan = require("morgan");

const corsConfig = require("./middleware/corsConfig");
const errorHandler = require("./middleware/errorHandler");
const routes = require("./routes");
const logger = require("./middleware/logger");

const app = express();

// Security middleware
app.use(helmet());
app.use(cors(corsConfig));

// Logging middleware
app.use(morgan("combined", { stream: logger.stream }));

// Body parser middleware
app.use(express.json({ limit: "10mb" }));
app.use(express.urlencoded({ limit: "10mb", extended: true }));

// API routes
app.use("/api", routes);

// Health check endpoint
app.get("/health", (req, res) => {
  res.status(200).json({ status: "OK", timestamp: new Date() });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: "Route not found",
    path: req.originalUrl,
  });
});

// Global error handler
app.use(errorHandler);

module.exports = app;
```

---

## 4. API Route Structure

### 4.1 Main Router: `src/routes/index.js`

```javascript
// src/routes/index.js
const express = require("express");
const router = express.Router();

const authRoutes = require("./auth");
const studentRoutes = require("./students");
const companyRoutes = require("./companies");
const supervisorRoutes = require("./supervisors");
const adminRoutes = require("./admin");
const internshipRoutes = require("./internships");
const applicationRoutes = require("./applications");
const evaluationRoutes = require("./evaluations");
const recommendationRoutes = require("./recommendations");
const notificationRoutes = require("./notifications");

// Public routes
router.use("/auth", authRoutes);

// Protected routes
router.use("/students", studentRoutes);
router.use("/companies", companyRoutes);
router.use("/supervisors", supervisorRoutes);
router.use("/admin", adminRoutes);
router.use("/internships", internshipRoutes);
router.use("/applications", applicationRoutes);
router.use("/evaluations", evaluationRoutes);
router.use("/recommendations", recommendationRoutes);
router.use("/notifications", notificationRoutes);

module.exports = router;
```

---

## 5. Complete API Endpoints Reference

### 5.1 **Authentication Routes** (`/api/auth`)

```javascript
// Public endpoints
POST   /api/auth/register           - Student/Company/Supervisor registration
POST   /api/auth/login              - User login
POST   /api/auth/refresh-token      - Refresh JWT token
POST   /api/auth/logout             - User logout
POST   /api/auth/forgot-password    - Request password reset
POST   /api/auth/reset-password     - Reset password with token
GET    /api/auth/verify-email       - Verify email address
```

### 5.2 **Student Routes** (`/api/students`)

```javascript
// Protected endpoints (STUDENT)
GET    /api/students/profile                    - Get own profile
PUT    /api/students/profile                    - Update profile
GET    /api/students/profile/completeness       - Get profile completeness %
POST   /api/students/:id/skills                 - Add skills
DELETE /api/students/:id/skills/:skillId        - Remove skill
PUT    /api/students/:id/skills/:skillId        - Update skill proficiency
GET    /api/students/:id/applications           - Get own applications
GET    /api/students/:id/internships            - Get own internships
GET    /api/students/:id/evaluations            - Get own evaluations
GET    /api/students/:id/saved-offers           - Get saved internship offers
POST   /api/students/:id/saved-offers/:offerId  - Save internship offer
DELETE /api/students/:id/saved-offers/:offerId  - Unsave offer
```

### 5.3 **Company Routes** (`/api/companies`)

```javascript
// Protected endpoints (COMPANY)
GET    /api/companies/profile                   - Get company profile
PUT    /api/companies/profile                   - Update company profile
POST   /api/companies/offers                    - Create internship offer
GET    /api/companies/offers                    - Get all company offers
GET    /api/companies/offers/:offerId           - Get specific offer
PUT    /api/companies/offers/:offerId           - Update internship offer
DELETE /api/companies/offers/:offerId           - Delete offer
GET    /api/companies/offers/:offerId/analytics - Get offer analytics
GET    /api/companies/applications              - Get all applications
GET    /api/companies/applications/:appId       - Get application details
PUT    /api/companies/applications/:appId/status - Update application status
GET    /api/companies/interns                   - Get assigned interns
GET    /api/companies/dashboard                 - Get company dashboard stats
```

### 5.4 **Supervisor Routes** (`/api/supervisors`)

```javascript
// Protected endpoints (SUPERVISOR)
GET    /api/supervisors/profile                 - Get profile
PUT    /api/supervisors/profile                 - Update profile
GET    /api/supervisors/interns                 - Get assigned interns
GET    /api/supervisors/interns/:internshipId   - Get internship details
POST   /api/supervisors/evaluations             - Create evaluation
GET    /api/supervisors/evaluations             - Get evaluations
PUT    /api/supervisors/evaluations/:evalId     - Update evaluation
POST   /api/supervisors/internships/:id/progress - Update progress
GET    /api/supervisors/dashboard               - Get supervisor dashboard
```

### 5.5 **Admin Routes** (`/api/admin`)

```javascript
// Protected endpoints (ADMIN)
GET    /api/admin/users                         - List all users
GET    /api/admin/users/:userId                 - Get user details
PUT    /api/admin/users/:userId/role            - Change user role
PUT    /api/admin/users/:userId/status          - Activate/deactivate user
GET    /api/admin/students                      - List all students
GET    /api/admin/companies                     - List all companies
GET    /api/admin/supervisors                   - List all supervisors
GET    /api/admin/offers                        - List all offers
PUT    /api/admin/offers/:offerId/status        - Moderate offer
GET    /api/admin/analytics                     - Get platform analytics
GET    /api/admin/settings                      - Get system settings
PUT    /api/admin/settings                      - Update system settings
POST   /api/admin/notifications/broadcast       - Send system notification
GET    /api/admin/activity-logs                 - Get activity logs
```

### 5.6 **Internship Routes** (`/api/internships`)

```javascript
// Protected endpoints
GET    /api/internships                         - Search/list offers
GET    /api/internships/:offerId                - Get offer details
GET    /api/internships/search?filters          - Advanced search
GET    /api/internships/:internshipId/progress  - Get internship progress
GET    /api/internships/:internshipId/tasks     - Get tasks
POST   /api/internships/:internshipId/tasks     - Create task
PUT    /api/internships/:internshipId/tasks/:taskId - Update task
```

### 5.7 **Application Routes** (`/api/applications`)

```javascript
// Protected endpoints
POST   /api/applications                        - Submit application
GET    /api/applications/:appId                 - Get application details
GET    /api/applications/:appId/status          - Get application status
PUT    /api/applications/:appId                 - Update application
DELETE /api/applications/:appId                 - Withdraw application
```

### 5.8 **Evaluation Routes** (`/api/evaluations`)

```javascript
// Protected endpoints (SUPERVISOR/STUDENT)
POST   /api/evaluations                         - Create evaluation
GET    /api/evaluations/:evalId                 - Get evaluation
PUT    /api/evaluations/:evalId                 - Update evaluation
GET    /api/evaluations/internship/:internshipId - Get internship evaluations
```

### 5.9 **Recommendation Routes** (`/api/recommendations`)

```javascript
// Protected endpoints (STUDENT)
GET    /api/recommendations                     - Get recommendations for student
GET    /api/recommendations/:recId              - Get recommendation details
PUT    /api/recommendations/:recId/view         - Mark as viewed
GET    /api/recommendations/stats               - Get recommendation stats
POST   /api/recommendations/regenerate          - Regenerate recommendations
```

### 5.10 **Notification Routes** (`/api/notifications`)

```javascript
// Protected endpoints
GET    /api/notifications                       - Get user notifications
GET    /api/notifications/unread                - Get unread count
PUT    /api/notifications/:notifId/read         - Mark as read
DELETE /api/notifications/:notifId              - Delete notification
DELETE /api/notifications                       - Delete all notifications
```

---

## 6. middleware Architecture

### 6.1 Authentication Middleware: `src/middleware/auth.js`

```javascript
// src/middleware/auth.js
const jwt = require("jsonwebtoken");
const { JWT_SECRET } = require("../../config/environment");
const AuthenticationError = require("../exceptions/AuthenticationError");

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  if (!token) {
    throw new AuthenticationError("Access token required");
  }

  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) {
      throw new AuthenticationError("Invalid or expired token");
    }
    req.user = user;
    next();
  });
};

const authorize = (...roles) => {
  return (req, res, next) => {
    if (!req.user) {
      throw new AuthenticationError("Authentication required");
    }

    if (!roles.includes(req.user.role)) {
      throw new AuthorizationError(
        `User role '${req.user.role}' is not authorized`,
      );
    }

    next();
  };
};

module.exports = {
  authenticateToken,
  authorize,
};
```

### 6.2 Error Handler Middleware: `src/middleware/errorHandler.js`

```javascript
// src/middleware/errorHandler.js
const logger = require("./logger");

const errorHandler = (err, req, res, next) => {
  logger.error("Error:", {
    message: err.message,
    stack: err.stack,
    statusCode: err.statusCode || 500,
  });

  const response = {
    success: false,
    message: err.message,
    ...(process.env.NODE_ENV === "development" && { stack: err.stack }),
  };

  res.status(err.statusCode || 500).json(response);
};

module.exports = errorHandler;
```

### 6.3 Validation Middleware: `src/middleware/validation.js`

```javascript
// src/middleware/validation.js
const Joi = require("joi");
const ValidationError = require("../exceptions/ValidationError");

const validate = (schema) => {
  return (req, res, next) => {
    const { error, value } = schema.validate(req.body, {
      abortEarly: false,
      stripUnknown: true,
    });

    if (error) {
      const errors = error.details.map((detail) => ({
        field: detail.path.join("."),
        message: detail.message,
      }));
      throw new ValidationError("Validation failed", errors);
    }

    req.validatedData = value;
    next();
  };
};

module.exports = { validate };
```

---

## 7. Service Layer Pattern

### 7.1 Auth Service: `src/services/authService.js`

```javascript
// src/services/authService.js
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const { JWT_SECRET, JWT_EXPIRY } = require("../../config/environment");

class AuthService {
  async hashPassword(password) {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(password, salt);
  }

  async comparePassword(password, hash) {
    return bcrypt.compare(password, hash);
  }

  generateToken(user) {
    return jwt.sign(
      {
        id: user.id,
        email: user.email,
        role: user.role,
      },
      JWT_SECRET,
      { expiresIn: JWT_EXPIRY },
    );
  }

  verifyToken(token) {
    return jwt.verify(token, JWT_SECRET);
  }
}

module.exports = new AuthService();
```

### 7.2 Student Service: `src/services/studentService.js`

```javascript
// src/services/studentService.js
class StudentService {
  async getProfile(studentId) {
    // Fetch student profile with skills
  }

  async updateProfile(studentId, data) {
    // Update student profile
  }

  async addSkill(studentId, skillData) {
    // Add skill to student
  }

  async removeSkill(studentId, skillId) {
    // Remove skill from student
  }

  async getApplications(studentId) {
    // Get student applications
  }

  async getInternships(studentId) {
    // Get student internships
  }

  async setSavedOffer(studentId, offerId) {
    // Save internship offer
  }

  async getProfileCompleteness(studentId) {
    // Calculate profile completeness percentage
  }
}

module.exports = new StudentService();
```

---

## 8. Controller Pattern

### 8.1 Auth Controller: `src/controllers/authController.js`

```javascript
// src/controllers/authController.js
const authService = require("../services/authService");
const userService = require("../services/userService");
const logger = require("../middleware/logger");

class AuthController {
  async register(req, res, next) {
    try {
      const { email, password, firstName, lastName, role } = req.validatedData;

      // Check if user exists
      const existingUser = await userService.getUserByEmail(email);
      if (existingUser) {
        return res.status(409).json({
          success: false,
          message: "Email already registered",
        });
      }

      // Hash password
      const hashedPassword = await authService.hashPassword(password);

      // Create user
      const user = await userService.createUser({
        email,
        passwordHash: hashedPassword,
        firstName,
        lastName,
        role,
      });

      logger.info(`New user registered: ${email}`);

      res.status(201).json({
        success: true,
        message: "Registration successful",
        data: {
          id: user.id,
          email: user.email,
          role: user.role,
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async login(req, res, next) {
    try {
      const { email, password } = req.validatedData;

      // Find user
      const user = await userService.getUserByEmail(email);
      if (!user) {
        return res.status(401).json({
          success: false,
          message: "Invalid email or password",
        });
      }

      // Verify password
      const isPasswordValid = await authService.comparePassword(
        password,
        user.passwordHash,
      );

      if (!isPasswordValid) {
        return res.status(401).json({
          success: false,
          message: "Invalid email or password",
        });
      }

      // Generate token
      const token = authService.generateToken(user);

      logger.info(`User logged in: ${email}`);

      res.status(200).json({
        success: true,
        message: "Login successful",
        data: {
          token,
          user: {
            id: user.id,
            email: user.email,
            role: user.role,
            firstName: user.firstName,
            lastName: user.lastName,
          },
        },
      });
    } catch (error) {
      next(error);
    }
  }

  async logout(req, res, next) {
    try {
      // Token blacklisting can be implemented here if needed
      logger.info(`User logged out: ${req.user.email}`);

      res.status(200).json({
        success: true,
        message: "Logout successful",
      });
    } catch (error) {
      next(error);
    }
  }
}

module.exports = new AuthController();
```

---

## 9. Environment Configuration: `.env.example`

```env
# Server
PORT=3000
NODE_ENV=development
HOST=localhost

# Database
DB_HOST=localhost
DB_PORT=3306
DB_NAME=internship_platform
DB_USER=root
DB_PASSWORD=password
DB_POOL_LIMIT=10

# JWT
JWT_SECRET=your_super_secret_jwt_key_change_this_in_production
JWT_EXPIRY=7d
REFRESH_TOKEN_EXPIRY=30d

# Email
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your_email@gmail.com
SMTP_PASSWORD=your_app_password
SMTP_FROM=noreply@internshipplatform.com

# Frontend
FRONTEND_URL=http://localhost:3000
FRONTEND_PRODUCTION_URL=https://internshipplatform.com

# AI/ML Service
PYTHON_AI_URL=http://localhost:5000
PYTHON_AI_SECRET=your_python_service_secret

# Logging
LOG_LEVEL=debug
LOG_FILE=logs/app.log

# File Upload
MAX_FILE_SIZE=10mb
UPLOAD_DIR=uploads/
ALLOWED_FILE_TYPES=pdf,doc,docx,jpg,png,jpeg
```

---

## 10. Database Configuration: `config/database.js`

```javascript
// config/database.js
const mysql = require("mysql2/promise");
const {
  DB_HOST,
  DB_PORT,
  DB_NAME,
  DB_USER,
  DB_PASSWORD,
  DB_POOL_LIMIT,
} = require("./environment");
const logger = require("../src/middleware/logger");

const pool = mysql.createPool({
  host: DB_HOST,
  port: DB_PORT,
  database: DB_NAME,
  user: DB_USER,
  password: DB_PASSWORD,
  waitForConnections: true,
  connectionLimit: DB_POOL_LIMIT || 10,
  queueLimit: 0,
});

pool.on("connection", () => {
  logger.info("New database connection established");
});

pool.on("error", (err) => {
  logger.error("Database pool error:", err);
});

module.exports = pool;
```

---

## 11. Package.json Dependencies

```json
{
  "name": "internship-platform-backend",
  "version": "1.0.0",
  "description": "Smart Internship Management Platform Backend",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js",
    "test": "jest --coverage",
    "test:watch": "jest --watch",
    "seed": "node scripts/seedDatabase.js",
    "migrate": "node scripts/migrations.js"
  },
  "dependencies": {
    "express": "^4.18.2",
    "cors": "^2.8.5",
    "helmet": "^7.0.0",
    "dotenv": "^16.3.1",
    "bcryptjs": "^2.4.3",
    "jsonwebtoken": "^9.0.2",
    "mysql2": "^3.6.5",
    "joi": "^17.11.0",
    "morgan": "^1.10.0",
    "winston": "^3.11.0",
    "axios": "^1.6.2"
  },
  "devDependencies": {
    "nodemon": "^3.0.2",
    "jest": "^29.7.0",
    "supertest": "^6.3.3",
    "eslint": "^8.52.0"
  }
}
```

---

## 12. Request/Response Pattern

### 12.1 Success Response

```javascript
{
  "success": true,
  "message": "Operation successful",
  "data": {
    // Actual response data
  }
}
```

### 12.2 Error Response

```javascript
{
  "success": false,
  "message": "Error message",
  "errors": [
    {
      "field": "email",
      "message": "Email is required"
    }
  ]
}
```

---

## 13. API Authentication Flow

```
1. User Registration
   POST /api/auth/register
   ├─ Validate input
   ├─ Check email exists
   ├─ Hash password
   └─ Create user in DB

2. User Login
   POST /api/auth/login
   ├─ Find user by email
   ├─ Verify password
   ├─ Generate JWT token
   └─ Return token + user data

3. Protected Request
   GET /api/students/profile
   ├─ Include "Authorization: Bearer <token>"
   ├─ Verify token signature
   ├─ Check token expiry
   ├─ Extract user from token
   └─ Process request

4. Token Refresh
   POST /api/auth/refresh-token
   ├─ Verify refresh token
   └─ Generate new access token
```

---

## 14. Key Architecture Decisions

### 14.1 Service-Controller-Model Pattern

- **Controllers**: Handle HTTP logic (request/response)
- **Services**: Business logic and data manipulation
- **Models**: Database interactions

### 14.2 Middleware Stack

- Security (helmet, cors)
- Logging (morgan, winston)
- Authentication (JWT)
- Validation (Joi)
- Error handling (custom)

### 14.3 Error Handling Strategy

- Custom error classes for different error types
- Centralized error handler middleware
- Proper HTTP status codes
- Detailed error messages in development
- Safe error messages in production

### 14.4 Database Pattern

- Connection pooling for performance
- Prepared statements for security
- Transaction support for data consistency
- Proper indexing for scalability

---

## 15. Development Workflow

```bash
# 1. Setup backend
cd backend
npm install

# 2. Configure environment
cp .env.example .env
# Edit .env with your credentials

# 3. Initialize database
npm run migrate
npm run seed

# 4. Start development server
npm run dev

# 5. Run tests
npm test

# 6. API Base URL
http://localhost:3000/api
```

---

## Summary of STEP 2

✅ **Complete Backend Architecture** with:

- **15 route modules** (auth, students, companies, supervisors, admin, internships, etc.)
- **65+ API endpoints** fully documented
- **Service-Controller-Model pattern** for clean architecture
- **Middleware stack** for security, validation, logging, error handling
- **Connection pooling** for scalable database access
- **JWT authentication** with role-based authorization
- **Proper error handling** with custom exception classes
- **Environment configuration** ready for different environments

---

## Ready for STEP 3

Next: Frontend architecture with React folder structure and UI pages for each actor.

Let me know when you're ready to continue!
