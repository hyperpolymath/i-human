;; SPDX-License-Identifier: PMPL-1.0-or-later
;; STATE.scm for i-human

(define state
  '((metadata
     (project . "i-human")
     (version . "0.1.0")
     (updated . "2026-03-14")
     (maintainers . ("Jonathan D.A. Jewell <j.d.a.jewell@open.ac.uk>")))
    (project-context
     (description . "Digital trust and CAPTCHA risk audit tool")
     (domain . "security-tools")
     (languages . ("Rust" "ReScript"))
     (primary-purpose . "Measures CAPTCHA risk profile and provides actionable fixes"))
    (current-position
     (phase . "alpha")
     (overall-completion . 30))
    (blockers-and-issues
     (known-issues . ()))
    (critical-next-actions
     (immediate . ("Implement core risk scoring and signal detection")))))
