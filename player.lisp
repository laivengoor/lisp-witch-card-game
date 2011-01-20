
;all players that are in game
(defvar player-ring '())


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
	(make-gplayer :name name :cards '() :endgame T)
)


(defun get-player-number ()
	(- (list-length player-ring) 1)
)


(defun if-player-loser ()
	()
)


(defun print-players (l)
	(dolist (ll l)
		(prog ()
			(format t "Name: ~a Cards: ~a EndGame: ~a" (gplayer-name ll) (gplayer-cards ll) (gplayer-endgame ll))
			(print "")
		)
	)
)
