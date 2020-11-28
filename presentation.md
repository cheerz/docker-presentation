![Docker logo](https://raw.githubusercontent.com/cheerz/docker-presentation/main/img/docker_logo.png)

# theory
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
![Docker vs traditional Virtualization](https://raw.githubusercontent.com/cheerz/docker-presentation/main/img/VM-Diagram.png)

##### source: [CMU post by Joe Yankel](https://insights.sei.cmu.edu/devops/2015/01/devops-and-docker.html)

---

### Les avantages 

- Les tables de la lois
- Je suis ISO prod !
- J’install ce que je veux, quand je veux, où je veux

---

### Les tables de la lois

#### Toute les informations concernant :
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

 - C'était écrit d'avance !
 - Le context devient secondaire
 - C'est répétable a l'infini

---

### J’install ce que je veux, quand je veux, où je veux

 - N'importe quel dépendence
 - Sur n'importe quel langage
 - Dans n'importe quel version
 - A partir d'une mega bibliotheque

##### THE [Docker hub](https://hub.docker.com/search?q=&type=image)

---

## Les inconvénients
  - oui mais !
  <!-- TODO add MEME -->

---
### L'architecture Docker

![Docker architecture](https://raw.githubusercontent.com/cheerz/docker-presentation/f7f2587172be4dd32e2ec97bb4938a508b4e3902/img/architecture.svg)
###### Plus d'information sur la documentation [Understanding docker](https://docs.docker.com/engine/understanding-docker/)

---

### Les images

  - Le pull et les registry
  - Le build et Dockerfile ou les fameuse table de la lois
  - Le Dockerfile, les instructions : FROM, COPY, ARG, RUN
  - Le storage et les layers
  - L'héritage

---

### Le pull et les registry
  - La principal source de docker
  - Dockerhub c'est du bonheur

---

### Le build et Dockerfile ou les fameuse table de la lois
  - On s'appuit sur une image existante
  - On liste nos dépendences
  - On met notre application 
  - Bref c'est la customisation

---

### Le Dockerfile, les instructions
  - FROM
  - WORKDIR
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

![Docker architecture](https://raw.githubusercontent.com/cheerz/docker-presentation/f7f2587172be4dd32e2ec97bb4938a508b4e3902/img/architecture.svg)
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
  > Port mapping 8080:80

  > On doit avoir un `EXPOSE 80` dans le Dockerfile

  > et on y accède via l'adresse `127.0.0.1:8080` ou `localhost:8080`


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
  - Enfin le RM pour faire le ménage

---

### Les pièges classique et comment les éviter
  - Les images prennent très vite du volume
  - Utiliser le network host c'est mal !
  - Oublier l'héritage et tout rebuild a chaque fois !

---

### Docker-compose
  - Toute la prod dans un fichier !
<!-- TODO a retravailler -->


---

### Resources
