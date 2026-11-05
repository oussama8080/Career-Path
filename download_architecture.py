import requests
import os

# Créer le répertoire s'il n'existe pas
os.makedirs('c:\\Users\\DELL\\Oussama-boukhrisse\\memoir\\images', exist_ok=True)

# Code Mermaid pour le diagramme d'architecture
mermaid_code = """graph TB
    subgraph Frontend["Frontend"]
        React["React 18 + TypeScript<br/>Tailwind CSS | Vite"]
        UI["Interface Utilisateur<br/>- Recherche offres<br/>- Candidatures<br/>- Recommandations IA"]
    end

    subgraph Backend["Backend"]
        Express["Node.js + Express.js"]
        Auth["AuthService<br/>JWT + bcrypt"]
        Offer["OfferService"]
        App["ApplicationService"]
        Rec["RecommendationService<br/>Orchestration IA"]
        Notify["NotificationService"]
    end

    subgraph IA["Machine Learning"]
        Python["Python 3.10<br/>scikit-learn"]
        ML["Modele Recommandation"]
    end

    subgraph Database["PostgreSQL 15"]
        PG["Base de Donnees"]
        Tables["Users, Offers<br/>Applications, Evaluations"]
    end

    React --> UI
    UI -->|API REST| Express
    Express --> Auth
    Express --> Offer
    Express --> App
    Express --> Rec
    Express --> Notify
    Rec -->|Calling| Python
    Python --> ML
    Express -->|Query/Write| PG
    PG --> Tables
    Notify -->|Send| Email["Email Service"]
    App -->|Save| Storage["Cloud Storage"]
    
    style Frontend fill:#e1f5ff
    style Backend fill:#fff3e0
    style IA fill:#f3e5f5
    style Database fill:#e8f5e9"""

# Utiliser Kroki.io pour générer l'image
url = "https://kroki.io/mermaid/png"

try:
    response = requests.post(url, data=mermaid_code, timeout=30)
    if response.status_code == 200:
        filepath = 'c:\\Users\\DELL\\Oussama-boukhrisse\\memoir\\images\\architecture_system.png'
        with open(filepath, 'wb') as f:
            f.write(response.content)
        print("✅ Image architecture_system.png créée!")
        print(f"📁 {filepath}")
        print(f"📊 {len(response.content)} bytes")
    else:
        print(f"❌ HTTP {response.status_code}")
except Exception as e:
    print(f"❌ Erreur: {str(e)}")
