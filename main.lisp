(load "player.lisp")
(load "game.lisp")
(load "initscreen.lisp")
(load "card.lisp")

;(print "Start main")
(init-screen-2)

(setf players-number (input-player-number))

(print "Generate player ring")
(generate-player-ring players-number)

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
	;(print "New cycle ------------------------------------------------")
	(dolist (player player-ring)
		(print (gplayer-name player))
		(cards-output (gplayer-cards player))
	)
	(if (eq T (player-if-human-winner))
		(prog ()
			(print "You win you are greate player")
			(end-screen)
			(exit)
		)
	)
	(if (eq T (player-if-human-loser))
		(prog ()
			(print "Sorry but today isnt your day l0z3r")
			(end-screen)
			(exit)
		)
	)	
	(confirm-to-exchange)
	;here is small logic error
	(loop for i from 0 to (- (list-length player-ring) 2) do
		(if (and (not (eq (nth i player-ring) NIL)) (not (eq (nth (+ i 1) player-ring) NIL)))
			(prog ()
				(cards-exchange i (+ i 1))
				(cards-throw-from-player i)
				(cards-throw-from-player (+ i 1))
			)
		)
	)
	;make exchange betwee last and first if there is more then one user
	(if (< 1 (list-length player-ring))
		(cards-exchange (- (list-length player-ring) 1) 0)
	)
	(player-go-out-of-game)
)

(end-screen)
;(print quit-main)



