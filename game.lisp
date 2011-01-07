

(defun random-number (max-n)
	(random max-n)
)

;player number is between 2 and 10
(defun input-player-number ()
	(prog ()
		(print "Input player number:")
		(setq player-number (read))
		(loop while (not (and (numberp player-number) (> player-number 1) (< player-number 11) (not (floatp player-number)))) do
			(print "Input number [2..10]:")
			(setf player-number (read))
		)
		(return player-number)
	)
)

(defun input-player-name ()
	(prog ()
		(print "Input player name: ")
		(setq player-name (read))
		(return player-name)
	)
)

(defun input-card-name ()
	()
)

(defun AI-speak ()
	()
)
