(defun c:easyBlock (/ *error* main doc ss pt)
	(defun main()
		(vl-load-com)
		(setq doc (vla-get-ActiveDocument (vlax-get-acad-object)))
		(vla-StartUndoMark doc)
		(princ "\n🍙easyBlock")
		(if (setq ss(ssget "_:L"))
			(progn
				(initget 1)
				(setq pt (getpoint "\n基点を指示:"))
				(command "._copybase" "_non" pt ss "")
				(command "._pasteblock" "_non" pt)
				(command "._erase" "_p" "")
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