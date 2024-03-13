(defvar org-alert-interval 300
  "Interval in seconds to recheck and display deadlines.")

;; TODO look for a property of the agenda entry as suggested in
;; https://github.com/spegoraro/org-alert/issues/20
(defvar org-alert-notify-cutoff 10
  "Default time in minutes before a deadline a notification should be sent.")

(defvar org-alert-notify-after-event-cutoff nil
  "Time in minutes after a deadline to stop sending notifications.
If nil, never stop sending notifications.")

(defvar org-alert-notification-title "*org*"
  "Title to be sent with notify-send.")

(defvar org-alert-match-string
  "SCHEDULED>=\"<today>\"+SCHEDULED<\"<tomorrow>\"|DEADLINE>=\"<today>\"+DEADLINE<\"<tomorrow>\""
  "property/todo/tags match string to be passed to `org-map-entries'.")

(defvar org-alert-time-match-string
  "\\(?:SCHEDULED\\|DEADLINE\\):.*<.*\\([0-9]\\{2\\}:[0-9]\\{2\\}\\).*>"
  "regex to find times in an org subtree. The first capture group
is used to extract the time")

(defvar org-alert-cutoff-prop
  "REMINDERN"
  "org property used to set a custom cutoff for an individual entry")

(defvar org-alert-notification-category
  'org-alert
  "The symbol to pass to alert as the :category property, in order
to allow differentiation from other uses of alert")

(provide 'org-alert-parameters)
