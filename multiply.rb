# TODO: Utilise un nom d'argument plus logique, comme par exemple "input" ou "value"
def is_multiple_of_3_or_5?(n)
  # TODO: Ton entrée est déjà sensée être de type INTEGER, donc tu peux virer le "n.to_i"
  n.to_i
  # TODO: Tu n'as pas besoin d'initialiser une variable "result".
  # Ici, tu tapes dans des problématiques de "flow control". Le principe est qu'il faut
  # identifier un "retour facile" pour couper l'éxécution le plus tôt possible, puis
  # écrémer les cas un par un.
  #
  # En approche un peu plus clean, tu pourrais faire ça:
  #   return true if n % 3 == 0
  #   return true if n % 5 == 0
  #   false
  #
  # Tu pourrais être tentée d'utiliser if/else avec des return, mais c'est moins lisible. Avec
  # la nomenclature ci-dessus, tu vois de suite "okay, on sort de la fonction ici".
  #
  # Aussi, pour l'habitude, une fonction retourne TOUJOURS sa dernière valeur. Donc si tu gardes
  # ta méthode telle quelle et retire le print à la fin, tu peux l'écrire ainsi:
  #   if n % 3 == 0 or n % 5 == 0
  #     true
  #   else
  #     false
  #   end
  #
  # Et pour vraiment la solution la plus "ruby-style", la fonction tient sur une seule ligne:
  #   def is_multiple_of_3_or_5?(n)
  #     (n % 3 == 0) || (n % 5 == 0)
  #   end
  #
  # Pour le choix de "or" ou "||", en général on utilise plutôt "||" car "or" et "and" ont des
  # priorités différentes et peuvent mener à la confusion.
  result = 0
  if n % 3 == 0 or n % 5 == 0
    result = true
  else
    result = false
  end
  print result
end 



def sum_of_3_or_5_multiples(final_number)
  
  final_sum = 0
  # Pour itérer de 0 à x, utilise plutôt la méthode Number#upto de cette manière:
  #   0.upto(n){|i| puts i }
  final_number.times do |i|
    # Quand l'instruction contenue dans ton "if" tient sur une seule ligne, préfère
    # la structure suivante:
    #   final_sum += i if is_multiple_of_3_or_5?(i)
    #
    # Evite aussi d'utiliser "if X == true", en général tu n'as pas besoin de vérifier
    # le true, il est implicite.
    if is_multiple_of_3_or_5?(i) == true
      final_sum += i 
    end
  end
  return final_sum
  # Pour une solution one-liner en abusant des énumérables, tu peux les combiner ainsi:
  #   1.upto(n).select{|i| is_multiple_of_3_or_5?(i) }.reduce(&:+)
  #
  # La méthode "Interger#upto" va énumèrer les chiffres de 1 à n.
  # La méthode "Enumerable#select" va sélectionner les éléments remplissant la condition
  # passée en block.
  # La méthode "Enumerable#reduce" va "réduire" ton array en appliquant une opération entre
  # tous les membres un à un. Donc [1,2,3].reduce(&:+) donner "(1 + 2) + 3".
  #
  # La notation "reduce(&:+)" est équivalent à "reduce{|a, b| a + b }".
  # C'est une notation qui marche dans certains cas (par exemple: "array_of_words.map(&:capitalize)")
  # pour faciliter la lecture.
  #
  #
  # Ou sinon, pour utiliser une manière similaire à celle de ta variable "final_item", il y a ça:
  #   1.upto(n).inject(0){|acc, i| acc += is_multiple_of_3_or_5?(i) ? i : 0 }
  #
  # La méthode "Enumerable.inject" est sympa à utiliser pour obtenir le "résultat" d'une suite
  # d'éléments. Elle marche avec QUATRE éléments.
  # - Tu passes la valeur de départ en paramètre (le 0).
  # - Un block va être éxécuté sur chacun des éléments de ton array.
  # - Le premier argument du block est "l'accumulateur". Au premier passage, il est à zéro. Au
  #   passages suivant, il sera égale à la valeur retournée au block précédent.
  # - Le second argument du block est l'élément sur lequel passe actuellement le block.
  #
  # Je te conseille le bout de code suivant pour avoir une meilleure idée de comment il marche:
  #   1.upto(5).inject(0){|acc, i| puts "__#{acc}__#{i}__"; acc += i if i == 3; acc }
  #
  #
  # ATTENTION:
  # Les deux méthodes ci-dessus ne fonctionnent PAS pareil. La première (select+reduce) va itérer
  # sur un array de 1000 éléments et retourner un second array un peu plus petit d'éléments qui
  # passeront le sélect, qui sera à nouveau itéré par le "reduce". Sur un set de grande taille,
  # tu peux être dans une situation où tu utiliseras trop de mémoire et cela ralentira ton code.
  #
  # La seconde méthode, va itérer UNE SEULE FOIS, et mettra à jour l'accumulateur à chaque passage,
  # mais ne crééera pas de second array, ce qui utilisera donc moins de mémoire.
end




puts is_multiple_of_3_or_5?(12)
puts sum_of_3_or_5_multiples(12)
