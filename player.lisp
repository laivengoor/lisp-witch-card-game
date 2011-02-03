
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
		(setf player-ring (remove-if #'(lambda (X) (= (gplayer-endgame X) T)) player-ring))
		;if no cards
		(setf player-ring (remove-if #'(lambda (X) (= (list-length (gplayer-cards X)) 0))))
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
	(make-gplayer :name (concatenate 'string "AI " name) :cards '() :endgame T)
)


(defun get-player-number ()
	(list-length player-ring)
)


(defun if-player-loser ( p )
	(prog ()
		;if not in game
		(if (= (gplayer-endgame (nth p player-ring)) T)
			(return)
		)
		(if (= (list-length (gplayer-cards (nth p player-ring))) 0)
			(return)
		)
		;if hasnt 2 cards than not yet looser
		(if (/= (list-length (gplayer-cards (nth p player-ring))) 2)
			(return)
		)
		;if 2 cards
		(setq cards (gplayer-cards (nth p player-ring)))
		(if (and (string= (cards-nominal (nth 0 cards)) (cards-nominal (nth 1 cards))) (or (= (nth 0 cards) bad-card) (= (nth 1 bad-card) bad-card)))
			(return T)
		)
		(return)
	)
)

(defun if-player-not-loser ( p )
	(
		return NIL
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
