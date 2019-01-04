(defun c:setScaleFactor (/ *error* main doc)
	(vl-load-com)
	(defun main()
		(princ "\nsetScaleFactor")
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
		(if (setq ss (ssget "_:L" '((0 . "*DIMENSION*"))))
			(progn
				(initget 7)
				(setq sf (getreal "\nscaleFactor:"))
				(setq i 0)
				(repeat (sslength ss)
					(setq obj (vlax-ename->vla-object (ssname ss i)))
					(vla-put-ScaleFactor obj sf)
					(vla-Update obj)
					(setq i (1+ i))
				)
			)
		)
		(vla-EndUndoMark doc)
		(princ)
	)
	(defun *error*(s)
		(princ s)
		(vla-EndUndoMark doc)
		(princ)
	)
	(main)
)
