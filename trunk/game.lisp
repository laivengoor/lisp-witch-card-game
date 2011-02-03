
(defvar game-run T)

(defun random-number (max-n)
	(random max-n)
)


;player number is between 2 and 10
(defun input-player-number ()
	(prog ()
		(print "Input player number:")
		(setq player-number (read))
		(loop while (not (and (numberp player-number) (> player-number 1) (< player-number 5) (not (floatp player-number)))) do
			(print "Input number [2..5]:")
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

(defun input-number (max-n)
	(prog ()
		(format T "~%Number in range[0..~$]:" max-n)
		(setq player-number (read))
		(loop while (not (and (numberp player-number) (>= player-number 0) (<= player-number max-n))) do
			(format T "Input number:")
			(setf player-number (read))
		)
		(return player-number)
	)
)

(defun confirm-to-exchange ( pl )
	(prog ()
		(format T "~%Exchange cards with player '~a' [yY]:" (gplayer-name pl))
		(setq confirm (string (read)))
		(string-upcase confirm)
		(loop while (not (and (string= confirm "Y"))) do
			(format T "Confirm [yY]:")
			(setf confirm (string (read)))
		)
	)
)

(defun AI-speak ()
	()
)
