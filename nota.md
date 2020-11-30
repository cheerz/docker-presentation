# NOTA
## Qu’est ce que docker (X min)
  ### Petit historique rapide
    * Présentation rapide des chiffres
  ### Qu’est ce que docker 
    * Une définition bien générique qui n'apporte pas grand chose 
  ### Non ce n’est pas une VM !
    * Expliquer le schema en particulier l'appuis sur l'hote, la notion de ressource partagé
## Avantage (X min)
  ### Les tables de la lois
    * On l'appel aussi Dockerfile, mais on revient en détail dessus après.
    * Juste lister quelques exemple de ce qu'il contient
    * Grosse voix pour lister quelques exemple de lois
  ### Je suis ISO prod !
    * Comme tout est inscrit et versionné avec votre application, la prod fera exactement la même chose. (on appel ca aussi la répétabilité)
    * Donc peut importe sur quel machine/OS est lancé votre application, elle fonctionnera toujours pareil.
  ### J’install ce que je veux, quand je veux, où je veux
    * Base de donnée relationnel (ou non)
    *  Système de cache
    * Proxy
    * Firewall
    * queuing 
    * Sur n'importe quel langage de programation, compilé ou non, fonctionnel ou objet, peu importe.
    * Et le tout en pouvant choisir précisément la version
    * Comme dit précédement c'est une bibliothèque de 5.8 millions d'images, si vous ne trouvez pas votre bonheur, la plupart du temps c'est que vous n'avez pas assez cherché.
## Les inconvénients
  * Cette partie là m'a donné du fil a retordre, a chaque fois que je pensais a un défaut je trouvais un contre exemple ou il sagisssait d'une mauvaise pratique
  * Par exemple "Docker consome des ressources pour tourner" => oui mais ! => "les VM aussi etc en comparaison docker est vraiment léger"
  * Ou alors "Docker ca prend beaucoup de place et ca duplique les dépendences" => Oui mais ! => "en vrai les dépendences ne sont pas dupliqué si on utilise les images correctement, et niveau place c'est finalement assez optimisez", on reviendra dessus plus tard au niveau des pièges a éviter
## L'architecture Docker
  * Montrer le schema rapidement
  * Le client on vera ca en workshop
  * On s'interesse maintenant a la partie registry et image
  * Ensuite nous verrons la partie container
## Les images (X min)
  ### Le pull et les registry
    * En vrai on ne fait jamais de dockerfile sans pull une source
    * Par defaut un Docker est vide !( rien pas de package manager, pas de commande de base quenini)
    * On s'appuit sur la puissance et la connaissance de 4 millions d'utilisateur
    * On peut créer des registry privé pour faire ses petites images custom 
    * Les registry privé fonctionne exactement de la même façon que les registry publique
  ### Le build et Dockerfile ou les fameuse table de la lois
    * Aller on est partis sur du concret
    * ca se construit de la facon suivante
    * On lui dit sur quel image on s'appuit
    * On va dire exactement ce que l'on veut comme dépendence 
    * Comment on copie/build/récupère notre application
    * Et potentiellement on lui passe des arguments de l'extérieur par rapport a ca
  ### Le Dockerfile, les instructions : FROM, COPY, RUN, ARG
    * Chaque action précédément cité s'appuit sur une de ces instructions
    * FROM : c'est l'image sur laquelle on s'appuit
    * WORKDIR : c'est juste pour définir le path de référence, ca revient a faire un `cd` 
    * RUN : On lance des commande système pour installer une application tierce,parser un ficher, faire un curl etc ...
    * COPY: C'est ainsi qu'on récupère des fichier locaux et qu'on les met dans son application
    * ARG : Pour passer des arguments pour le build
  ### Le storage et les layers
    * Cette partie n'est pas obligatoire mais est vraiment intéressante pour comprendre comment fonctionne docker et éviter beaucoup de piège
    * Donc docker pour stocker des images s'appuit sur un système de couche ou "layer" en anglais
    * Chaque instruction précédément cité est une couche pour docker 
    * Ce qui fait que si par exemple vous modifier juste votre application, seule l'instruction/couche COPY va changer ce qui vous évitera de tous rebuild/pull/push a chaque fois
  ### L'héritage
    * Comme dit et répété plusieurs fois on ne fait pas une image a partir de rien, c'est pour ca que le système d'héritage est tellement indispensable
    * Le fonctionnement est très simple, quand vous vous appuyez sur une image existante, il va juste récupérer sa liste de couche
    * Et quand vous construirez une image a partir de celle-ci vous ne ferez qu'ajouter des couche supplémentaire
