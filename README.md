# Inception – 42 Project

## 🌍 Table of Contents
- [🇫🇷 Français](#-français)
- [🇬🇧 English](#-english)

---

# 🇫🇷 Français

## 🚀 Introduction
**Inception** est un projet de l’école 42 qui m’a permis de découvrir et de comprendre le fonctionnement de **Docker**.  
À travers ce projet, j’ai appris à :  
- Créer et gérer des **Docker images** à partir de `Dockerfile`.  
- Utiliser **Docker Compose** pour orchestrer plusieurs services.  
- Configurer un environnement complet avec des containers isolés et interconnectés.  

L’objectif principal est de mettre en place une petite infrastructure contenant notamment :  
- **Nginx**  
- **WordPress**  
- **MariaDB**  

Le tout devant fonctionner uniquement via Docker, sans utiliser directement les services de la machine hôte.

---

## 🛠️ Comment j’ai réalisé ce projet
Au début, je ne connaissais rien à Docker. J’ai donc commencé par :  
1. Regarder des vidéos explicatives sur YouTube pour comprendre les bases :  
   - Différence entre **Docker** et une **VM**.  
   - Qu’est-ce qu’une **image Docker**, un **Dockerfile**, un **container**.  
   - Le rôle de **Docker Compose**.  
2. Poser beaucoup de questions et me documenter au fur et à mesure.  
3. M’appuyer sur des tutoriels et sur l’aide de ChatGPT – mais toujours en demandant un guidage plutôt qu’une réponse directe, ce qui m’a permis d’apprendre par moi-même.  

Grâce à cette démarche, j’ai acquis un vrai cadre pour :  
- Créer un environnement Docker cohérent.  
- Comprendre le rôle de chaque partie de l’infrastructure.  

---

## 💡 Points d’apprentissage et conseils
- **Ne pas se précipiter dans les scripts** : écrire trop de choses d’un coup peut causer des erreurs difficiles à déboguer.  
- **Bien configurer les ports** : vérifier que chaque service écoute sur les bons ports.  
- **Utiliser un `Makefile`** pour nettoyer et reconstruire proprement l’environnement.  
- **Créer un dossier pour les volumes dès le début** afin d’éviter les confusions.  
- **Attention aux chemins** (`path`) dans les `Dockerfile` et `docker-compose.yml`.  
- **Sécuriser MariaDB** en vérifiant les paramètres de connexion avant la fin du projet.  
- **Analyser les logs** avec `docker logs` :  
  - Une **erreur 502** sur Nginx peut par exemple venir d’une mauvaise connexion entre **MariaDB**, **WordPress** et **PHP-FPM**.  

---

## 📚 Ce que j’en retiens
- Inception m’a vraiment aidé à comprendre Docker en profondeur, et pas seulement à l’installer.  
- J’ai appris à décomposer un problème complexe en petites étapes.  
- Ce projet est une excellente préparation pour des environnements plus avancés, que ce soit dans le cloud, la CI/CD ou la mise en production.  

---

## 🎯 Conclusion
Inception est un projet exigeant mais extrêmement formateur.  
Mon conseil aux étudiants qui le réalisent : **prenez le temps de comprendre chaque étape et utilisez les outils de debug (logs, vérification des configs, etc.)**.  

💪 Bon courage à tous pour ce projet !  

---

# 🇬🇧 English

## 🚀 Introduction
**Inception** is a project from 42 School that allowed me to discover and understand the fundamentals of **Docker**.  
Through this project, I learned how to:  
- Create and manage **Docker images** using `Dockerfile`.  
- Use **Docker Compose** to orchestrate multiple services.  
- Configure a complete environment with isolated and interconnected containers.  

The main goal was to set up a small infrastructure containing:  
- **Nginx**  
- **WordPress**  
- **MariaDB**  

Everything runs inside Docker, without relying on the host system’s services.

---

## 🛠️ How I built this project
At first, I knew nothing about Docker. My process was:  
1. Watch explanatory videos on YouTube to understand the basics:  
   - Difference between **Docker** and a **VM**.  
   - What a **Docker image**, **Dockerfile**, and **container** are.  
   - The role of **Docker Compose**.  
2. Ask myself questions and do research to find answers.  
3. Use some tutorials and guidance from ChatGPT – but always asking for hints and explanations rather than direct solutions, so I could learn by myself.  

This approach gave me a real framework to:  
- Build a consistent Docker environment.  
- Understand the purpose of each part of the infrastructure.  

---

## 💡 Key learnings and advice
- **Don’t rush into writing scripts**: too many things at once will create hard-to-debug issues.  
- **Check port configurations carefully**: make sure each service listens on the right port.  
- **Use a `Makefile`** to clean and rebuild the environment properly.  
- **Create a folder for volumes from the start** to avoid confusion.  
- **Be careful with paths** in `Dockerfile` and `docker-compose.yml`.  
- **Secure MariaDB** by verifying connection settings before finishing the project.  
- **Check logs** with `docker logs`:  
  - A **502 error** in Nginx may be due to a bad connection between **MariaDB**, **WordPress**, and **PHP-FPM**.  

---

## 📚 What I learned
- Inception helped me understand Docker in depth, not just how to install it.  
- I learned to break down a complex problem into smaller steps.  
- It’s an excellent preparation for real-world environments such as cloud, CI/CD, and production deployment.  

---

## 🎯 Conclusion
Inception is a demanding but extremely valuable project.  
My advice to students: **take the time to understand each step, and always use debugging tools (logs, config checks, etc.)**.  

💪 Good luck to everyone working on this project!  

