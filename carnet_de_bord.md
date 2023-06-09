# Séance 1 - 20/03/2023

## Contenu de la séance
- Prise de connaissance du sujet
- Découverte de l'AES
## Pour la prochaine séance
### Pour Rémi
- Implémentation des opérations de base (partie 4)
- Etude approfondie de la specification
### Pour Guillemot
- Mise de place de tests unitaires
- Etude approfondie de la specification

# Travail entre les séances 1 et 2
- Etude de la partie 4 de la spécification
- Implémentation des fonctions :
    - xor : addition modulo 2
    - oppose2 : opposé modulo 2
    - toZ2Z : utile pour les notations
    - toPoly_Z2Z : passage d'un tableau d'entiers à un polynôme
    - addition_poly : addition de polynômes
    - multiplication_poly : multiplication de polynômes
    - (+ toutes les fonctions auxiliaires nécessaires/sous-jacentes)
- Début d'implémentation de la fonction d'inverse

# Séance 2 - 31/03/2023
## Contenu de la séance
- Mise en place du GitLab
- Ajout des structures algébriques
- Début de mise en place des fichiers ghci pour les tests
- Remise en forme de la structure des fichiers du projet

## Pour la prochaine séance
### Pour Rémi
- Fin d'implémentation des structures algébriques
- Instanciation des structures algébriques (pour les polynomes à coefficients dans Z2Z)
- Adaptation des fonctions réalisées précédemment pour coller avec les nouvelles structures implémentées
- Etude de la fin du document FIPS
### Pour Guillemot
- Fin de mise en place des fichiers de test ghci pour les fonctions mathématiques, ZsurNZ et les structures algébriques
- Etude de la fin du document FIPS
- Rédaction d'un document résumant la spécification

# Travail entre les séances 2 et 3
- Fin d'implémentation de toutes les structures algébriques (groupe, anneau, corps)
- Rajout d'un classe de polynômes irréductibles pour la multiplication de polynômes
- Instanciation des structures algébriques : Z_sur_2Z (en tant que Corps) et polynomes à coefs. dans Z_sur_2Z (en tant qu'anneau [pour l'instant l'inverse n'a pas été défini])
- Petites corrections dans les fichiers de tests (car changements de nom ou suprresions de fonction)

# Séance 3 - 28/04/2023
## Contenu de la séance
- Codage de l'inverse (dans Poly a mais pour GF256)

## Pour la prochaine séance
### Pour Rémi
- Documentation du code
- Réalisation de tests unitaires
- Commencement des fonctions de chiffrement

# Travail entre les séances 3 et 4
- Documentation du rapport FIPS 197
- Documentation partielle du code (surtout le nouveau code (cipher))
- Création des types pour le chiffrement (à voir si les choix sont les bons)
- Codage des fonctions addRoundKey et shiftRows
- Réalisation des premiers tests unitaires pour les fonctions codées du cipher
- Réalisation d'un "squelette" du reste du code (fonction de chiffrement + fonctions annexes)

# Séance 4 - 10/05/2023
## Contenu de la séance
- Conversion d'un polynôme en liste héxa
- Fonction subBytes
- Début de la fonction mixColumns
- Pour cela, début d'implémentation des Poly (Poly ...)

## Pour la prochaine séance
### Pour Rémi
- Finalisation de l'implémentation des polynomes qui ont pour coef des polynomes à coef dans Z2Z 
- Finalisation de la fonction mixColumns
- Commencement de KeyExpansion, du Cipher (fonction globale), ainsi que des fonctions de déchiffrement

### Pour Guillemot
- Finalisation de la documentation des fonctions (dans le code)
- Ajouts de tests unitaires (tache secondaire)

# Travail entre les séances 4 et 5
- Abandon de l'implémentation des polynômes prévues (finalement pas utile pour nous, les fonctions ont pu être faites sans)
- MixColumns : fonction terminée
- KeyExpansion : fonction terminée (pas testée)
- Cipher : fonction terminée
- Pour l'invCipher, la fonction principale a été faites (il faut juste coder les fonctions annexes en se basant sur celles faites dans le cipher)

