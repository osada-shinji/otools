(defun c:putLengthText (/ *error* main doc obj)
	(vl-load-com)
	(defun main ()
		(princ "\nputLengthtext")
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
		(print (getvar "textstyle"))
		(print (getvar "textsize"))
		(sssetfirst nil)
		(if (setq pick (entsel "\nobj"))
			(progn
				(setq ename (car pick))
				(setq oname (cdr (assoc 0 (entget ename))))
				(setq obj (vlax-ename->vla-object ename))
				(setq lenStr nil)
				(cond
					((= oname "LINE")
						(setq lenStr (rtos (vla-get-Length obj) 2 0))
					)
					((= oname "LWPOLYLINE")
						(setq lenStr (rtos (vla-get-Length obj) 2 0))
					)
					((= oname "ARC")
						(setq lenStr (rtos (vla-get-ArcLength obj) 2 0))
					)
					((= oname "CIRCLE")
						(setq lenStr (rtos (vla-get-Circumference obj) 2 0))
					)
				)
				(if (null lenStr)
					(progn
						(princ "\nend.")
					)
					(progn
						(vla-Highlight obj ':vlax-true)
						(setq spc (getspace doc))
						(setq textObj (vla-AddText spc lenStr (vlax-3d-point '(0 0 0)) (getvar "textsize")))
						(vla-put-Alignment textObj acAlignmentMiddle)
						(setq grloop t)
						(while grloop
							(setq gr (grread t 13 ))
							(cond
								((= (car gr) 2) (onKeyPress gr))
								((= (car gr) 3) (onMouseClicked gr))
								((= (car gr) 5) (onMouseMoved gr))
							)
						)
						(vla-Highlight obj ':vlax-false)
					)
				)
			)
		)
		(vla-EndUndoMark doc)
		(princ)
	)
	(defun onKeyPress (e)
		(setq grloop nil)
	)
	(defun onMouseClicked (e)
		(setq grloop nil)
	)
	(defun onMouseMoved (e)
		(setq ptu (cadr e))
		(setq ptw (trans ptu 1 0))
		(setq neaPt (vlax-curve-getClosestPointTo obj ptw))
		(setq iPt (polar neaPt (+ (angle ptw neaPt) pi) (* (getvar "textsize") 0.9)))
		(vla-put-TextAlignmentPoint textObj (vlax-3d-point iPt))
		(setq ang (+ (angle ptw neaPt) (* pi 0.5)))
		(if (>= ang (* pi 2.0)) (setq ang (- ang (* pi 2.0))))
		(cond
			((and (>= ang 0.0) (< ang (deg->rag 91)))
			)
			((and (>= ang (deg->rag 91)) (< ang (deg->rag 271)))
				(setq ang (+ ang pi))
			)
			((and (>= ang (deg->rag 271)) (< ang (* pi 2.0)))
			)
		)
		(vla-put-Rotation textObj ang)
	)
	(defun deg->rag (d) (* (/ pi 180.0) d))
	(defun rag->deg (r) (* (/ r pi) 180.0))
	(defun getspace(d)
		(if (and (= (vla-get-ActiveSpace d) 0) (= (vla-get-MSpace d) ':vlax-false))
			(vla-get-PaperSpace d)
			(vla-get-ModelSpace d)
		)
	)
	(defun *error*(s)
		(if obj (vla-Highlight obj ':vlax-false))
		(princ s)
		(vla-EndUndoMark doc)
		(princ)
	)
	(main)
)