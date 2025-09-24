Inception – Projet 42
🚀 Introduction

Inception est un projet de l’école 42 qui m’a permis de découvrir et de comprendre le fonctionnement de Docker.
À travers ce projet, j’ai appris à :

Créer et gérer des Docker images à partir de Dockerfile.

Utiliser Docker Compose pour orchestrer plusieurs services.

Configurer un environnement complet avec des containers isolés et interconnectés.

L’objectif principal est de mettre en place une petite infrastructure contenant notamment :

Nginx

WordPress

MariaDB

Le tout devant fonctionner uniquement via Docker, sans utiliser directement les services de la machine hôte.

🛠️ Comment j’ai réalisé ce projet

Au début, je ne connaissais rien à Docker. J’ai donc commencé par :

Regarder des vidéos explicatives sur YouTube pour comprendre les bases :

Différence entre Docker et une VM.

Qu’est-ce qu’une image Docker, un Dockerfile, un container.

Le rôle de Docker Compose.

Poser beaucoup de questions et me documenter au fur et à mesure.

M’appuyer sur des tutoriels et sur l’aide de ChatGPT – mais toujours en demandant un guidage plutôt qu’une réponse directe, ce qui m’a permis d’apprendre par moi-même.

Grâce à cette démarche, j’ai acquis un vrai cadre pour :

Créer un environnement Docker cohérent.

Comprendre le rôle de chaque partie de l’infrastructure.

💡 Points d’apprentissage et conseils

Ce projet m’a permis de progresser sur plusieurs points importants que je partage ici pour aider d’autres étudiants :

Ne pas se précipiter dans les scripts : écrire trop de choses d’un coup peut causer des erreurs difficiles à déboguer.

Bien configurer les ports : vérifier que chaque service écoute sur les bons ports.

Utiliser un Makefile pour nettoyer et reconstruire proprement l’environnement.

Créer un dossier pour les volumes dès le début afin d’éviter les confusions.

Attention aux chemins (path) dans les Dockerfile et docker-compose.yml.

Sécuriser MariaDB en vérifiant les paramètres de connexion avant la fin du projet.

Analyser les logs avec docker logs :

Une erreur 502 sur Nginx peut par exemple venir d’une mauvaise connexion entre MariaDB, WordPress et PHP-FPM.

📚 Ce que j’en retiens

Inception m’a vraiment aidé à comprendre Docker en profondeur, et pas seulement à l’installer.

J’ai appris à décomposer un problème complexe en petites étapes.

Ce projet est une excellente préparation pour des environnements plus avancés, que ce soit dans le cloud, la CI/CD ou la mise en production.

🎯 Conclusion

Inception est un projet exigeant mais extrêmement formateur.
Mon conseil aux étudiants qui le réalisent : prenez le temps de comprendre chaque étape et utilisez les outils de debug (logs, vérification des configs, etc.).

💪 Bon courage à tous pour ce projet !
