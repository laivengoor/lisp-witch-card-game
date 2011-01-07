
;card number 0
;36 card deck values 6..A 0..8 9cards
;52 card deck values 2..A 0..12 13cards
;0 Spades 1 Hearts 2 Diamonds 3 Clubs

(defvar card-deck 36)
(defvar card-ring '())

(defun cards-randomize ()
	()
)

(defun cards-get-number ()
	()
)

(defun cards-output ( c )
	(prog ()
		(terpri)
		(dolist (cc c)
			(prin1 (format nil "~A " (cards-card cc)))
		)
		;(terpri)
	)
)

(defun cards-output-cat ( c )
	(prog ()
		(setq str "")
		(dolist (cc c)
			(setf str (concatenate 'string str (cards-card cc)))
		)
		(return str)
	)
)

;check if is same cards
(defun cards-check ()
	()
)

;throw cards from player
(defun cards-throw ()
	()
)

;change cards between players
(defun cards-exchange ()
	()
)

;check if is player card
(defun cards-player-has ()
	()
)

(defun cards-nominal ( card )
	(cond
		((= card-deck 36) 
			(prog ()
				(setq n (mod card 9))
				(if (< n 5)
					(return (write-to-string (+ n 6)))
				)
				(cond
					((= n 5) (return "J"))
					((= n 6) (return "Q"))
					((= n 7) (retrun "K"))
					((= n 8) (return "A"))
				)
			)
		)
		((= card-deck 52) 
			(prog ()
				(setq n (mod card 13))
				(if (< n 9)
					(return (write-to-string (+ n 2)))
				)
				(cond 
					((= n 9) (return "J"))
					((= n 10) (return "Q"))
					((= n 11) (retrun "K"))
					((= n 12) (return "A"))
				)
			)
		)
	)
)

(defun cards-suit ( card )
	(cond
		((= card-deck 36) 
			(prog ()
				(setq n (floor (/ card 9)))
				(cond
					((= n 0) (return "S"))
					((= n 1) (return "H"))
					((= n 2) (return "D"))
					((= n 3) (return "C"))
				)
			)
		)
		((= card-deck 52) 
			(prog ()
				(setq n (floor (/ card 13)))
				(cond
					((= n 0) (return "S"))
					((= n 1) (return "H"))
					((= n 2) (return "D"))
					((= n 3) (return "C"))
				)
			)
		)
	)
)

(defun cards-card ( card )
	(
		concatenate 'string "[" (cards-suit card) (cards-nominal card) "]"
	)
)
