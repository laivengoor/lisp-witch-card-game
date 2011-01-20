
;card number 0
;36 card deck values 6..A 0..8 9cards
;52 card deck values 2..A 0..12 13cards
;0 Spades 1 Hearts 2 Diamonds 3 Clubs


(defvar card-deck 36)
(defvar card-ring '())


(defun cards-randomize ()
	()
)


(defun cards-amount ( player )
	(length (gplayer-cards player))
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
(defun cards-player-has (deck card)
	(if (find card deck) (not NIL) (not T))
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


;fix make not to be universal. For 2 card-decks
(defun cards-name-input ()
	(prog ()
		(setq r "!!!")
		(cond 
			((= card-deck 36) 
				(prog ()
					(setq run T)
					(loop while (not (not run)) do
						(print "Input card name ([SHDC][2-10]):")
						(setf card-name (string (read)))
						(if (stringp card-name)
							(prog ()
								(print "Thats string")
								(string-upcase card-name)
							)
						)
						(print card-name)
						(if (stringp card-name)
							(cond
								;if card name length 3
								((= (length card-name) 3) 
									(prog ()
										(print "Size3")
										(if (or (string= card-name "S10") (string= card-name "H10") (string= card-name "D10") (string= card-name "C10") ) 
											(prog ()
												(setf r card-name)
												(setf run (not T))
											)
										)
									)
								)
								;if card name length 2
								((= (length card-name) 2)
									(if (and (> (parse-integer card-name :start 1) 1) (< (parse-integer card-name :start 1) 10))
										(prog ()
											(setf r card-name)
											(setf run (not T))
										)
										(
											print "Incorect card name"
										)
									)
								)
								
							)
						)
					)
				)
			)
			((= card-deck 52) 
				(
					
				)
			)
			( T (return -1))
		)
		(return r)
	)
)
