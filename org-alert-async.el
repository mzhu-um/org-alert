;;; org-alert.el --- Notify org deadlines via notify-send

;; Copyright (C) 2015 Stephen Pegoraro

;; Author: Stephen Pegoraro <spegoraro@tutive.com>
;; Version: 0.2.0
;; Package-Requires: ((org "9.0") (alert "1.2"))
;; Keywords: org, org-mode, notify, notifications, calendar
;; URL: https://github.com/spegoraro/org-alert

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides functions to display system notifications for
;; any org-mode deadlines that are due in your agenda. To perform a
;; one-shot check call (org-alert-deadlines). To enable repeated
;; checking call (org-alert-enable) and to disable call
;; (org-alert-disable). You can set the checking interval by changing
;; the org-alert-interval variable to the number of seconds you'd
;; like.


;;; Code:
(require 'org-alert-parameters)

;;; switches to turn on or off the alert stuff
(defun org-alert-enable-async ()
  "Enable the notification timer.  Cancels existing timer if running."
  (interactive)
  (org-alert-disable-async)
  (run-at-time 0 org-alert-interval 'org-alert-check-async))

;;; perform one-shot check or kill
(defun org-alert-disable-async ()
  "Cancel the running notification timer."
  (interactive)
  (dolist (timer timer-list)
    (if (eq (elt timer 5) 'org-alert-check-async)
	(cancel-timer timer)))
  (when-let ((buf (get-buffer "*org-alert*")))
    (kill-buffer buf)))

(defun org-alert-check-async ()
  "Enable the notification timer.  Cancels existing timer if running."
  (interactive)
  (let ((buf (get-buffer-create "*org-alert*")))
    (start-process-shell-command
     "org-alert"
     "*org-alert*"
     "bash ~/.emacs.d/async/start.sh")))



(provide 'org-alert-async)
;;; org-alert.el ends here
