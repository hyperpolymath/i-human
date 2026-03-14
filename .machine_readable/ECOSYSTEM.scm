;; SPDX-License-Identifier: PMPL-1.0-or-later
;; ECOSYSTEM.scm for i-human
;; Media Type: application/vnd.ecosystem+scm

(ecosystem
  (version "1.0")
  (name "i-human")
  (type "security-tool")
  (purpose "Digital trust and CAPTCHA risk audit tool")
  (position-in-ecosystem
    (domain "security-tools")
    (role "CAPTCHA risk profiling and signal diagnosis")
    (maturity "alpha"))
  (related-projects
    ((name . "hyperpolymath ecosystem")
     (relationship . part-of)
     (nature . "Security and privacy tools"))))
