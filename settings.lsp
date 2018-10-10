(vl-load-com)
;;システム変数　レジストリ
(setvar "coords" 2)
(setvar "cursorsize" 100)
(setvar "filedia" 1)
(setvar "bindtype" 1)
(setvar "dragmode" 2)
(setvar "edgemode" 1)
(setvar "hpname" "SOLID")
(setvar "pickbox" 6)
(setvar "pickstyle" 0)
(setvar "polarang" (/ pi 12))
(setvar "proxynotice" 0)
(setvar "sortents" 127)
(vl-catch-all-apply 'setvar '("vtenable" 0))
(vl-catch-all-apply 'setvar '("zoomfactor" 70))
(vl-catch-all-apply 'setvar '("draworderctl" 0))
(vl-catch-all-apply 'setvar '("selectioncycling" 0))
(vl-catch-all-apply 'setvar '("selectionpreview" 0))
(vl-catch-all-apply 'setvar '("selectionarea" 0))
(vl-catch-all-apply 'setvar '("secureload" 0))
(vl-catch-all-apply 'setvar '("dtexted" 1))
(vl-catch-all-apply 'setvar '("layernotify" 0))
(vl-catch-all-apply 'setvar '("osoptions" 0))
(vl-catch-all-apply 'setvar '("dynmode" 1))
(vl-catch-all-apply 'setvar '("layerdlgmode" 0))
(vl-catch-all-apply 'setvar '("dynpicoords" 1)) ;絶対座標
(vl-catch-all-apply 'setvar '("hqgeom" 0))
(vl-catch-all-apply 'setvar '("linesmoothing" 0))
(vl-catch-all-apply 'setvar '("rollovertips" 0))

;;システム変数　図面
(setvar "dimassoc" 1)
(setvar "filletrad" 0)
(setvar "mirrtext" 0)
(setvar "cecolor" "ByLayer")
(setvar "celtype" "ByLayer")
(setvar "celtscale" 1)
(setvar "celweight" -1)
(setvar "ucsicon" 1)
(vl-catch-all-apply 'setvar '("clayer" "0"))
(setvar "snapmode" 0)
(vl-catch-all-apply 'setvar '("draworderctl" 0))

;;短縮コマンド
(defun c:b () (command "_break"))
(defun c:c () (command "_copy"))
(defun c:ca () (command "_laymcur"))
(defun c:cu () (command "_laycur"))
(defun c:d () (command "_dist"))
(defun c:dd () (command "_ddedit"))
(defun c:et () (command "_extend"))
(defun c:t () (command "_trim"))
(defun c:n () (command "_matchprop"))
(defun c:nn () (command "_matchprop"))
(defun c:o () (command "_offset" "l" "s" "e" "n"))
(defun c:oo () (command "_offset" "l" "c" "e" "n"))
(defun c:ooo () (command "_offset" "l" "s" "e" "y"))

(defun c:anb () (c:angBlock))
(defun c:anh () (c:angHatch))
(defun c:ant () (c:angText))

(defun c:at () (c:alignmentText))
(defun c:bgc () (c:bgcCtrl))
(defun c:hm () (c:hatchMove))

(defun c:ee () (c:easyExtend))

(defun c:ed () (c:extEditor))
(defun c:xt () (c:exchangeText))
(defun c:g () (c:grip))
(defun c:gr () (c:changeLayer))
(defun c:ra () (c:layAllOn))
(defun c:fa () (c:layAllOff))
(defun c:rss () (c:laySSOn))
(defun c:fss () (c:laySSOff))
(defun c:rs () (c:layPickNestOn))
(defun c:rn () (c:layPickNestOn))
(defun c:fs () (c:layPickNestOff))
(defun c:fn () (c:layPickNestOff))
(defun c:rev () (c:layRev))
(defun c:ext () (c:exchangetext))
(defun c:cc () (c:stackCopy))
(defun c:ccc () (c:stackCopy))
(defun c:para () (c:parallelogram))
(defun c:ppn () (c:pviewportPan))
(defun c:ptm () (c:pviewportToModel))
(defun c:vl () (c:pviewportLock))
(defun c:rcss () (c:chBylayerColor))
(defun c:srt () (c:srtObj))
(defun c:tc () (c:copyText))


(defun c:fb() (ssget '((0 . "INSERT"))))
(defun c:fci() (ssget '((0 . "CIRCLE"))))
(defun c:fd() (ssget '((0 . "DIMENSION"))))
(defun c:fh() (ssget '((0 . "HATCH"))))
(defun c:fli() (ssget '((0 . "LINE"))))
(defun c:fmt() (ssget '((0 . "MTEXT"))))
(defun c:fp() (ssget '((0 . "POINT"))))
(defun c:fpl() (ssget '((0 . "LWPOLYLINE"))))
(defun c:fso() (ssget '((0 . "3DSOLID"))))
(defun c:ft() (ssget '((0 . "TEXT"))))

(defun c:df() (startapp "explorer" (getvar "dwgprefix")))


;;hojo line
(defun c:rayU (/ *error*)
	(if (setq pt (getpoint "\npt:"))(command "_.ray" "_non" pt "_non" "@0,1" ""))
)
(defun c:rayD (/ *error*)
	(if (setq pt (getpoint "\npt:"))(command "_.ray" "_non" pt "_non" "@0,-1" ""))
)
(defun c:rayL (/ *error*)
	(if (setq pt (getpoint "\npt:"))(command "_.ray" "_non" pt "_non" "@-1,0" ""))
)
(defun c:rayR (/ *error*)
	(if (setq pt (getpoint "\npt:"))(command "_.ray" "_non" pt "_non" "@1,0" ""))
)
(defun c:xx (/ *error*)
	(if (setq pt (getpoint "\npt:"))(command "_.xline" "_non" pt "_non" "@1,0" ""))
)
(defun c:yy (/ *error*)
	(if (setq pt (getpoint "\npt:"))(command "_.xline" "_non" pt "_non" "@0,1" ""))
)

(defun c:res () (load "acaddoc.lsp" nil))
