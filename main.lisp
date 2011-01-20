(load "player.lisp")
(load "game.lisp")
(load "initscreen.lisp")
(load "card.lisp")


(init-screen)

;(setf players-number (input-player-number))
;(format t "In game players number ~a" player-number )

(setf card-ring (cards-generate 36))
(cards-output card-ring)
(print card-ring)
(print (cards-randomize card-ring))
(generate-player-ring 5)
(cards-give-to-players player-ring card-ring)
(print-players player-ring)
(dolist (p player-ring)
	(cards-output (gplayer-cards p))
)

;(print (cards-name-input))

(end-screen)
