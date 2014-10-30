;;; dotshare-theme.el --- A color theme for Emacs.

;; Author: Nicolas G. Querol <nicolas.gquerol@gmail.com>
;; URL: https://github.com/ngquerol/dotshare-theme.el
;; Version: 1.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Credits:

;; Based on color-theme-dotshare.el, by Christian Brassat <crshd@mail.com>
;; (http://dotshare.it/dots/191/)

;;; Code:

(deftheme dotshare "A colourful, dark and terminal-friendly theme")

;;; Color palette

(defvar dotshare-colors-alist
  '(("dotshare-fg"       . "#d7d0c7")
    ("dotshare-bg-1"     . "#101010")
    ("dotshare-bg"       . "#151515")
    ("dotshare-bg+1"     . "#202020")
    ("dotshare-bg+2"     . "#5f5f5f")
    ("dotshare-red+1"    . "#f55353")
    ("dotshare-red"      . "#e84f4f")
    ("dotshare-red-1"    . "#ce4646")
    ("dotshare-red-2"    . "#a83939")
    ("dotshare-red-3"    . "#682424")
    ("dotshare-orange"   . "#dfaf8f")
    ("dotshare-yellow"   . "#e1aa5d")
    ("dotshare-yellow-1" . "#c79752")
    ("dotshare-yellow-2" . "#a17a43")
    ("dotshare-green-1"  . "#a2bc7b")
    ("dotshare-green"    . "#b8d68c")
    ("dotshare-green+1"  . "#c3e394")
    ("dotshare-green+2"  . "#9fc59f")
    ("dotshare-green+3"  . "#ceef9d")
    ("dotshare-green+4"  . "#d9fca5")
    ("dotshare-cyan"     . "#6d878d")
    ("dotshare-blue+1"   . "#85cddc")
    ("dotshare-blue"     . "#7dc1cf")
    ("dotshare-blue-1"   . "#6ea9b5")
    ("dotshare-blue-2"   . "#57868f")
    ("dotshare-blue-3"   . "#38565c")
    ("dotshare-blue-4"   . "#304a4f")
    ("dotshare-blue-5"   . "#213236")
    ("dotshare-magenta"  . "#9b64fb"))
  "List of Dotshare colors.
  Colors with +N are lighter, colors with -N are darker.")

(defmacro dotshare-with-color-variables (&rest body)
  "`let' bind all colors defined in `dotshare-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   dotshare-colors-alist))
     ,@body))

