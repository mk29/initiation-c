# initiation-c
Ceci est un code/test pour apprendre la compilation.
## Compiler avec make
### Sans aucun attribut
Compilation normale, sans spécificités, l'executable aura pour nom *executable*
### Avec comme attribut *staticexe*
L'executable "embarquera" avec lui les bibliothèques, l'executable aura pour nom *staticexe*
### Avec comme attribut *ranlibexe*
La compilation passera par l'intermédiare de l'archivage de functions.c, l'executable aura pour nom *ranlibexe*
### Avec comme attribut *dynamicexe*
Lors de la compilation, la bibliothèque dynamique liblphd.so sera créé, attention il ne faut pas oublier de mettre 
la bibliothèque dans le chemin de recherche des bibliothèques partagées (le PATH), l'executable aura pour nom *dynamicexe*
