(deffunction ask-value (?question)
    (print ?question)
    (bind ?answer (read))
    ?answer
    )
(deffunction ask-question (?question $?allowed-values)
    (print ?question)
    (bind ?answer (read))
    (if (lexemep ?answer) 
        then (bind ?answer (lowcase ?answer))
	    )
    (while (not (member$ ?answer ?allowed-values)) do
        (print ?question)
        (bind ?answer (read))
        (if (lexemep ?answer) 
            then (bind ?answer (lowcase ?answer))
		    )
	    )
    ?answer
    )
(deffunction yes-or-no (?question)
    (bind ?response (ask-question ?question yes no y n))
    (if (or (eq ?response yes) (eq ?response y))
        then yes 
        else no))


(defrule Zapsshites-na-planoviy-priom
    (not (solution ?)) 
    (Zybnoy-kamen yes)
    =>
    (assert (solution yes))
    	(print "Zapsshites-na-planoviy-priom" crlf)
    )

(defrule Zybnoy-kamen
    (not (solution ?)) 
    (not (Zybnoy-kamen ?)) 
    (Pokrasnenie-slizistoy yes)
    (Vospalilas-desna yes)
        =>
    (assert (Zybnoy-kamen yes))
    )

(defrule Pokrasnenie-slizistoy
    (not (solution ?)) 
    (not (Pokrasnenie-slizistoy ?)) 
    (Nalet-na-zybah yes)
    (Est-karies yes)
        =>
    (assert (Pokrasnenie-slizistoy yes))
    )

(defrule Vospalilas-desna
    (not (solution ?)) 
    (not (Vospalilas-desna ?)) 
    (or 
    (Krovotochit-desna yes)
    (Povishenaya-hyvstvitelnoct yes)
   )
        =>
    (assert (Vospalilas-desna yes))
    )

(defrule Zapsshites-na-planoviy-priom
    (not (solution ?)) 
    (Bol-v-chelysty no)
    =>
    (assert (solution yes))
    	(print "Zapsshites-na-planoviy-priom" crlf)
    )


(defrule Bol-v-chelysty
    (not (solution ?)) 
    (not (Bol-v-chelysty ?)) 
    (Krovotochit-desna no)
    (or 
    (Nalet-na-zybah no)
    (Uazva-vo-rty yes)
    (Skol-zyba yes))
    
    =>
    (assert (Bespokoit-zyb-mydrosty yes))
    )

(defrule Nalet-na-zybah
  (not (solution ?)) 
    (not (Nalet-na-zybah ?)) 
    =>
    (assert (Nalet-na-zybah (yes-or-no "Nalet-na-zybah?: ")))
    )

(defrule Krovotochit-desna
  (not (solution ?)) 
    (not (Krovotochit-desna ?)) 
    =>
    (assert (Krovotochit desna (yes-or-no "Krovotochit desna?: ")))
    )

(defrule Uazva-vo-rty
    (not (solution ?)) 
    (not (Uazva-vo-rty ?)) 
    =>
    (assert (Uazva-vo-rty (yes-or-no "Uazva-vo-rty?: ")))
    )

(defrule Skol-zyba
    (not (solution ?)) 
    (not (Skol-zyba ?)) 
    =>
    (assert (Skol-zyba (yes-or-no "Skol-zyba?: ")))
    )


(defrule Zapsshites-na-planoviy-priom
    (not (solution ?)) 
    (Bespokoit-zyb-mydrosty yes)
    =>
    (assert (solution yes))
    	(print "Zapsshites-na-planoviy-priom" crlf)
    )


(defrule Bespokoit-zyb-mydrosty
    (not (solution ?)) 
    (not (Bespokoit-zyb-mydrosty ?)) 
    (Bol-v-chelysty yes)
    (or 
    (Est-karies no)
    (Ostraya-bol no)
    )
    =>
    (assert (Bespokoit-zyb-mydrosty yes))
    )



(defrule Ostraya-bol
    (not (solution ?)) 
    (not (Ostraya-bol ?)) 
    =>
    (assert (Ostraya-bol (yes-or-no "Ostraya-bol?: ")))
    )

(defrule Est-karies
    (not (solution ?)) 
    (not (Est-karies ?)) 
    =>
    (assert (Bespokoit-zyb-mydrosty (yes-or-no "Est-karies?: ")))
 )

