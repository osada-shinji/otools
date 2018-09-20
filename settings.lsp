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
(vl-catch-all-apply 'setvar '("selectioncycling" 0))

(vl-catch-all-apply 'setvar '("osoptions" 0))
(vl-catch-all-apply 'setvar '("dynmode" 1))

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

;;短縮コマンド



(defun c:b () (command "_break"))
(defun c:c () (command "_copy"))
(defun c:d () (command "_dist"))
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

(defun c:hm () (c:hatchMove))

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

(defun c:ppn () (c:pviewportPan))
(defun c:ptm () (c:pviewportToModel))
(defun c:vl () (c:pviewportLock))

(defun c:rcss () (c:chBylayerColor))
(defun c:srt () (c:srtObj))
(defun c:tc () (c:copyText))


(defun c:res () (load "acaddoc.lsp" nil))

