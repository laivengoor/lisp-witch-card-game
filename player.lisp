
;all players that are in game
(defvar player-ring '())
(defvar players-number '())


;data structure for every player in da game
(defstruct gplayer 
	name	;string
	cards	;list
	endgame ;boolean true if outside game
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


(defun if-player-loser ()
	()
)

(defun if-player-not-loser ()
	()
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