## Les containers (oui docker c’est pas que ca) (X min)
  * On a vu comment construire une image, maintenant on va voir comment l'utiliser et enfin voir ce que sont ces fameux container !
  ### Le Dockerfile , les instructions (la suite) : ENV, EXPOSE, ENTRYPOINT, CMD
    * Aller on reprend notre Dockerfile et on va lui ajouter quelques options
    * Le ENV: qui permet de passer des variable d'environements, et donc de le customiser.
    * Attention de ne pas confondre le ENV et ARG, le ARG ce n'est que pour la partie build et donc image, la ou l'environement sera disponible pendant l'exécution 
    * Le EXPOSE: Qui permet de demander a docker d'écouter un port, par défaut docker est entièrement fermé, si vous voulez qu'il écoute quelque chose il faut lui dire
    * ENTRYPOINT: Ca permet d'exécuter une commande au moment du lancement du container.
    * CMD: C'est LA commande lancé par le container pour l'exécution 
    * Ne surtout pas confondre les deux, dans l'ordre c'est ENTRYPOINT puis CMD la gross différence se situe sur le fait que docker va surveiller le process lancer par CMD pour savoir si il est toujours en cours d'exécution ou non 
    * Donc en général on se servira de l'ENTRYPOINT pour préparer l'exécution et par exemple le CMD pour lancer le serveur web.
    * Un Dockerfile sans CMD s'arrêtera de suite
    * Autre chose a savoir une image parente peut contenir un CMD, si vous remettez l'instruction ca sera un override
  ### Le volume mapping
    * Super pratique pour partager des fichier entre l'hote et le container, ou entre deux containers.
    * Ce sont simplement des points de montage
    * Par exemple on s'en sert en dev pour éviter de copier a chaque fois toutes ses sources, on va plutôt monter un volume.
    * Ca se défini toujours de la facon suivante <HOST_FOLDER>:<CONTAINER_FOLDER>
  ### Le port mapping
    * Un container par défaut est super isolé
    * Donc même si on ouvre un port avec l'instruction EXPOSE, il ne sera accessible que sur un petit réseau privatif (on revient sur les réseau juste après)
    * Du coup comme on veut tout de même accéder a sont application (notament via 127.0.0.1 ou localhost) on utilise le port mapping 
    * Ca présente sous cette forme <HOST_PORT>:<CONTAINER_PORT>
    * Ca permet aussi d'avoir une multitude d'application web qui écoute sur le port 80 ou de base postgres qui écoute sur le port 5432 sans pour autant se gêner les unes les autres
  ### Le network
    * Du coup on a commencer a en parler juste au dessus, mais ce qui fait qu'on container est totalement isolé, c'est notament grâce a son network
    * Il existe 3 principaux network:
    * Le bridge (par defaut) ou la il est isolé tout seul, ou si tu renseigne le même bridge pour plusieurs container, il peuvent communiquer entre eux
    * C'est le network le plus utilisé, et celui a privilégier
    * Ensuite le network host, celui ci en fait s'intègre directement au réseau de l'hôte sans mapping ni rien, donc le port mapping est inutile dans ce cas là, si tu as une instruction EXPOSE dans ton dockerfile ca l'ouvrira directement sur ton pc
    * Enfin le none est assez explicite, 0 réseaux, le container est totalement isolé sur cette partie là.
  ### Le link de container
    * C'est intimement lié a la notion de network vu juste avant, on peut lié deux container entre eux pour qu'il puisse communiquer, ca fera un petit network bridge spécialement pour eux
    * Ca génère en plus un mini DNS du coup par exemple tu as un container appelé `app` et un autre appelé `bdd` et bien du coup dans le container `app` tu pourras appeler le container `bdd` via ce nom et inversement exemple `postgre://bdd:5432`
## Je joue avec mes containers (X min)
  * Donc on a construit notre image et on l'a lancé, maintenant on aimera suivre un peu ce qu'il se passe voir debug si un truc pas rond
  * Ca va être exactement le but des commande qui vont suivre
  ### Docker ps pour voir ce qui tourne
  * Passer en vue de terminal
  * La première commande utile c'est le PS elle permet de lister les container tout simplement
  * L'option -a très important pour voir les containers qui ne tournent pas
  ### Docker exec pour jouer avec un container qui tourne déjà
    * docker exec est dédié au débug
    * Il permet d'exécuter une commande dans un container qui tourne
    * docker exec -it <NOM_OU_ID_DU_CONTAINER> <COMMAND>
    * docker exec -it app cat /var/log/syslog
    * docker exec -it app bash
    * le `-i` c'est pour indiquer que l'on veut être interactif
    * le `-t` c'est pour tty (je ne rentre pas dans le détail de tty, une recherche google vous donnera toute les réponses)
  ### Docker logs pour voir ce qu’il se passe
    * Pas besoin de m'étendre sur l'utilité de cette commande je pense
    * docker logs <NOM_OU_ID_DU_CONTAINER>
    * On peut rajouter aussi l'option `-f` pour les suivres en temps réel
  ### Stop ou kill petit retour au source de la CLI
    * Les commande pour les arrêter
    * docker stop <NOM_OU_ID_DU_CONTAINER>
    * docker kill <NOM_OU_ID_DU_CONTAINER>
    * Le deux commande on le même effet, c'est juste la brutalité avec laquelle il le font
    * le premier demande a l'application de s'arrêter là ou le second l'arrête point.
    * Exemple le garde frontière, le premier lève la main et dit stop, le second sort son fusil et tire a vue
  ### Enfin le RM pour faire le ménage
    * Une fois un container arrêté il n'a pas disparu pour autant.
    * Pour faire le ménage on utilise RM
    * docker rm <NOM_OU_ID_DU_CONTAINER>
    * On peut aussi si on a la flemme de de le faire a chaque fois ajouter l'option `--rm` dans la commande RUN pour que le container se supprime tout seul une fois stoppé

## Les pièges classique et comment les éviter (X min)
  * Les images grossissent très vite donc il faut faire attention a bien supprimer ce d'on on a pas besoin, 
  * prendre l'image de base la plus légère possible 
  * éviter de faire 50 instruction RUN dans le dockerfile, 
  * si on utilise un packet manager genre apt, on pense a clean le cache après
  * Utiliser le network host est très très rarement une bonne idée, certe c'est plus simple, mais on est vite limité
  * Utiliser vos image et essayer au maximum de les rendre générique, puis de les décliner au besoin avec des dépendences plus spécialisé a chaque fois
  * C'est comme la factorisation du code, c'est un compromis entre réusabilité et praticité d'emploi
## Docker-compose (X min)
  ### Toute la prod dans un fichier !
