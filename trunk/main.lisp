(load "game.lisp")
(load "initscreen.lisp")
(load "player.lisp")
(load "card.lisp")

(init-screen)

(setq p1 (make-null-gplayer "0"))
(print p1)

(generate-player-ring 6)
(print-players player-ring)

(end-screen)
