# Setup Checklist for swe1-app (Vritika0703)

Repo: **https://github.com/Vritika0703/swe1-app**

## ✅ What You Must Do

### 1. Django settings (`mysite/settings.py`)
- [ ] Generate a new **SECRET_KEY** (run `python3 manage.py shell` → `from django.core.management.utils import get_random_secret_key` → `get_random_secret_key()`).
- [ ] Set **DJANGO_SECRET_KEY** in your environment (e.g. in `.env` with python-dotenv).
- [ ] Set **ALLOWED_HOSTS** to `['localhost', '127.0.0.1']` for local dev.

### 2. Git
- [ ] Set remote:  
  `git remote set-url origin https://github.com/Vritika0703/swe1-app.git`
- [ ] Optionally: `git config user.name "Your Name"` and `git config user.email "your-email@example.com"`

### 3. Local run
- [ ] `python3 -m venv venv` → `source venv/bin/activate` → `pip install -r requirements.txt`
- [ ] `python3 manage.py migrate`
- [ ] `python3 manage.py createsuperuser`
- [ ] `python3 manage.py runserver` → open http://localhost:8000/admin/

## 🔧 Optional

- Run **`./reset_project.sh`** to generate a new SECRET_KEY and print reminder steps (chmod +x if needed).
- For production, consider setting **DEBUG = False** in `settings.py` or via environment variable.

## 🛡️ Security

- `*.pem` added to `.gitignore` so SSH keys are not committed.
- Do not commit `.env`, `db.sqlite3`, or secrets.

## 🔧 Troubleshooting

| Issue | Fix |
|-------|-----|
| `python` / `pip` not found | Use `python3` and `pip3` (or `python3 -m pip`) |
| `aws` not found after venv activate | Run `pip install awscli` inside venv so `aws` is in venv/bin |
| GitHub push: Permission denied (publickey) | Use HTTPS: `git remote set-url origin https://github.com/Vritika0703/swe1-app.git` then push (use Personal Access Token as password) |
| Admin login 500 error | Custom admin template may reference removed `admin_password_reset`; check `templates/admin/login.html` |