# Séance 5 - 16/05/2023
## Contenu de la séance
- Codage de invShiftRows, invSubBytes, invMixColumns
- Optimisation des fonctions shiftRows, subBytes, mixColumns pour que les appels à leur inverse soit beaucoup plus simple (et ne pas coder deux fois la même chose)
- Finalisation de KeyExpansion (corrections de bugs)
- Test du Cipher 128 avec les exemples du FIPS 197 (ça marche !)
- Test de l'invCipher 128 avec les exemples du FIPS 197 (ça marche pas !)
- Commencement modifications de la fonction invCipher pour résolution de bugs
- Ajouts de tests unitaires
- Documentation pdf terminée à 90%

## Pour la prochaine séance
### Pour Rémi
- Finalisation de la fonction invCipher
- Test du Cipher 192 et 256
- Test de l'invCipher 128, 192 et 256

# Travail entre les séances 5 et 6
- La fonction d'invCipher a fini d'être codée et tous les bugs ont été corrigés
- Le fonction de KeyExpansion a été adapté pour AES-192 et AES-256 qui avait des particularités minimes mais nécessaire
- La fonction Cipher (et InvCipher) a été testé pour AES-192 et AES-256
- Une implémentation plus concrète a été réalisé : chiffrement et déchiffremnt d'un texte (table ASCII uniquement)
- Un binaire exécutable est fourni pour avoir accès à notre implémentation AES dans la ligne de commande
- Le document de fin de jalon (documentation sur les fonctionnalités et les choix techniques) a été rédigé.
- Le code C a été commencé (multiplication + addRoundKey)

