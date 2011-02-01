(load "player.lisp")
(load "game.lisp")
(load "initscreen.lisp")
(load "card.lisp")


(init-screen)

;players in game
;(setf players-number (input-player-number))
;(format t "In game players number ~a" player-number )
(generate-player-ring 5)
(setf (gplayer-name (nth 0 player-ring)) "Human Player")


(setf card-ring (cards-generate 36))
(cards-output card-ring)
;(print card-ring)
(setf card-ring (cards-randomize card-ring))
(cards-give-to-players player-ring card-ring)
;(print-players player-ring)

(print "Step 1")
(dolist (p player-ring)
	(cards-output (gplayer-cards p))
)

(print "Step 2")
(dolist (p player-ring)
	(setf (gplayer-cards p) (cards-throw (gplayer-cards p)))
)

(print "Step 3")
(dolist (p player-ring)
	(print (gplayer-name p))
	(cards-output (gplayer-cards p))
)

;(cards-exchange 0 1 )
;(print "")
;(confirm-to-exchange (nth 1 player-ring))


(end-screen)
