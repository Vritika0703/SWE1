#!/bin/bash
echo "🔄 Resetting Django project for new user..."

# Generate new secret key
echo "🔑 Generating new SECRET_KEY..."
NEW_KEY=$(python3 -c "
from django.core.management.utils import get_random_secret_key
print(get_random_secret_key())
")
echo "Your new SECRET_KEY: $NEW_KEY"

echo ""
echo "📝 Please update these files manually:"
echo "1. Add to .env: DJANGO_SECRET_KEY=\"$NEW_KEY\""
echo "2. mysite/settings.py: ALLOWED_HOSTS = ['localhost', '127.0.0.1']"
echo "3. Run: git remote set-url origin https://github.com/Vritika0703/swe1-app.git"
echo ""
