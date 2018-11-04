(defun c:changeColor
	(/
		*error* main
		colorDlg entityData
		modifyIndex modifyTrueColor modifyColorBook
		split doc ss pick
	)
	(defun main ()
		(vl-load-com)
		(princ "\nchangeColor")
		(setq doc (vla-get-ActiveDocument (vlax-get-acad-object)))
		(vla-StartUndoMark doc)
		(setvar "cmdecho" 0)
		(if (setq ss (ssget "_:L"))
			(progn
				(initget " ")
				(setq pick (entsel "\n参考にするオブジェクト選択<カラーダイアログ>:"))
				(cond
					((= pick "") (colorDlg))
					((= (type pick) 'LIST) (entityData (car pick)))
				)
			)
		)
		(vla-EndUndoMark doc)
		(princ)
	)
	(defun colorDlg( / res color)
		(setq res (acad_colordlg 256 t))
		(if res (modifyIndex ss res))
	)
	(defun entityData(ename / data color)
		(setq data (entget ename))
		(cond
			((setq color (cdr (assoc 430 data)))
				(modifyColorBook ss color)
			)
			((setq color (cdr (assoc 420 data)))
				(modifyTrueColor ss color)
			)
			((setq color (cdr (assoc 62 data)))
				(modifyIndex ss color)
			)
			(t
				(modifyIndex ss 256)
			)
		)
	)
	(defun modifyIndex(ss c / cmdecho)
		(cond
			((= c 0) (setq c "ByBlock"))
			((and (> c 0)(< c 255))(setq c (itoa c)))
			((= c 256) (setq c "ByLayer"))
		)
		(command "_.chprop" ss "" "c" c "")
		(princ (strcat "\n" c))
	)
	(defun modifyTrueColor(ss c / cmdecho red green blue)
		(setq blue (itoa (logand c (- (expt 2 8) 1))))
		(setq c (lsh c -8))
		(setq green (itoa (logand c (- (expt 2 8) 1))))
		(setq c (lsh c -8))
		(setq red (itoa (logand c (- (expt 2 8) 1))))
		(setq c (strcat red "," green "," blue))
		(command "_.chprop" ss "" "c" "t" c "")
		(princ (strcat "\n" c))
	)
	(defun modifyColorBook(ss c / lst)
		(setq lst (split c "$"))
		(command "_.chprop" ss "" "c" "co" (car lst) (cadr lst) "")
		(princ (strcat "\n" c))
	)
	(defun split(str ptn / pos)
		(if (setq pos (vl-string-search ptn str))
			(append (list (substr str 1	pos)) (split (substr str (+ (1+ pos) (strlen ptn))) ptn))
			(list str)
		)
	)
	(defun *error*(s)
		(vla-EndUndoMark doc)
		(princ s)
	)
	(apply 'main nil)
)
