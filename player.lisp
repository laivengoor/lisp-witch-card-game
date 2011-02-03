
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

(defun player-go-out-of-game (p)
	(prog ()
		(setq pl (player-ring p))
		(setf player-ring (remove-if #'(lambda (X) (= X pl)) (player-ring)))
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
	(if (= (list-length (gplayer-cards (nth p player-ring))) 1)
		(if (= (nth 0 (gplayer-cards (nth p player-ring))) bad-card)
			(return T)
			(return NIL)
		)
		(return NIL)
	)
)

(defun if-player-not-loser ( p )
	(if (= 0 (list-length (gplayer-cards (nth p player-ring))))
		(return T)
		(return NIL)
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
