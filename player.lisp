
;all players that are in game
(defvar player-human-name "Human")
(defvar player-ring '())
(defvar players-number '())


;data structure for every player in da game
(defstruct gplayer 
	name	;string
	cards	;list
	endgame ;boolean true if outside game
)

(defun player-go-out-of-game ()
	(prog ()
		;if end game is true
		;(setf player-ring (remove-if #'(lambda (X) (= (gplayer-endgame X) T)) player-ring))
		;if no cards
		(setq old-ring player-ring)
		;(format T "old-ring [~a]" old-ring)
		(loop for i from 0 to (- (list-length old-ring) 1) do
			(if (eq (gplayer-cards (nth i old-ring)) NIL)
				(setf player-ring (remove-if #'(lambda (X) (eq X (nth i old-ring))) player-ring))
			)
		)
		;(setf player-ring (remove-if #'(lambda (X) (= (list-length (gplayer-cards X)) 0)) player-ring))
	)
)


(defun generate-player-ring (n)
	(prog ()
		(loop for i from 1 to n do 
			(setf player-ring (append player-ring (list (make-null-gplayer (write-to-string i)))))
		)
	)
)


(defun make-null-gplayer (name)
	(make-gplayer :name (concatenate 'string "AI " name) :cards '() :endgame NIL)
)


(defun get-player-number ()
	(list-length player-ring)
)


(defun if-player-loser ( p )
	(prog ()
		;if not in game
		(setq player (nth p player-ring))
		(if (= (gplayer-endgame player) T)
			(return)
		)
		(if (= (list-length (gplayer-cards player)) 0)
			(return)
		)
		;if hasnt 2 cards than not yet looser
		(if (/= (list-length (gplayer-cards player)) 2)
			(return)
		)
		;if 2 cards
		(setq cards (gplayer-cards player))
		(if (and (string= (cards-nominal (nth 0 cards)) (cards-nominal (nth 1 cards))) (or (= (nth 0 cards) bad-card) (= (nth 1 bad-card) bad-card)))
			(return T)
		)
		(return)
	)
)

(defun player-if-human-winner ()
	(prog ()
		(dolist (player player-ring)
			(if (string= (gplayer-name player) player-human-name)
				(return-from player-if-human-winner NIL)
			)
		)
		(return-from player-if-human-winner T)
	)
)

(defun print-players (l)
	(loop for i from 0 to (- (list-length l) 1) do
		(print "")
		(format t "Name: ~a Cards: ~a EndGame: ~a"
			(gplayer-name (nth i l))
			(gplayer-cards (nth i l))
			(gplayer-endgame (nth i l))
		)
	)
)

(defun player-card-number (p)
	(list-length (gplayer-list (nth p player-ring)))
)

(defun if-player-human (p)
	(if (string= player-human-name (gplayer-name (nth p player-ring)))
		(return T)
		(return NIL)
	)
)