(defrule Bol-v-chelysty
    (not (solution ?)) 
    (not (Bol-v-chelysty ?)) 
    =>
    (assert (Bespokoit-zyb-mydrosty (yes-or-no "Bol-v-chelysty?: ")))
 )

















;------------------------------------------------------------------


(defrule Osmotr-ne-trebuetsya
    (not (solution ?))  
(Svish-na-desne no)
    =>
	(assert (solution yes))
    	(print "Osmotr-ne-trebuetsya" crlf)
)
(defrule Svish-na-desne
	(not (solution ?))	
	( and
		(Vospalilas-desna no)
		(Temperatura no)
	)
	=>
	(assert (Svish-na-desne no))
) 

(defrule Vospalilas-desna
	(not (solution ?))	
	( and
		(Otsytstvyet-zyb no)
		(Bespokoit-zyb-mydrosty  no)
	)
	=>
	(assert (Vospalilas-desna no))
) 
(defrule Temperatura
    (not (solution ?)) 
    (Povishenaya-hyvstvitelnoct no)
    (Uazva-vo-rty no)
    (not (Temperatura ?)) 
    =>
    (assert (Temperatura no)))

(defrule Otsytstvyet-zyb
    (not (solution ?)) 
    (not (Otsytstvyet-zyb ?)) 
    =>
    (assert (Otsytstvyet-zyb (yes-or-no "Otsytstvyet-zyb?: ")))
    )
(defrule Bespokoit-zyb-mydrosty
    (not (solution ?)) 
    (not (Bespokoit-zyb-mydrosty ?)) 
    =>
    (assert (Bespokoit-zyb-mydrosty (yes-or-no "Bespokoit-zyb-mydrosty?: ")))
    )

(defrule Povishenaya-hyvstvitelnoct
    (not (solution ?)) 
    (not (Povishenaya-hyvstvitelnoct ?)) 
    =>
    (assert (Povishenaya-hyvstvitelnoct (yes-or-no "Povishenaya-hyvstvitelnoct?: ")))
    )
(defrule Uazva-vo-rty
    (not (solution ?)) 
    (not (Uazva-vo-rty ?)) 
    =>
    (assert (Uazva-vo-rty (yes-or-no "Uazva-vo-rty?: ")))
    )

(defrule Obratites-ko-vrachy
    (not (solution ?)) 
    (Svish-na-desne yes)
    =>
    (assert (solution yes))
       (print "!Srochno-obratites-ko-vrachy" crlf)
    )

(defrule Svish-na-desne
	(not (solution ?))	
	(and
		(Nepriyatniy-zapah-iz-rta yes)
		( or
			(Temperatura  yes)
			(Ostraya-bol yes)))
	=>
	(assert (Svish-na-desne yes))
 (print "!Svish-na-desne" crlf)
)

(defrule Nepriyatniy-zapah-iz-rta
	(not (solution ?))	
	( and
		(Skol-zyba no)
		(Videlenie-gnoya  yes)
	)
	=>
	(assert (Nepriyatniy-zapah-iz-rta yes))
) 

(defrule Skol-zyba
    (not (solution ?)) 
    (not (Skol-zyba ?)) 
    (or (Temperatura yes)
          (Ostraya-bol yes))
    =>
    (assert (Skol-zyba (yes-or-no "Skol-zyba?: ")))
    )

(defrule Videlenie-gnoya
    (not (solution ?)) 
    (not (Videlenie-gnoya ?)) 
    (or (Temperatura yes)
          (Ostraya-bol yes))
    =>
    (assert (Videlenie-gnoya (yes-or-no "Videlenie-gnoya?: ")))
    )

(defrule Temperatura
    (not (solution ?)) 
    (Ostraya-bol no)
    (not (Temperatura ?)) 
    (temp ?value)
    =>
     (if (> ?value 37.0)
        then (assert (Temperatura yes)) 
        else (assert (Temperatura no))))

(defrule temp
    (not (solution ?))
    (Ostraya-bol no)
    (not (temp ?))
    =>
    (assert (temp (ask-value "Enter your temperature: ")))
    )

(defrule Ostraya-bol
    (not (solution ?)) 
    (not (Ostraya-bol ?)) 
    =>
    (assert (Ostraya-bol (yes-or-no "Ostraya-bol?: ")))
    )