(dotshare-with-color-variables
  (custom-theme-set-faces
   'dotshare

   ;;; Built-in

   ;; basic coloring
   `(cursor ((t (:foreground ,dotshare-fg))))
   `(default ((t (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(fringe ((t (:foreground ,dotshare-bg+2 :background ,dotshare-bg))))
   `(escape-glyph-face ((t (:foreground ,dotshare-red))))
   `(header-line ((t (:foreground ,dotshare-yellow
                                  :background ,dotshare-bg-1
                                  :box (:line-width 1 :color ,dotshare-bg-1)))))
   '(button ((t (:underline nil))))
   `(link ((t (:foreground ,dotshare-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,dotshare-yellow-2 :underline t :weight normal))))
   `(highlight ((t (:background ,dotshare-bg-1))))
   `(success ((t (:foreground ,dotshare-green :weight bold))))
   `(warning ((t (:foreground ,dotshare-orange :weight bold))))

   `(minibuffer-prompt ((t (:inherit bold :foreground ,dotshare-yellow))))
   `(menu ((t (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(mode-line ((t (:foreground ,dotshare-fg :background ,dotshare-bg+1
                                :box (:line-width 1 :color ,dotshare-bg+2)))))
   `(mode-line-inactive ((t (:foreground ,dotshare-bg+1 :background ,dotshare-bg+2
                                         :box (:line-width 1 :color ,dotshare-bg+2)))))
   `(region ((t (:background ,dotshare-bg+2))))
   `(secondary-selection ((t (:background ,dotshare-bg+2))))
   `(trailing-whitespace ((t (:background ,dotshare-red))))
   `(vertical-border ((t (:foreground ,dotshare-fg))))

   ;; compilation
   `(compilation-column-face ((t (:foreground ,dotshare-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,dotshare-green))))
   `(compilation-error-face ((t (:foreground ,dotshare-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,dotshare-fg))))
   `(compilation-info-face ((t (:foreground ,dotshare-blue))))
   `(compilation-info ((t (:foreground ,dotshare-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,dotshare-green))))
   `(compilation-line-face ((t (:foreground ,dotshare-yellow))))
   `(compilation-line-number ((t (:foreground ,dotshare-yellow))))
   `(compilation-message-face ((t (:foreground ,dotshare-blue))))
   `(compilation-warning-face ((t (:foreground ,dotshare-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,dotshare-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,dotshare-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,dotshare-yellow :weight bold))))

   ;; font-lock
   `(font-lock-builtin-face ((t (:foreground ,dotshare-blue))))
   `(font-lock-comment-face ((t (:foreground ,dotshare-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,dotshare-green))))
   `(font-lock-constant-face ((t (:foreground ,dotshare-fg))))
   `(font-lock-doc-face ((t (:foreground ,dotshare-green+1))))
   `(font-lock-doc-string-face ((t (:foreground ,dotshare-blue+1))))
   `(font-lock-function-name-face ((t (:foreground ,dotshare-blue))))
   `(font-lock-keyword-face ((t (:foreground ,dotshare-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foregorund ,dotshare-fg))))
   `(font-lock-preprocessor-face ((t (:foreground ,dotshare-blue))))
   `(font-lock-string-face ((t (:foreground ,dotshare-red))))
   `(font-lock-type-face ((t (:foregorund ,dotshare-yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,dotshare-yellow))))
   `(font-lock-warning-face ((t (:foreground ,dotshare-yellow-1 :weight bold :underline t))))
   `(font-lock-pseudo-keyword-face ((t (:foreground ,dotshare-yellow))))
   `(font-lock-operator-face ((t (:foreground ,dotshare-orange))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))

   ;; grep
   `(grep-context-face ((t (:foreground ,dotshare-fg))))
   `(grep-error-face ((t (:foreground ,dotshare-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,dotshare-blue))))
   `(grep-match-face ((t (:foreground ,dotshare-orange :weight bold))))
   `(match ((t (:background ,dotshare-bg-1 :foreground ,dotshare-orange :weight bold))))

   ;; isearch
   `(isearch ((t (:foreground ,dotshare-yellow :background ,dotshare-bg-1))))
   `(isearch-fail ((t (:foreground ,dotshare-fg :background ,dotshare-red-3))))
   `(lazy-highlight ((t (:foreground ,dotshare-yellow :background ,dotshare-bg+2))))

   ;;; external

   ;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,dotshare-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,dotshare-yellow))))
   `(font-latex-italic-face ((t (:foreground ,dotshare-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,dotshare-orange))))

   ;; auto-complete
   `(ac-candidate-face ((t (:foreground ,dotshare-fg :background ,dotshare-bg+2))))
   `(ac-candidate-mouse-face ((t (:background ,dotshare-blue-4))))
   `(ac-selection-face ((t (:foreground ,dotshare-fg :background ,dotshare-blue-1))))
   `(ac-completion-face ((t (:foreground ,dotshare-bg+2 :underline t))))
   `(popup-tip-face ((t (:background ,dotshare-yellow :foreground ,dotshare-bg-1))))
   `(popup-scroll-bar-foreground-face ((t (:background ,dotshare-fg))))
   `(popup-scroll-bar-background-face ((t (:background ,dotshare-bg+2))))
   `(popup-isearch-match ((t (:background ,dotshare-bg :foreground ,dotshare-fg))))

   ;; company-mode
   `(company-tooltip ((t (:foreground ,dotshare-fg :background ,dotshare-bg+1))))
   `(company-tooltip-selection ((t (:background ,dotshare-bg+2))))
   `(company-tooltip-mouse ((t (:background ,dotshare-bg-1))))
   `(company-tooltip-common ((t (:foreground ,dotshare-orange))))
   `(company-tooltip-common-selection ((t (:inherit bold :foreground ,dotshare-green+3))))
   `(company-scrollbar-fg ((t (:background ,dotshare-fg))))
   `(company-scrollbar-bg ((t (:background ,dotshare-bg+2))))
   `(company-preview ((t (:background ,dotshare-green+1))))
   `(company-preview-common ((t (:background ,dotshare-bg-1))))

   ;; diff
   `(diff-added ((,class (:foreground ,dotshare-green+4 :background nil))
                 (t (:foreground ,dotshare-green-1 :background nil))))
   `(diff-changed ((t (:foreground ,dotshare-yellow))))
   `(diff-removed ((,class (:foreground ,dotshare-red :background nil))
                   (t (:foreground ,dotshare-red-3 :background nil))))
   `(diff-refine-added ((t (:inherit diff-added :weight bold))))
   `(diff-refine-change ((t (:inherit diff-changed :weight bold))))
   `(diff-refine-removed ((t (:inherit diff-removed :weight bold))))
   `(diff-header ((,class (:background ,dotshare-bg+2))
                  (t (:background ,dotshare-fg :foreground ,dotshare-bg))))
   `(diff-file-header
     ((,class (:background ,dotshare-bg+2 :foreground ,dotshare-fg :bold t))
      (t (:background ,dotshare-fg :foreground ,dotshare-bg :bold t))))

   ;; ediff
   `(ediff-current-diff-A ((t (:foreground ,dotshare-fg :background ,dotshare-red-3))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,dotshare-fg :background ,dotshare-red-3))))
   `(ediff-current-diff-B ((t (:foreground ,dotshare-fg :background ,dotshare-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,dotshare-fg :background ,dotshare-blue-5))))
   `(ediff-even-diff-A ((t (:background ,dotshare-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,dotshare-bg+1))))
   `(ediff-even-diff-B ((t (:background ,dotshare-bg+1))))
   `(ediff-even-diff-C ((t (:background ,dotshare-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,dotshare-fg :background ,dotshare-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,dotshare-fg :background ,dotshare-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,dotshare-fg :background ,dotshare-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,dotshare-fg :background ,dotshare-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,dotshare-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,dotshare-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,dotshare-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,dotshare-bg+2))))

   ;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,dotshare-yellow :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning))))
   `(erc-default-face ((t (:foreground ,dotshare-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning))))
   `(erc-fool-face ((t (:inherit erc-default))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,dotshare-yellow))))
   `(erc-keyword-face ((t (:foreground ,dotshare-yellow :weight bold))))
   `(erc-nick-default-face ((t (:weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default))))
   `(erc-notice-face ((t (:foreground ,dotshare-green))))
   `(erc-pal-face ((t (:foreground ,dotshare-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,dotshare-orange :background ,dotshare-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,dotshare-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; ert
   `(ert-test-result-expected ((t (:foreground ,dotshare-green+4 :background ,dotshare-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,dotshare-red :background ,dotshare-bg))))

   ;; eshell
   `(eshell-prompt ((t (:foreground ,dotshare-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,dotshare-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment))))
   `(eshell-ls-directory ((t (:foreground ,dotshare-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,dotshare-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,dotshare-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning))))
   `(eshell-ls-product ((t (:inherit font-lock-doc))))
   `(eshell-ls-special ((t (:inherit dotshare-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,dotshare-cyan :weight bold))))

   ;; flx
   `(flx-highlight-face ((t (:foreground ,dotshare-magenta :weight bold))))

   ;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-red-1) :inherit unspecified))
      (t (:foreground ,dotshare-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-yellow) :inherit unspecified))
      (t (:foreground ,dotshare-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-cyan) :inherit unspecified))
      (t (:foreground ,dotshare-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,dotshare-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,dotshare-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,dotshare-cyan :weight bold))))

   ;; flymake
   `(flymake-errline ((t (:foreground ,dotshare-red-1 :weight bold :underline t))))
   `(flymake-warnline ((t (:foreground ,dotshare-yellow-1 :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-orange) :inherit unspecified))
      (t (:foreground ,dotshare-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-red) :inherit unspecified))
      (t (:foreground ,dotshare-red-1 :weight bold :underline t))))

   ;; git-gutter
   `(git-gutter:added ((t (:foreground ,dotshare-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,dotshare-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,dotshare-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,dotshare-fg :weight bold :inverse-video t))))

   ;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,dotshare-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,dotshare-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,dotshare-magenta :weight bold))))

   ;; gnus
   `(gnus-group-mail-1-face ((t (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty-face ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2-face ((t (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty-face ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3-face ((t (:bold t :inherit 'nus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty-face ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4-face ((t (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty-face ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5-face ((t (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty-face ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6-face ((t (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty-face ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low-face ((t (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty-face ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1-face ((t (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2-face ((t (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3-face ((t (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4-face ((t (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5-face ((t (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6-face ((t (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low-face ((t (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content-face ((t (:inherit message-header-other))))
   `(gnus-header-from-face ((t (:inherit message-header-from))))
   `(gnus-header-name-face ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups-face ((t (:inherit message-header-other))))
   `(gnus-header-subject-face ((t (:inherit message-header-subject))))
   `(gnus-summary-cancelled-face ((t (:foreground ,dotshare-orange))))
   `(gnus-summary-high-ancient-face ((t (:foreground ,dotshare-blue))))
   `(gnus-summary-high-read-face ((t (:foreground ,dotshare-green :weight bold))))
   `(gnus-summary-high-ticked-face ((t (:foreground ,dotshare-orange :weight bold))))
   `(gnus-summary-high-unread-face ((t (:foreground ,dotshare-fg :weight bold))))
   `(gnus-summary-low-ancient-face ((t (:foreground ,dotshare-blue))))
   `(gnus-summary-low-read-face ((t (:foreground ,dotshare-green))))
   `(gnus-summary-low-ticked-face ((t (:foreground ,dotshare-orange :weight bold))))
   `(gnus-summary-low-unread-face ((t (:foreground ,dotshare-fg))))
   `(gnus-summary-normal-ancient-face ((t (:foreground ,dotshare-blue))))
   `(gnus-summary-normal-read-face ((t (:foreground ,dotshare-green))))
   `(gnus-summary-normal-ticked-face ((t (:foreground ,dotshare-orange :weight bold))))
   `(gnus-summary-normal-unread-face ((t (:foreground ,dotshare-fg))))
   `(gnus-summary-selected-face ((t (:foreground ,dotshare-yellow :weight bold))))
   `(gnus-cite-1-face ((t (:foreground ,dotshare-blue))))
   `(gnus-cite-10-face ((t (:foreground ,dotshare-yellow-1))))
   `(gnus-cite-11-face ((t (:foreground ,dotshare-yellow))))
   `(gnus-cite-2-face ((t (:foreground ,dotshare-blue-1))))
   `(gnus-cite-3-face ((t (:foreground ,dotshare-blue-2))))
   `(gnus-cite-4-face ((t (:foreground ,dotshare-green+2))))
   `(gnus-cite-5-face ((t (:foreground ,dotshare-green+1))))
   `(gnus-cite-6-face ((t (:foreground ,dotshare-green))))
   `(gnus-cite-7-face ((t (:foreground ,dotshare-red))))
   `(gnus-cite-8-face ((t (:foreground ,dotshare-red-1))))
   `(gnus-cite-9-face ((t (:foreground ,dotshare-red-2))))
   `(gnus-group-news-1-empty-face ((t (:foreground ,dotshare-yellow))))
   `(gnus-group-news-2-empty-face ((t (:foreground ,dotshare-green+3))))
   `(gnus-group-news-3-empty-face ((t (:foreground ,dotshare-green+1))))
   `(gnus-group-news-4-empty-face ((t (:foreground ,dotshare-blue-2))))
   `(gnus-group-news-5-empty-face ((t (:foreground ,dotshare-blue-3))))
   `(gnus-group-news-6-empty-face ((t (:foreground ,dotshare-bg+2))))
   `(gnus-group-news-low-empty-face ((t (:foreground ,dotshare-bg+2))))
   `(gnus-signature-face ((t (:foreground ,dotshare-yellow))))
   `(gnus-x-face ((t (:background ,dotshare-fg :foreground ,dotshare-bg))))

   ;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,dotshare-blue))))
   `(guide-key/key-face ((t (:foreground ,dotshare-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,dotshare-green+1))))

   ;; helm
   `(helm-header
     ((t (:foreground ,dotshare-green
                      :background ,dotshare-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,dotshare-yellow
                      :background ,dotshare-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,dotshare-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,dotshare-bg+1))))
   `(helm-visible-mark ((t (:foreground ,dotshare-bg :background ,dotshare-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,dotshare-green+4 :background ,dotshare-bg-1))))
   `(helm-separator ((t (:foreground ,dotshare-red :background ,dotshare-bg))))
   `(helm-time-zone-current ((t (:foreground ,dotshare-green+2 :background ,dotshare-bg))))
   `(helm-time-zone-home ((t (:foreground ,dotshare-red :background ,dotshare-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,dotshare-orange :background ,dotshare-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,dotshare-magenta :background ,dotshare-bg))))
   `(helm-bookmark-info ((t (:foreground ,dotshare-green+2 :background ,dotshare-bg))))
   `(helm-bookmark-man ((t (:foreground ,dotshare-yellow :background ,dotshare-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,dotshare-magenta :background ,dotshare-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,dotshare-red :background ,dotshare-bg))))
   `(helm-buffer-process ((t (:foreground ,dotshare-cyan :background ,dotshare-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(helm-buffer-size ((t (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(helm-ff-directory ((t (:foreground ,dotshare-cyan :background ,dotshare-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,dotshare-fg :background ,dotshare-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,dotshare-green+2 :background ,dotshare-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,dotshare-red :background ,dotshare-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,dotshare-yellow :background ,dotshare-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,dotshare-bg :background ,dotshare-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,dotshare-cyan :background ,dotshare-bg))))
   `(helm-grep-file ((t (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(helm-grep-finish ((t (:foreground ,dotshare-green+2 :background ,dotshare-bg))))
   `(helm-grep-lineno ((t (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,dotshare-red :background ,dotshare-bg))))
   `(helm-moccur-buffer ((t (:foreground ,dotshare-cyan :background ,dotshare-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,dotshare-fg :background ,dotshare-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,dotshare-fg :background ,dotshare-bg))))

   ;; hl-line-mode
   `(hl-line-face ((,class (:background ,dotshare-bg-1))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,dotshare-bg-1)) ; old emacsen
              (t :weight bold)))

   ;; hl-sexp
   `(hl-sexp-face ((,class (:background ,dotshare-bg+1))
                   (t :weight bold)))

   ;; ido-mode
   `(ido-first-match ((t (:foreground ,dotshare-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,dotshare-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,dotshare-yellow))))
   `(ido-indicator ((t (:foreground ,dotshare-yellow :background ,dotshare-red-3))))

   ;; linum-mode
   `(linum ((t (:foreground ,dotshare-bg+2 :background ,dotshare-bg-1))))

   ;; magit
   `(magit-item-highlight ((t (:background ,dotshare-bg+1))))
   `(magit-section-title ((t (:foreground ,dotshare-yellow :weight bold))))
   `(magit-process-ok ((t (:foreground ,dotshare-green :weight bold))))
   `(magit-process-ng ((t (:foreground ,dotshare-red :weight bold))))
   `(magit-branch ((t (:foreground ,dotshare-blue :weight bold))))
   `(magit-log-author ((t (:foreground ,dotshare-orange))))
   `(magit-log-sha1 ((t (:foreground, dotshare-orange))))

   ;; message-mode
   `(message-cited-text-face ((t (:inherit font-lock-comment))))
   `(message-header-name-face ((t (:foreground ,dotshare-green+1))))
   `(message-header-other-face ((t (:foreground ,dotshare-green))))
   `(message-header-to-face ((t (:inherit 'dotshare-yellow :weight bold))))
   `(message-header-from-face ((t (:inherit 'dotshare-yellow :weight bold))))
   `(message-header-cc-face ((t (:inherit 'dotshare-yellow :weight bold))))
   `(message-header-newsgroups-face ((t (:inherit 'dotshare-yellow :weight bold))))
   `(message-header-subject-face ((t (:inherit 'dotshare-orange :weight bold))))
   `(message-header-xheader-face ((t (:foreground ,dotshare-green))))
   `(message-mml-face ((t (:foreground ,dotshare-yellow :weight bold))))
   `(message-separator-face ((t (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((t (:foreground ,dotshare-orange))))
   `(mew-face-header-from ((t (:foreground ,dotshare-yellow))))
   `(mew-face-header-date ((t (:foreground ,dotshare-green))))
   `(mew-face-header-to ((t (:foreground ,dotshare-red))))
   `(mew-face-header-key ((t (:foreground ,dotshare-green))))
   `(mew-face-header-private ((t (:foreground ,dotshare-green))))
   `(mew-face-header-important ((t (:foreground ,dotshare-blue))))
   `(mew-face-header-marginal ((t (:foreground ,dotshare-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,dotshare-red))))
   `(mew-face-header-xmew ((t (:foreground ,dotshare-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,dotshare-red))))
   `(mew-face-body-url ((t (:foreground ,dotshare-orange))))
   `(mew-face-body-comment ((t (:foreground ,dotshare-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,dotshare-green))))
   `(mew-face-body-cite2 ((t (:foreground ,dotshare-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,dotshare-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,dotshare-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,dotshare-red))))
   `(mew-face-mark-review ((t (:foreground ,dotshare-blue))))
   `(mew-face-mark-escape ((t (:foreground ,dotshare-green))))
   `(mew-face-mark-delete ((t (:foreground ,dotshare-red))))
   `(mew-face-mark-unlink ((t (:foreground ,dotshare-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,dotshare-green))))
   `(mew-face-mark-unread ((t (:foreground ,dotshare-red-2))))
   `(mew-face-eof-message ((t (:foreground ,dotshare-green))))
   `(mew-face-eof-part ((t (:foreground ,dotshare-yellow))))

   ;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,dotshare-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,dotshare-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,dotshare-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,dotshare-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,dotshare-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,dotshare-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,dotshare-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,dotshare-bg+2))))
   `(mu4e-trashed-face ((t (:foreground ,dotshare-bg+2 :strike-through t))))

   ;; nav
   `(nav-face-heading ((t (:foreground ,dotshare-yellow))))
   `(nav-face-button-num ((t (:foreground ,dotshare-cyan))))
   `(nav-face-dir ((t (:foreground ,dotshare-green))))
   `(nav-face-hdir ((t (:foreground ,dotshare-red))))
   `(nav-face-file ((t (:foreground ,dotshare-fg))))
   `(nav-face-hfile ((t (:foreground ,dotshare-red-3))))

   ;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,dotshare-fg :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,dotshare-fg :weight bold))))
   `(org-checkbox ((t (:background ,dotshare-bg+2 :foreground ,dotshare-fg
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,dotshare-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,dotshare-red-1))))
   `(org-done ((t (:bold t :weight bold :foreground ,dotshare-green+3))))
   `(org-formula ((t (:foreground ,dotshare-yellow-2))))
   `(org-headline-done ((t (:foreground ,dotshare-green+3))))
   `(org-hide ((t (:foreground ,dotshare-bg-1))))
   `(org-level-1 ((t (:foreground ,dotshare-orange))))
   `(org-level-2 ((t (:foreground ,dotshare-green+1))))
   `(org-level-3 ((t (:foreground ,dotshare-blue-1))))
   `(org-level-4 ((t (:foreground ,dotshare-yellow-2))))
   `(org-level-5 ((t (:foreground ,dotshare-cyan))))
   `(org-level-6 ((t (:foreground ,dotshare-green-1))))
   `(org-level-7 ((t (:foreground ,dotshare-red-3))))
   `(org-level-8 ((t (:foreground ,dotshare-blue-4))))
   `(org-link ((t (:foreground ,dotshare-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,dotshare-green+4))))
   `(org-scheduled-previously ((t (:foreground ,dotshare-red-3))))
   `(org-scheduled-today ((t (:foreground ,dotshare-blue+1))))
   `(org-special-keyword ((t (:foreground ,dotshare-yellow-1))))
   `(org-table ((t (:foreground ,dotshare-green+2))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,dotshare-orange))))
   `(org-todo ((t (:bold t :foreground ,dotshare-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,dotshare-red :weight bold))))
   `(org-column ((t (:background ,dotshare-bg-1))))
   `(org-column-title ((t (:background ,dotshare-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,dotshare-fg :background ,dotshare-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,dotshare-bg :background ,dotshare-red-1))))
   `(org-ellipsis ((t (:foreground ,dotshare-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,dotshare-cyan :underline t))))

   ;; outline
   `(outline-8 ((t (:inherit default))))
   `(outline-7 ((t (:inherit outline-8 :height 1.0))))
   `(outline-6 ((t (:inherit outline-7 :height 1.0))))
   `(outline-5 ((t (:inherit outline-6 :height 1.0))))
   `(outline-4 ((t (:inherit outline-5 :height 1.0))))
   `(outline-3 ((t (:inherit outline-4 :height 1.0))))
   `(outline-2 ((t (:inherit outline-3 :height 1.0))))
   `(outline-1 ((t (:inherit outline-2  :height 1.0))))

   ;; post-mode
   `(post-email-address-text-face  ((t (:foreground ,dotshare-yellow :weight bold))))
   `(post-emoticon-face  ((t (:foreground ,dotshare-green+2 :weight bold))))
   `(post-header-keyword-face  ((t (:foreground ,dotshare-bg+1))))
   `(post-header-value-face  ((t (:foreground ,dotshare-fg))))
   `(post-multiply-quoted-text-face  ((t (:foreground ,dotshare-orange))))
   `(post-quoted-text-face  ((t (:foreground ,dotshare-yellow))))
   `(post-signature-text-face  ((t (:foreground ,dotshare-bg+2))))
   `(post-underline-face  ((t (:foreground ,dotshare-green))))
   `(post-url-face  ((t (:foreground ,dotshare-blue-2 :underline t))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,dotshare-cyan))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,dotshare-yellow))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,dotshare-blue+1))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,dotshare-red+1))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,dotshare-green+1))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,dotshare-blue-1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,dotshare-green+4))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,dotshare-red-3))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,dotshare-yellow-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,dotshare-green+2))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,dotshare-blue+1))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,dotshare-red-3))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,dotshare-green))))
   `(rpm-spec-doc-face ((t (:foreground ,dotshare-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,dotshare-red))))
   `(rpm-spec-macro-face ((t (:foreground ,dotshare-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,dotshare-red))))
   `(rpm-spec-package-face ((t (:foreground ,dotshare-red))))
   `(rpm-spec-section-face ((t (:foreground ,dotshare-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,dotshare-blue))))
   `(rpm-spec-var-face ((t (:foreground ,dotshare-red))))

   ;; sh-mode
   `(sh-heredoc     ((t (:foreground ,dotshare-yellow :bold t))))
   `(sh-quoted-exec ((t (:foreground ,dotshare-red))))

   ;; show-paren
   `(show-paren-mismatch ((t (:foreground ,dotshare-red+1 :background ,dotshare-bg :weight bold))))
   `(show-paren-match ((t (:foreground ,dotshare-blue+1 :background ,dotshare-bg :weight bold))))

   ;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,dotshare-red+1 :background ,dotshare-bg+2 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,dotshare-bg+2 :weight bold))))

   ;; SLIME
   `(slime-repl-output-face ((t (:foreground ,dotshare-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,dotshare-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-red)))
      (t
       (:underline ,dotshare-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-orange)))
      (t
       (:underline ,dotshare-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-yellow)))
      (t
       (:underline ,dotshare-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,dotshare-green)))
      (t
       (:underline ,dotshare-green))))
   `(slime-highlight-face ((t (:inherit highlight))))

   ;; speedbar
   `(speedbar-button-face ((t (:foreground ,dotshare-green+1))))
   `(speedbar-directory-face ((t (:foreground ,dotshare-blue+1))))
   `(speedbar-file-face ((t (:foreground ,dotshare-fg))))
   `(speedbar-highlight-face ((t (:background ,dotshare-bg+2))))
   `(speedbar-selected-face ((t (:background ,dotshare-bg+1))))
   `(speedbar-separator-face ((t (:foreground ,dotshare-bg+1))))
   `(speedbar-tag-face ((t (:foreground ,dotshare-yellow))))

   ;; tabbar
   `(tabbar-default ((t (:foreground ,dotshare-fg :background ,dotshare-bg+1 :box (:line-width 1 :color ,dotshare-bg+1)))))
   `(tabbar-highlight ((t (:foreground ,dotshare-fg))))
   `(tabbar-selected ((t (:foreground ,dotshare-fg :box (:line-width 1 :color ,dotshare-bg+1)))))
   `(tabbar-button ((t (:background ,dotshare-bg+1))))
   `(tabbar-button-highlight ((t (:foreground ,dotshare-fg))))
   `(tabbar-unselected ((t (:foreground ,dotshare-fg))))
   `(tabbar-separator ((t (:foreground ,dotshare-fg))))

   ;; term
   `(term-color-black ((t (:foreground ,dotshare-bg
                                       :background ,dotshare-bg-1))))
   `(term-color-red ((t (:foreground ,dotshare-red-2
                                     :background ,dotshare-red-3))))
   `(term-color-green ((t (:foreground ,dotshare-green
                                       :background ,dotshare-green+2))))
   `(term-color-yellow ((t (:foreground ,dotshare-orange
                                        :background ,dotshare-yellow))))
   `(term-color-blue ((t (:foreground ,dotshare-blue-1
                                      :background ,dotshare-blue-4))))
   `(term-color-magenta ((t (:foreground ,dotshare-magenta
                                         :background ,dotshare-red))))
   `(term-color-cyan ((t (:foreground ,dotshare-cyan
                                      :background ,dotshare-blue))))
   `(term-color-white ((t (:foreground ,dotshare-fg
                                       :background ,dotshare-fg))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))

   ;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,dotshare-fg :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,dotshare-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,dotshare-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,dotshare-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,dotshare-cyan))))

   ;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,dotshare-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,dotshare-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,dotshare-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,dotshare-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,dotshare-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,dotshare-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,dotshare-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,dotshare-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,dotshare-red))))

   ;; whitespace-mode
   `(whitespace-space ((t (:background ,dotshare-bg+1 :foreground ,dotshare-bg+1))))
   `(whitespace-hspace ((t (:background ,dotshare-bg+1 :foreground ,dotshare-bg+1))))
   `(whitespace-tab ((t (:background ,dotshare-red-1))))
   `(whitespace-newline ((t (:foreground ,dotshare-bg+1))))
   `(whitespace-trailing ((t (:background ,dotshare-red))))
   `(whitespace-line ((t (:background ,dotshare-bg :foreground ,dotshare-magenta))))
   `(whitespace-space-before-tab ((t (:background ,dotshare-orange :foreground ,dotshare-orange))))
   `(whitespace-indentation ((t (:background ,dotshare-yellow :foreground ,dotshare-red))))
   `(whitespace-empty ((t (:background ,dotshare-yellow))))
   `(whitespace-space-after-tab ((t (:background ,dotshare-yellow :foreground ,dotshare-red))))

   ;; wl (wanderlust)
   ;; some faces end with -face, while other don't; confusing
   `(wl-highlight-folder-few-face ((t (:foreground ,dotshare-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,dotshare-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,dotshare-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,dotshare-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,dotshare-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,dotshare-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,dotshare-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,dotshare-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,dotshare-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,dotshare-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,dotshare-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,dotshare-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,dotshare-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,dotshare-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,dotshare-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,dotshare-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,dotshare-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,dotshare-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,dotshare-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,dotshare-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,dotshare-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,dotshare-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,dotshare-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,dotshare-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,dotshare-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((t (:foreground ,dotshare-green+4))))
   ))

;; Theme Variables
(dotshare-with-color-variables
  (custom-theme-set-variables
   'dotshare
   ;; ansi-color
   `(ansi-color-names-vector [,dotshare-bg ,dotshare-red ,dotshare-green ,dotshare-yellow
                                           ,dotshare-blue ,dotshare-magenta ,dotshare-cyan ,dotshare-fg])
   ;; fill-column-indicator
   `(fci-rule-color ,dotshare-bg-1)
   ;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,dotshare-red-1)
       ( 40. . ,dotshare-red)
       ( 60. . ,dotshare-orange)
       ( 80. . ,dotshare-yellow-2)
       (100. . ,dotshare-yellow-1)
       (120. . ,dotshare-yellow)
       (140. . ,dotshare-green-1)
       (160. . ,dotshare-green)
       (180. . ,dotshare-green+1)
       (200. . ,dotshare-green+2)
       (220. . ,dotshare-green+3)
       (240. . ,dotshare-green+4)
       (260. . ,dotshare-cyan)
       (280. . ,dotshare-blue-2)
       (300. . ,dotshare-blue-1)
       (320. . ,dotshare-blue)
       (340. . ,dotshare-blue+1)
       (360. . ,dotshare-magenta)))
   `(vc-annotate-very-old-color ,dotshare-magenta)
   `(vc-annotate-background ,dotshare-bg-1)
   ))

;;; Footer
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'dotshare)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; dotshare-theme.el ends here.
