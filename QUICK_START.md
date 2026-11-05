# Quick Start Guide

## ⚡ 5-Minute Setup

### Step 1: Backend Database (2 minutes)

```bash
# 1. Create database
mysql -u root -p
CREATE DATABASE internship_db;
EXIT;

# 2. Create tables
cd backend
npm run migrate

# 3. Add sample data
npm run seed
```

### Step 2: Backend Configuration (2 minutes)

```bash
# 1. Copy environment template
cp .env.example .env

# 2. Edit .env
# Update only these lines:
# DB_PASSWORD=your_mysql_password
# JWT_SECRET=your_random_secret_key_minimum_32_chars

# 3. Install dependencies
npm install
```

### Step 3: Start Servers (1 minute)

```bash
# Terminal 1: Backend
cd backend
npm run dev
# Expected: "Server is running on port 3000"

# Terminal 2: Frontend
cd frontend
npm install  # First time only
npm run dev
# Expected: "Local: http://localhost:5173/"
```

### Step 4: Test the App

Open browser: `http://localhost:5173`

- Register: `student@test.com` / `Password123!`
- Login with credentials
- Browse internships

---

## 📝 Key Files to Know

### Backend

- **`server.js`** - Start here, entry point
- **`src/app.js`** - Express setup and middleware chain
- **`src/routes/index.js`** - All API routes
- **`config/database.js`** - Database connection
- **`.env`** - Configuration file (create from .env.example)

### Frontend

- **`src/main.jsx`** - React entry point
- **`src/App.jsx`** - Routes and providers
- **`src/services/api.js`** - HTTP client configuration
- **`.vite/config.js`** - Build configuration
- **`.env.example`** - Environment template

---

## 🔗 Important URLs

| Service     | URL                              | Default Port |
| ----------- | -------------------------------- | ------------ |
| Frontend    | http://localhost:5173            | 5173         |
| Backend API | http://localhost:3000            | 3000         |
| MySQL       | localhost                        | 3306         |
| API Health  | http://localhost:3000/api/health | -            |

---

## 🧪 Test Credentials

After running `npm run seed`:

| Role       | Email                     | Password     |
| ---------- | ------------------------- | ------------ |
| Student    | alice@example.com         | Password123! |
| Student    | bob@example.com           | Password123! |
| Company    | tech@company.com          | Password123! |
| Supervisor | supervisor@university.com | Password123! |

---

## 🐛 Common Issues

### "Can't connect to database"

```bash
# Check MySQL is running
mysql -u root -p -e "SELECT 1"

# Reset password in .env
DB_PASSWORD=your_actual_password
```

### "Port 3000 already in use"

```bash
# Change port in .env
PORT=3001

# Or kill process on port 3000 (macOS/Linux)
lsof -i :3000 | grep LISTEN | awk '{print $2}' | xargs kill -9
```

### "JWT validation failed"

```bash
# Generate new JWT secret
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"

# Update in .env
JWT_SECRET=<paste_output_here>
```

### "CORS error from frontend"

```bash
# Ensure backend is running on correct port
# Check FRONTEND_URL in .env matches frontend URL
npm run dev  # Restart backend
```

---

## 📊 Database Quick Commands

```bash
# Connect to database
mysql -u root -p internship_db

# View all tables
SHOW TABLES;

# Check users
SELECT id, email, role FROM users;

# Check internship offers
SELECT id, title, location FROM internship_offers;

# Check applications
SELECT a.id, u.email, i.title FROM applications a
JOIN users u ON a.studentId = u.id
JOIN internship_offers i ON a.offerId = i.id;

# Clear all data (careful!)
TRUNCATE TABLE notifications;
TRUNCATE TABLE activity_logs;
TRUNCATE TABLE recommendations;
# ... etc for all tables
```

---

## 📱 API Quick Tests

### 1. Register New User

```bash
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "newuser@test.com",
    "password": "TempPass123!",
    "firstName": "Test",
    "lastName": "User",
    "role": "STUDENT"
  }'
```

### 2. Login

```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "newuser@test.com",
    "password": "TempPass123!"
  }'
```

**Response:**

```json
{
  "success": true,
  "data": {
    "user": { "id": 1, "email": "...", "role": "STUDENT" },
    "token": "eyJhbGc..."
  }
}
```

### 3. Get Protected Resource (use token from login)

```bash
TOKEN="eyJhbGc_from_login_response"
curl -X GET http://localhost:3000/api/students/profile \
  -H "Authorization: Bearer $TOKEN"
```

---

## 🎯 Development Workflow

### Making Backend Changes

1. Edit file in `src/` directory
2. Save file
3. Server automatically restarts (nodemon)
4. Test changes via API

### Making Frontend Changes

1. Edit file in `frontend/src/`
2. Save file
3. Browser automatically refreshes (Vite HMR)
4. See changes instantly

### Adding New API Endpoint

1. Create controller method in `src/controllers/`
2. Create service method in `src/services/`
3. Add route in `src/routes/`
4. Call from frontend service

---

## 📚 Documentation

- **Full Docs**: See `PROJECT_DOCUMENTATION.md`
- **Backend**: See `backend/README.md`
- **Frontend**: See `frontend/README.md`
- **Implementation**: See `backend/IMPLEMENTATION_SUMMARY.md`

---

## 🚀 Next Steps

1. **Explore the code** - Read through controllers and services
2. **Test API endpoints** - Use provided curl commands or Postman
3. **Try the UI** - Register and interact with the app
4. **Modify features** - Change validation, add new endpoints, etc.
5. **Deploy** - Follow deployment guide in PROJECT_DOCUMENTATION.md

---

## 🆘 Need Help?

1. Check error messages in console
2. Review `logs/app.log` for backend errors
3. Check browser console for frontend errors
4. Review .env file for configuration issues
5. Ensure all services are running (MySQL, Backend, Frontend)

---

## ✨ You're All Set!

Enjoy building with the Internship Management Platform! 🎉
