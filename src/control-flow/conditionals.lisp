(in-package :de.halcony.projects.cl-util.control-flow)

(defmacro aif (condition then else)
  `(let ((it ,condition))
     (if ,it
         ,then
         ,else)))


(defmacro secase (var &body clauses)
  (let ((possible-matches (mapcar #'car clauses)))
  `(cond
     ,@(mapcar (lambda (clause)
                 (assert (listp clause))
                 (assert (stringp (car clause)))
                 `((string= ,(car clause) ,var)
                   ,@(cdr clause)))
               clauses)
     (T
      (error (format nil ,(format nil "~~a does not match any of {~{~a~^,~}}" possible-matches)
                     ,var))))))
