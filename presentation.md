![Docker logo](https://raw.githubusercontent.com/cheerz/docker-presentation/main/img/docker_logo.png)

# Day
________________________

####Présentation Par Jonathan Duval
###### Source: [Github](https://github.com/cheerz/docker-presentation)
________________________
#### Credit
###### [TheodorosPloumis.com](http://www.theodorosploumis.com/en) / [@theoploumis](http://twitter.com/theoploumis)

###### Get them: [online presentation](http://theodorosploumis.github.io/docker-presentation/) / [source code](https://github.com/theodorosploumis/docker-presentation) / [docker image](https://hub.docker.com/r/tplcom/docker-presentation/)

###### Under [Attribution 4.0 International](http://creativecommons.org/licenses/by/4.0/) license.

---

### Intruction docker 

- La Petite histoire d'un mastodonte
- Qu’est ce que docker 
- Non ce n’est pas une VM !

---

### La Petite histoire d'un mastodonte

 ##### Créer par 
 #### Solomon Hykes ([@solomonstre](https://twitter.com/solomonstre)) 
 #### En Mars 2013
 #### Sous license Apache 2.0
________________________

#### Docker c'est aussi :
  - 3000 Contributeurs
  - 4 Millions de dev travaillant avec
  - 5.8 Millions d'image docker
  - Pour un total de 105 Milliard d'image téléchargé
________________________

##### source: [Docker statistics](https://expandedramblings.com/index.php/docker-statistics-facts/)

---

### Qu’est ce que docker 
  > Docker est une plateforme open source pour développer livrer et faire tourner des applications.

  > Docker vous permet de packager une application avec toutes ses dépendences dans un standard conçu pour le développement d'application.

##### [Version original en anglais](http://theodorosploumis.github.io/docker-presentation/#/2)

---

### Non ce n’est pas une VM !
<!-- TODO Internaliser l'image -->
![Docker vs traditional Virtualization](https://insights.sei.cmu.edu/assets/content/VM-Diagram.png)

##### source: [CMU post by Joe Yankel](https://insights.sei.cmu.edu/devops/2015/01/devops-and-docker.html)

---

### Les avantages 

- Les tables de la lois
- Je suis ISO prod !
- J’install ce que je veux, quand je veux, où je veux

---

### Les tables de la lois

 - Toute les informations concernant :
 - Les dépendences 
 - Comment build l'application
 - La configuration de l'application
 - Comment lancer l'application

  > En ruby 2.7 tu seras

  > Vips 8.9 tu installeras

  > Bundle exec tu feras

  > Puma tu lanceras

  
---

### Je suis ISO prod !

 - Comme tout est inscrit et versionné avec votre application, la prod fera exactement la même chose.
 - Donc peut importe sur quel machine/OS est lancé votre application, elle fonctionnera toujours pareil.

---

### J’install ce que je veux, quand je veux, où je veux

 - Base de donnée relationnel (ou non)
 - Système de cache
 - Proxy
 - Firewall
 - queuing 
 - Sur n'importe quel langage de programation, compilé ou non, fonctionnel ou objet, peu importe.
 - Dans une bibliothèque de 5.8 millions d'images, si vous ne trouvez pas votre bonheur c'est que vous n'avez pas assez cherché.

##### THE [Docker hub](https://hub.docker.com/search?q=&type=image)

---
<!-- TODO internaliser l'image -->
### L'architecture Docker

![Docker architecture](https://docs.docker.com/engine/images/architecture.svg)
###### Plus d'information sur la documentation [Understanding docker](https://docs.docker.com/engine/understanding-docker/)

---

### Les images

  - Le pull et les registry
  - Le build ou les fameuse table de la lois
  - Le Dockerfile, les instructions : FROM, COPY, ARG, RUN
  - Le storage et les layers
  - L'héritage

---

### Le pull et les registry
  - La principal source de docker
  - Dockerhub c'est du bonheur

---

### Le build ou les fameuse table de la lois
  - Si vous ne trouvez pas exactement votre bonheur
  - Si vous souhaitez modifier ou ajouter un petit truc sur une image existante
  - Bref c'est la customisation

---

### Le Dockerfile, les instructions
  - FROM
  - COPY
  - ARG
  - RUN
---

### Le storage et les layers
  - Système de découpage des images
  - Versionning couche par couche
  - Le nombre de couche dépend du nombre d'instruction
  - Le but étant de limiter la bande passante et le temps de pull
---

### L'héritage
  - On peut pull une image déjà construite et la modifier
  - L'héritage se faire grâce au système de couche

---

### Les containers
  - Le Dockerfile , les instructions (la suite) : ENV, EXPOSE, ENTRYPOINT, CMD
  - Le volume mapping
  - Le port mapping
  - Le network
  - Le link de container

---

### Retour du schema d'architecture

![Docker architecture](https://docs.docker.com/engine/images/architecture.svg)
###### Plus d'information sur la documentation [Understanding docker](https://docs.docker.com/engine/understanding-docker/)

---

### Le Dockerfile , les instructions (la suite)
  - ENV
  - EXPOSE
  - ENTRYPOINT
  - CMD
  
---

### Le volume mapping
  - Attacher a l'hote un point de montage
  - Faire un point de montage commun entre deux container


---

### Le port mapping
  - Les containers sont fermé par defaut
  - Port host versus container port

---

### Le network
  - Le bridge 
  - Le host
  - Le none

##### Plus de détail sur [Docker network](https://docs.docker.com/network/)

---

### Le link de container
  - Les containers par défaut sont isolé
  - Mini dns interne
  
---

### Je joue avec mes containers
  - Docker exec pour jouer avec un container qui tourne déjà
  - Docker logs pour voir ce qu’il se passe
  - Stop ou kill petit retour au source de la CLI

---

### Les pièges classique et comment les éviter
  - 

---

### Docker-compose
  - Quand je vous est dit que ca rend fainéant vous allez découvrir pourquoi
  - Toute la prod dans un fichier !
<!-- TODO a retravailler -->
