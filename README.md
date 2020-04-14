# arnaud

2.1. Multiples de 3 et 5

Dans ce premier exercice, on va te guider pas à pas afin que tu vois comment un développeur réfléchi face à un problème. Pour les autres exercices, tu seras livré à toi-même : charge à toi de faire la même approche !
2.1.1. L'énoncé

Cédric Villani a besoin d'aide pour enfin décrocher le prix Nobel de Mathématiques. Il a besoin de résoudre le problème suivant :

    Si on liste tous les entiers naturels strictement inférieurs à 11 et qui sont multiples de 3 ou 5, on obtient 3, 5, 6, 9 et 10. La somme de ces nombres est égale à 33.
    => Trouve la somme des entiers naturels strictement inférieurs à 1000 et qui sont multiples de 3 ou 5.

Pour t'aider sur ce premier exercice, on va décomposer des étapes qui vont nous permettre de le résoudre : découper le problème en petits problèmes (en méthodes), écrire les tests en premier (pour faire du Test Driven Development) puis finalement coder le programme.
2.1.2. Mise en oeuvre de l'approche analytique

Comme on l'a appris, pour résoudre ce problème compliqué, on va le découper en plein de petits problèmes simples, chacun résolus par une méthode. Ici, on doit écrire un programme qui prend un nombre, et qui ressort la somme des multiples de 3 ou 5 inférieurs à ce nombre.

Moi, quand je lis ça, je me dis "ok, mon programme va aller de zéro jusqu'à 1000 (par exemple) et à chaque chiffre va tester s'il est multiple de 3 ou 5. Si c'est le cas, il met le chiffre de côté, dans une boite, pour faire une somme à la fin. Si le chiffre n'est pas multiple, on l'oublie et on passe au suivant".

Hum, en écrivant ça sur papier, j'ai identifié 2 choses qui vont composer mon programme final :

    "mon programme va aller de zéro jusqu'à 1000 (par exemple)" => Il va y avoir une boucle !
    "à chaque chiffre [mon programme] va tester s'il est multiple de 3 ou 5" => voilà un problème simple et bien défini : être capable d'identifier si un nombre est multiple de 3 ou 5 !

La boucle, je la mettrais dans ma méthode principale sum_of_3_or_5_multiples(final_number). Par contre, identifier un multiple de 3 ou 5, je peux l'isoler dans une méthode que j'appelerais : is_multiple_of_3_or_5?(n).

En faisant notre approche analytique, on a défini qu'il y avait deux méthodes à écrire et on sait ce qu'elles doivent faire chacunes :
a) la méthode is_multiple_of_3_or_5?(current_number)

Elle vérifie si le chiffre en entrée (current_number) est multiple ou non de 3 ou 5. Elle retourne un booléen (true ou false) en fonction.

Des exemples de sorties attendues de cette méthode selon ce qu'on lui donne en entrée seraient :

    3 ou 5 devraient renvoyer true
    51 ou 45 devraient renvoyer true
    2, 7 ou 64 devraient renvoyer false

b) la méthode sum_of_3_or_5_multiples(final_number)

Elle boucle sur les nombres de 0 à "final_number" : chaque nombre est testé par is_multiple_of_3_or_5?(current_number) pour savoir (à chaque tour de boucle), s'il faut mettre le nombre en question dans la somme finale ou passer au suivant.

Des exemples de sorties attendues de cette méthode selon ce qu'on lui donne en entrée seraient :

    10 devrait renvoyer 23,
    11 devrait renvoyer 33,
    0 ou 3 devraient renvoyer 0,
    -1, 1.23 ou "chiffre" devrait nous donner un truc du genre Yo ! Je ne prends que les entiers naturels. TG.

Grâce à ceci, nous avons l'ossature globale et le contenu de notre programme.

Tu as bien compris le cheminement que j'ai suivi ? Si ce n'est pas le cas, relis la partie 2.1.2. en entier. Calmement.
2.1.3. Écriture des tests

