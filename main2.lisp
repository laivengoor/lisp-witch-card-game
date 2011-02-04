(load "player.lisp")
(load "game.lisp")
(load "initscreen.lisp")
(load "card.lisp")

(print "Start main")

(print "Generate player ring")
(generate-player-ring 2)

(print "Set Human player name")
(setf (gplayer-name (nth 0 player-ring)) player-human-name)

(print "Create card ring")
(setf card-ring (cards-generate 36))

(print "Randomize card-ring")
(setf card-ring (cards-randomize card-ring))

(print "Give cards to players")
(cards-give-to-players player-ring card-ring)

(print "Throw away the same cards")
(dolist (p player-ring)
	(setf (gplayer-cards p) (cards-throw (gplayer-cards p)))
)


(print "Start main loop")
(setf quit-main NIL)
(loop while (not quit-main) do
	(print "New cycle ------------------------------------------------")
	(dolist (p player-ring)
		(print (gplayer-name p))
		(cards-output (gplayer-cards p))
	)
	(confirm-to-exchange)
	;(cards-exchange 0 1)
	;(setf (gplayer-cards (nth 1 player-ring)) (cards-throw (gplayer-cards (nth 1 player-ring))))
	;(player-go-out-of-game)
	(loop for i from 0 to (- (list-length player-ring) 1) do
	)
)
(print quit-main)