# Séance 6 - 12/06/2023
## Contenu de la séance
- L'ensemble de l'AES a été codé en C (jusqu'au fonction de Cipher + invCipher)
- Tout a été testé pour AES-128, AES-192 et AES-256, et tout fonctionne comme il faut

# Séance 7 - 13/06/2023
## Contenu de la séance
- Commencement des fonctions demandées (aes_encrypt et aes_decrypt)
- Ajout des options de compilation et de likage demandées : aucun problème lors de la compilation puis lors de l'éxécution après cet ajout. C'est plutôt une bonne nouvelle car ça veut dire que notre code est conforme
- Premier essaie de mesure de performance via les outils `valgrind` et `kcachegrind` : beaucoup de temps dans la multiplication (ces problèmes seront résolus ultérieurement lors de la partie optimisation)
- Tentative de Benchmark
- Réalisation de tests unitaires pour toutes les fonctions codées en C précédemment

# Séance 8 - 14/06/2023
## Contenu de la séance
- Fin des fonctions aes_encrypt et aes_decrypt
- Ajouts des tests unitaires correspondant
- Cleanage de l'ensemble du code.
- Réalisation de la documentation de l'ensemble des fichiers et des fonctions.
- Génération de la documentation `doc_code_c.pdf` avec Doxygen.
- Tag de la V1 du projet.

# Séance 9 - 15/06/2023
## Contenu de la séance
- Ajout de la fonctionnalité de mode de cryptage CBC (tout le projet était en ECB par défaut jusqu'à présent)
- Ajout du décryptage CBC
- Codage de la fonctionnalité de chiffrement/déchiffrement de fichier BMP
- Benchmark sur différents fichiers BMP :
    - Fichier de 3.0Mo :

    | Mode de cryptage | Chiffrement (s) | Vitesse (Mo/s) | Déchiffrement (s) | Vitesse (Mo/s) |
    |------------------|-----------------|----------------|-------------------|----------------|
    | ECB | 9.14s | 0.32Mo/s | 10.92s | 0.26Mo/s |
    | CBC | 14.75s | 0.20Mo/s | 12.80s | 0.23Mo/s |
    - Fichier de 53.7Mo :

    | Mode de cryptage | Chiffrement (s) | Vitesse (Mo/s) | Déchiffrement (s) | Vitesse (Mo/s) |
    |------------------|-----------------|----------------|-------------------|----------------|
    | ECB | 212.88s | 0.24Mo/s | 203.64s | 0.25Mo/s |
    | CBC | 207.51s | 0.25Mo/s | 202.68s | 0.25Mo/s |
    
    Résultat de kcachegrind :

<p align="center"><img src="./img_CdB/first_kcachegrind.png" height="400"></p>

- Optimisation pour mixColumns (création de tables de multiplication générées préalablement). Statistique pour le fichier de 53.7Mo :
    | Mode de cryptage | Chiffrement (s) | Vitesse (Mo/s) | Déchiffrement (s) | Vitesse (Mo/s) |
    |------------------|-----------------|----------------|-------------------|----------------|
    | ECB | 12.13s | 4.23Mo/s | 17.08s | 3.00Mo/s |
    | CBC | 16.00s | 3.20Mo/s | 18.14s | 2.83Mo/s |
    
    Résultat de l'optimisation : nous sommes (environ) 17x plus rapide.

    Résultat de kcachegrind :

<p align="center"><img src="./img_CdB/opti_multi_kcachegrind.png" height="400"></p>

- Utilisation de CLANG pour la compilation (plus rapide que GCC) :

    | Mode de cryptage | Chiffrement (s) | Vitesse (Mo/s) | Déchiffrement (s) | Vitesse (Mo/s) |
    |------------------|-----------------|----------------|-------------------|----------------|
    | ECB | 8.13s | 6.29Mo/s | 12.13s | 4.23Mo/s |
    | CBC | 8.35s | 6.14Mo/s | 13.03s | 3.94Mo/s |
    
    Résultat de l'optimisation : nous sommes (environ) 1.5x plus rapide.

- Réalisation du calcul de l'entropie. Résultat :

    | Fichier | Entropie |
    |------------------|-----------------|
    | bitmap_original.bmp | 3.637326 |
    | bitmap_original_crypted_ecb.bmp | 6.555531 |
    | bitmap_original_crypted_cbc.bmp | 7.999937 |
    | bitmap_file_2.bmp | 7.874685 |
    | bitmap_file_2_crypted_ecb.bmp | 7.999997 |
    | bitmap_file_2_crypted_cbc.bmp | 7.999997 |

- En rajoutant des options d'optimisation de partout (on avait oublié de les mettre pour les .o). On a donc des résultats plus satisfaisant que nous allons détaillé ici (on montre ici une moyenne des 4 vitesses):
    - GCC : 4.95Mo/s
    - GCC + O1 : 10.02Mo/s
    - GCC + O2 : 33.33Mo/s
    - GCC + O3 : 40.75Mo/s
    - GCC + Ofast : 41.80Mo/s
    - GCC + march=native : 4.98Mo/s
    - GCC + flto : 2.39Mo/s
    - GCC + O3 + march=native : 43.47Mo/s
    - GCC + Ofast + march=native : 43.09Mo/s
    - CLANG : 4.50Mo/s
    - CLANG + O1 : 34.90Mo/s
    - CLANG + O2 : 52.68Mo/s
    - CLANG + O3 : 46.22Mo/s
    - CLANG + Ofast : 48.03Mo/s
    - CLANG + march=native : 4.51Mo/s
    - CLANG + flto : 5.54Mo/s
    - CLANG + O2 + march=native : 57.34Mo/s
    - CLANG + O3 + march=native : 47.14Mo/s
    - CLANG + Ofast + march=native : 46.05Mo/s

    On en conclu donc que la meilleure option d'optimisation est : `CLANG + O2 + march=native` avec un maximum calculé à 64.68Mo/s.

- Mise à jour de la documentation pour les nouvelles fonctions.
- Rédaction du [README.md](README.md).