Créé donc un programme de test intitulé multiples_spec.rb, qui ira tester les deux méthodes is_multiple_of_3_or_5?(n) et sum_of_3_and_5_multiples(n) située dans un fichier intitulé multiples.rb. Rien de bien sorcier, cela reprend ce que tu as fait hier. Il faudra y inclure les différents cas entrée-sorties que je t'ai donnés ci-dessus.

Ton programme de test Rspec aura 2 describe différents : un par méthode testée. Et ensuite, sous chacun d'eux, tu auras plusieurs it "***" do pour classer les types de tests qu’on fera. Pour t'aider, je te donne le début de ton code de test :

describe "the is_multiple_of_3_or_5? method" do
  it "should return TRUE when an integer is a multiple of 3 or 5" do
    expect(is_multiple_of_3_or_5?(3)).to eq(true)
    expect(is_multiple_of_3_or_5?(5)).to eq(true)
    expect(is_multiple_of_3_or_5?(51)).to eq(true)
    expect(is_multiple_of_3_or_5?(45)).to eq(true)
  end

  it "should return FALSE when an integer is NOT a multiple of 3 or 5" do
    # je te laisse écrire ces tests-là
  end
end

Fait le même travail avec le describe de sum_of_3_or_5_multiples en le découpant en deux it : le premier quand la méthode doit retourner un résultat (même zéro), le second quand elle refuse l'entrée de l'utilisateur (ça n’est pas un entier naturel).

Comme tu peux le voir, écrire les tests AVANT permet de bien cerner ce que va faire ton programme et de penser aux éventualités auxquelles tu vas être confronté. Écrire ce "cahier des charges" en avance est toute la philosophie du TDD ! Une fois qu'il est rédigé, il ne reste plus qu'à coder les méthodes pour que les tests soient validés.
2.1.3. Coder tes méthodes

Si tu fais tourner les tests juste après les avoir écrits, ton programme en Rspec devrait t'envoyer une sale erreur, car tu n'as pas défini de méthode du tout dans ton fichier multiples.rb. Donc définie ces deux méthodes (vides pour le moment), et fais tourner les tests. Il te dit en théorie que rien ne passe (c'est tout rouge quoi). Reste alors à coder le contenu des méthodes et tout faire passer au vert.

Bon, comment faire le programme ? Commence par écrire la sous-méthode la plus simple : is_multiple_of_3_or_5?(current_number) et débugge-la jusqu'à ce que les tests, que tu as écrit pour elle, fonctionnent tous.

Ensuite il va falloir s'attaquer à la méthode principale sum_of_3_or_5_multiples(final_number). Notre réflexion nous a permis de définir que :

    Elle prend en entrée un Integer et fournie en sortie un autre Integer (tu as écrit les tests en ce sens)
    Elle contient une boucle qui va scanner chaque entier entre zéro et final_number.

Si tu es assez à l'aise en code, lance-toi dès à présent.
Si tu veux encore un peu d'aide, voici un "squelette" de la méthode. Inspire t'en pour la coder.

def sum_of_3_or_5_multiples(final_number)

  final_sum = 0 #cette variable est la somme finale qui sera retournée. Ici on l'initialise à zéro

  # Ici, lance une boucle qui va de zéro au chiffre "final_number" EXCLU (car on est sur du strictement inférieur)
  # cette boucle indente à chaque tour une variable (par exemple "current_number") qui vaudra 0 puis 1 puis 2 ... etc.

    if is_multiple_of_3_or_5?(current_number)
      # si la réponse est "true", alors je rajoute la valeur de "current_number" à la variable "final_sum".
    else
      # si la réponse est "false"…ben y a pas de else : ce "current_number" n'est pas multiple,
      # donc on passe au suivant en oubliant celui-là. On repart dans la boucle.
    end

  #Ici, positionne la fin de la boucle

  return final_sum #on retourne la variable qui contient la somme du tout
end

sum_of_3_or_5_multiples(11) #=> 33
sum_of_3_or_5_multiples(10) #=> 23
