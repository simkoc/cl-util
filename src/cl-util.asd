(asdf:defsystem :cl-util
  :author "Simon Koch <projects@halcony.de>"
  :depends-on ()
  :components ((:module "control-flow"
                        :components ((:file "package")
                                     (:file "conditionals")))))
