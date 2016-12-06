# Cookie_Mold
Mold for cookie from image

Ce petit sketch Processing est construit à partir de ce qui est fait dans le [projet de Less Hall](http://www.thingiverse.com/thing:363298) mais au lieu de projeter une image sur une sphère on la projette sur une dalle pour en faire un bas-relief pour un moule à gateau.

Il faut partir d'une image en niveaux de gris moyennement contrastée. On peut l'obtenir par une commande Imagemagick du style : 

`convert -geometry 100x100 -colorspace Gray -brightness-contrast 0x50 ..\visage.jpg  visage_gray.jpg` 

Le paramètre de l'option `-brightness-contrast` 0x50 peut être modifié en augmentant ou diminuant le contraste ou la luminosité de 0 à 100, ici la luminosité n'est pas touchée.

L'image est prise en entrée du croquis Cookie_Mold.pde et produit un fichier OpenSCAD en sortie.
