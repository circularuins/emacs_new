
((digest . "811dddc0f28bc3a7cebfd75a10dff56b") (undo-list nil (7308 . 7310) nil (#("実" 0 1 (fontified t face font-lock-comment-face)) . -7308) nil (#("効" 0 1 (fontified t face font-lock-comment-face)) . -7309) (t 20356 . 25052) nil (#(")" 0 1 (fontified nil)) . 1774) (#("(" 0 1 (fontified t)) . -1774) (t 20356 . 23635) nil (7285 . 7297) nil (#("l" 0 1 (face font-lock-comment-face fontified t)) . -7285) nil (#("i" 0 1 (face font-lock-comment-face fontified t)) . -7286) nil (#("s" 0 1 (face font-lock-comment-face fontified t)) . -7287) nil (#("p" 0 1 (face font-lock-comment-face fontified t)) . -7288) (t 20356 . 21059) nil (#("o" 0 1 (fontified t)) . 11729) nil (11729 . 11730) (t 20356 . 21059) nil (#("
" 0 1 (fontified t face (jaspace-highlight-eol-face))) . -12258) nil (#("
" 0 1 (fontified t face (jaspace-highlight-eol-face))) . -12360) nil (nil rear-nonsticky nil 12460 . 12461) (nil fontified nil 11729 . 12461) (11729 . 12461) nil (#("(e2wm:add-keymap 
 e2wm:pst-minor-mode-keymap
 '((\"<M-left>\" . e2wm:dp-code ) ; codeへ変更
   (\"<M-right>\"  . e2wm:dp-two) ; twoへ変更
   (\"<M-up>\"    . e2wm:dp-doc)  ; docへ変更
   (\"<M-down>\"  . e2wm:dp-dashboard) ; dashboardへ変更
   (\"C-.\"       . e2wm:pst-history-forward-command) ; 履歴進む
   (\"C-,\"       . e2wm:pst-history-back-command) ; 履歴戻る
   (\"C-M-s\"     . e2wm:my-toggle-sub) ; subの表示をトグルする
   (\"prefix L\"  . ielm) ; ielm を起動する（subで起動する）
   (\"M-m\"       . e2wm:pst-window-select-main-command) ; メインウインドウを選択する
   ) e2wm:prefix-key)

(e2wm:add-keymap 
 e2wm:dp-doc-minor-mode-map 
 '((\"prefix I\" . info)) ; infoを起動する
 e2wm:prefix-key)

(defun e2wm:my-toggle-sub () ; Subをトグルする関数
  (interactive)
  (e2wm:pst-window-toggle 'sub t 'main))" 0 16 (fontified nil) 16 17 (fontified nil face (default)) 17 18 (fontified nil face (jaspace-highlight-eol-face)) 18 45 (fontified nil) 45 46 (fontified nil face (jaspace-highlight-eol-face)) 46 50 (fontified nil) 50 60 (fontified nil face font-lock-string-face) 60 78 (fontified nil) 78 80 (fontified nil face font-lock-comment-delimiter-face) 80 87 (fontified nil face font-lock-comment-face) 87 88 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 88 92 (fontified nil) 92 103 (fontified nil face font-lock-string-face) 103 120 (fontified nil) 120 122 (fontified nil face font-lock-comment-delimiter-face) 122 128 (fontified nil face font-lock-comment-face) 128 129 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 129 133 (fontified nil) 133 141 (fontified nil face font-lock-string-face) 141 161 (fontified nil) 161 163 (fontified nil face font-lock-comment-delimiter-face) 163 169 (fontified nil face font-lock-comment-face) 169 170 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 170 174 (fontified nil) 174 184 (fontified nil face font-lock-string-face) 184 207 (fontified nil) 207 209 (fontified nil face font-lock-comment-delimiter-face) 209 221 (fontified nil face font-lock-comment-face) 221 222 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 222 226 (fontified nil) 226 231 (fontified nil face font-lock-string-face) 231 274 (fontified nil) 274 276 (fontified nil face font-lock-comment-delimiter-face) 276 280 (fontified nil face font-lock-comment-face) 280 281 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 281 285 (fontified nil) 285 290 (fontified nil face font-lock-string-face) 290 330 (fontified nil) 330 332 (fontified nil face font-lock-comment-delimiter-face) 332 336 (fontified nil face font-lock-comment-face) 336 337 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 337 341 (fontified nil) 341 348 (fontified nil face font-lock-string-face) 348 375 (fontified nil) 375 377 (fontified nil face font-lock-comment-delimiter-face) 377 389 (fontified nil face font-lock-comment-face) 389 390 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 390 394 (fontified nil) 394 404 (fontified nil face font-lock-string-face) 404 414 (fontified nil) 414 416 (fontified nil face font-lock-comment-delimiter-face) 416 436 (fontified nil face font-lock-comment-face) 436 437 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 437 441 (fontified nil) 441 446 (fontified nil face font-lock-string-face) 446 492 (fontified nil) 492 494 (fontified nil face font-lock-comment-delimiter-face) 494 507 (fontified nil face font-lock-comment-face) 507 508 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 508 529 (fontified nil) 529 530 (fontified nil face (jaspace-highlight-eol-face)) 530 531 (fontified nil face (jaspace-highlight-eol-face)) 531 547 (fontified nil) 547 548 (fontified nil face (default)) 548 549 (fontified nil face (jaspace-highlight-eol-face)) 549 576 (fontified nil) 576 577 (fontified nil face (default)) 577 578 (fontified nil face (jaspace-highlight-eol-face)) 578 582 (fontified nil) 582 592 (fontified nil face font-lock-string-face) 592 602 (fontified nil) 602 604 (fontified nil face font-lock-comment-delimiter-face) 604 613 (fontified nil face font-lock-comment-face) 613 614 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 614 631 (fontified nil) 631 632 (fontified nil face (jaspace-highlight-eol-face)) 632 633 (fontified nil face (jaspace-highlight-eol-face)) 633 634 (fontified nil) 634 639 (fontified nil face font-lock-keyword-face) 639 640 (fontified nil) 640 658 (fontified nil face font-lock-function-name-face) 658 662 (fontified nil) 662 664 (fontified nil face font-lock-comment-delimiter-face) 664 675 (fontified nil face font-lock-comment-face) 675 676 (fontified nil face (jaspace-highlight-eol-face font-lock-comment-face)) 676 690 (fontified nil) 690 691 (fontified nil) 691 692 (fontified nil face (jaspace-highlight-eol-face)) 692 731 (fontified nil) 731 732 (fontified nil rear-nonsticky nil)) . 11729) (nil fontified t 12420 . 12421) (nil fontified t 12419 . 12420) (nil fontified t 12405 . 12419) (nil fontified t 12404 . 12405) (nil fontified t 12393 . 12404) (nil fontified t 12391 . 12393) (nil fontified t 12387 . 12391) (nil fontified t 12369 . 12387) (nil fontified t 12368 . 12369) (nil fontified t 12363 . 12368) (nil fontified t 12362 . 12363) (nil fontified t 12361 . 12362) (nil fontified t 12360 . 12361) (nil fontified t 12343 . 12360) (nil fontified t 12342 . 12343) (nil fontified t 12333 . 12342) (nil fontified t 12331 . 12333) (nil fontified t 12321 . 12331) (nil fontified t 12311 . 12321) (nil fontified t 12307 . 12311) (nil fontified t 12306 . 12307) (nil fontified t 12305 . 12306) (nil fontified t 12278 . 12305) (nil fontified t 12277 . 12278) (nil fontified t 12276 . 12277) (nil fontified t 12260 . 12276) (nil fontified t 12259 . 12260) (nil fontified t 12258 . 12259) (nil fontified t 12237 . 12258) (nil fontified t 12236 . 12237) (nil fontified t 12223 . 12236) (nil fontified t 12221 . 12223) (nil fontified t 12175 . 12221) (nil fontified t 12170 . 12175) (nil fontified t 12166 . 12170) (nil fontified t 12165 . 12166) (nil fontified t 12145 . 12165) (nil fontified t 12143 . 12145) (nil fontified t 12133 . 12143) (nil fontified t 12123 . 12133) (nil fontified t 12119 . 12123) (nil fontified t 12118 . 12119) (nil fontified t 12106 . 12118) (nil fontified t 12104 . 12106) (nil fontified t 12077 . 12104) (nil fontified t 12070 . 12077) (nil fontified t 12066 . 12070) (nil fontified t 12065 . 12066) (nil fontified t 12061 . 12065) (nil fontified t 12059 . 12061) (nil fontified t 12019 . 12059) (nil fontified t 12014 . 12019) (nil fontified t 12010 . 12014) (nil fontified t 12009 . 12010) (nil fontified t 12005 . 12009) (nil fontified t 12003 . 12005) (nil fontified t 11960 . 12003) (nil fontified t 11955 . 11960) (nil fontified t 11951 . 11955) (nil fontified t 11950 . 11951) (nil fontified t 11938 . 11950) (nil fontified t 11936 . 11938) (nil fontified t 11913 . 11936) (nil fontified t 11903 . 11913) (nil fontified t 11899 . 11903) (nil fontified t 11898 . 11899) (nil fontified t 11892 . 11898) (nil fontified t 11890 . 11892) (nil fontified t 11870 . 11890) (nil fontified t 11862 . 11870) (nil fontified t 11858 . 11862) (nil fontified t 11857 . 11858) (nil fontified t 11851 . 11857) (nil fontified t 11849 . 11851) (nil fontified t 11832 . 11849) (nil fontified t 11821 . 11832) (nil fontified t 11817 . 11821) (nil fontified t 11816 . 11817) (nil fontified t 11809 . 11816) (nil fontified t 11807 . 11809) (nil fontified t 11789 . 11807) (nil fontified t 11779 . 11789) (nil fontified t 11775 . 11779) (nil fontified t 11774 . 11775) (nil fontified t 11747 . 11774) (nil fontified t 11746 . 11747) (nil fontified t 11745 . 11746) (nil fontified t 11729 . 11745) (nil rear-nonsticky t 12460 . 12461) nil (12419 . 12420) nil (#(")" 0 1 (fontified t)) . -12419) nil (nil rear-nonsticky nil 12460 . 12461) (nil fontified nil 11729 . 12461) (11729 . 12461) nil (11729 . 11730) (t 20356 . 19552) nil (#(" " 0 1 (face font-lock-comment-face fontified t)) . -7299) (t 20356 . 19547) nil (7299 . 7300) (t 20356 . 19534) nil (7283 . 7299) nil (7263 . 7283) nil (7243 . 7263) nil (7223 . 7243) nil (#("git " 0 4 (face font-lock-comment-face fontified t)) . -7223) nil (#("remote " 0 7 (face font-lock-comment-face fontified t)) . -7227) nil (#("add " 0 4 (face font-lock-comment-face fontified t)) . -7234) nil (#("origin " 0 7 (face font-lock-comment-face fontified t)) . -7238) nil (#("git@" 0 4 (face font-lock-comment-face fontified t)) . -7245) nil (#("github." 0 7 (face font-lock-comment-face fontified t)) . -7249) nil (#("com:" 0 4 (face font-lock-comment-face fontified t)) . -7256) nil (#("circularuins/" 0 13 (face font-lock-comment-face fontified t)) . -7260) nil (#("emacs_" 0 6 (face font-lock-comment-face fontified t)) . -7273) nil (#("new." 0 4 (face font-lock-comment-face fontified t)) . -7279) nil (#("git" 0 3 (face font-lock-comment-face fontified t)) . -7283) nil (7286 . 7287) nil (7222 . 7223) (t 20356 . 19463) nil (7271 . 7289) nil (7251 . 7271) nil (7231 . 7251) nil (7211 . 7231) nil (7210 . 7211) nil (7209 . 7210) nil (7208 . 7209) (t 20355 . 20804) nil (11560 . 11563) nil (11559 . 11560) nil (11547 . 11559) nil (11547 . 11548) nil (11546 . 11547) nil (#("例" 0 1 (fontified t face font-lock-comment-face)) . -11546) nil (11611 . 11614) nil (11591 . 11611) nil (11586 . 11589) nil (11585 . 11587) nil (11581 . 11585) nil (11580 . 11582) nil (11565 . 11580) nil (11564 . 11566) nil (11563 . 11564) nil (11549 . 11562) nil (11548 . 11550) nil (11547 . 11548) nil (11538 . 11547) nil (11537 . 11538) nil (11536 . 11537) nil (11535 . 11536) nil (11535 . 11536) nil (11534 . 11535) (t 20355 . 63688) nil (7240 . 7242) (t 20355 . 4274) nil (7243 . 7263) nil (7242 . 7244) nil (7241 . 7242) nil (7231 . 7240) nil (7230 . 7232) nil (7229 . 7230) nil (7207 . 7208) nil (7204 . 7207) nil (#("\\" 0 1 (fontified t face font-lock-comment-face)) . -7204) nil (7204 . 7205) nil (#(" " 0 1 (fontified t face (font-lock-comment-face default))) . -7204) nil (#("0" 0 1 (fontified t face font-lock-comment-face)) . -7205) nil (7203 . 7206) nil (#(" " 0 1 (fontified t face (font-lock-comment-face default))) . -7203) nil (#("^" 0 1 (fontified t face font-lock-comment-face)) . -7204) nil (7202 . 7205) nil (7201 . 7202) nil (7191 . 7201) nil (7190 . 7191) nil (7189 . 7190) nil (7188 . 7189) nil (7188 . 7189) nil (7189 . 7207) nil (7188 . 7190) nil (7188 . 7189) nil (7187 . 7188) (t 20354 . 39803) nil (11450 . 11452) nil (11430 . 11450) nil (11427 . 11428) nil (11425 . 11427) nil (11424 . 11426) nil (11420 . 11424) nil (11419 . 11421) nil (11408 . 11419) nil (11388 . 11408) nil (11387 . 11389) nil (11385 . 11387) nil (11362 . 11382) nil (11346 . 11359) nil (11345 . 11347) nil (11334 . 11345) nil (11325 . 11333) nil (11305 . 11325) nil (11304 . 11306) nil (11293 . 11304) nil (11287 . 11291) nil (11286 . 11288) nil (11280 . 11286) nil (11279 . 11281) nil (11268 . 11279) nil (11253 . 11267) nil (11252 . 11254) nil (11241 . 11252) nil (11238 . 11239) nil (11218 . 11238) nil (11217 . 11219) nil (11202 . 11217) nil (11186 . 11200) nil (11185 . 11187) nil (11169 . 11185) nil (11168 . 11170) nil (11167 . 11169) nil (11163 . 11167) nil (11162 . 11164) nil (11153 . 11162) nil (11137 . 11153) nil (11136 . 11138) nil (11129 . 11136) nil (11117 . 11129) nil (11116 . 11118) nil (11110 . 11116) nil (11104 . 11107) nil (11103 . 11105) nil (11102 . 11104) nil (11100 . 11102) nil (11083 . 11099) nil (11063 . 11083) nil (11062 . 11064) nil (11053 . 11062) nil (11041 . 11053) nil (11040 . 11042) nil (11032 . 11040) nil (11018 . 11031) nil (11017 . 11019) nil (11014 . 11017) nil (11013 . 11015) nil (11009 . 11013) nil (11002 . 11006) nil (10982 . 11002) nil (10981 . 10983) nil (10976 . 10981) nil (10975 . 10977) nil (10963 . 10975) nil (10962 . 10964) nil (10958 . 10962) nil (10945 . 10957) nil (10944 . 10945) nil (10936 . 10944) nil (10935 . 10936) nil (10932 . 10935) nil (10912 . 10932) nil (10892 . 10912) nil (10891 . 10893) nil (10887 . 10891) nil (10878 . 10886) nil (10877 . 10879) nil (10870 . 10877) nil (10850 . 10870) nil (10849 . 10851) nil (10849 . 10850) (t 20354 . 39534) nil (nil rear-nonsticky nil 10847 . 10848) (nil fontified nil 10830 . 10848) (10830 . 10848) nil (#("n" 0 1 (fontified t)) . -10830) nil (#("e" 0 1 (fontified t)) . -10831) nil (#("w" 0 1 (fontified t)) . -10832) nil (#("s" 0 1 (fontified t)) . -10833) nil (#("t" 0 1 (fontified t)) . -10834) nil (#("i" 0 1 (fontified t)) . -10835) nil (#("c" 0 1 (fontified t)) . -10836) nil (#("k" 0 1 (fontified t)) . -10837) nil (#("e" 0 1 (fontified t)) . -10838) nil (#("r" 0 1 (fontified t)) . -10839) nil (10829 . 10840) nil (10822 . 10829) nil (#("き" 0 1 (fontified t face font-lock-comment-face)) . -10822) nil (#("れ" 0 1 (fontified t face font-lock-comment-face)) . -10823) nil (#("い" 0 1 (fontified t face font-lock-comment-face)) . -10824) nil (#("に" 0 1 (fontified t face font-lock-comment-face)) . -10825) nil (10818 . 10826) nil (#("h" 0 1 (fontified t face font-lock-comment-face)) . -10818) nil (#("e" 0 1 (fontified t face font-lock-comment-face)) . -10819) nil (#("r" 0 1 (fontified t face font-lock-comment-face)) . -10820) nil (#("u" 0 1 (fontified t face font-lock-comment-face)) . -10821) nil (#("p" 0 1 (fontified t face font-lock-comment-face)) . -10822) nil (#("u" 0 1 (fontified t face font-lock-comment-face)) . -10823) nil (#("w" 0 1 (fontified t face font-lock-comment-face)) . -10824) nil (#("o" 0 1 (fontified t face font-lock-comment-face)) . -10825) nil (#(" " 0 1 (fontified t face (font-lock-comment-face default default))) . -10826) nil (10818 . 10827) nil (#("h" 0 1 (fontified t face font-lock-comment-face)) . -10818) nil (#("e" 0 1 (fontified t face font-lock-comment-face)) . -10819) nil (10819 . 10820) nil (10818 . 10819) nil (#("h" 0 1 (fontified t face font-lock-comment-face)) . -10818) nil (#("e" 0 1 (fontified nil face font-lock-comment-face)) . -10819) nil (10818 . 10820) nil (#("h" 0 1 (fontified t)) . -10814) nil (#("e" 0 1 (fontified t)) . -10815) nil (#("r" 0 1 (fontified t)) . -10816) nil (#("u" 0 1 (fontified t)) . -10817) nil (#("p" 0 1 (fontified t)) . -10818) nil (#("u" 0 1 (fontified t)) . -10819) nil (#("w" 0 1 (fontified t)) . -10820) nil (#("o" 0 1 (fontified t)) . -10821) nil (#(" " 0 1 (fontified t)) . -10822) nil (10814 . 10823) nil (10817 . 10818) nil (10816 . 10817) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . -10816) nil (#(" " 0 1 (fontified t face (font-lock-comment-delimiter-face default default))) . -10817) nil (10817 . 10818) nil (10816 . 10817) nil (10815 . 10816) nil (10814 . 10815) nil (10814 . 10815) nil (10814 . 10815) (t 20354 . 38322) nil (#("ooooo" 0 5 (fontified t)) . 2229) nil (2229 . 2234) (t 20354 . 38309) nil (#("
" 0 1 (face (jaspace-highlight-eol-face) fontified t)) . 2229) nil (#("(ac-set-trigger-key \"TAB\")" 0 20 (fontified t) 20 25 (face font-lock-string-face fontified t) 25 26 (fontified t)) . 2229) (t 20354 . 38194) nil (2250 . 2253) nil (2249 . 2251) nil (2230 . 2249) nil (2229 . 2231) nil (2229 . 2230) nil (#("l" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2229) nil (#("o" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2230) nil (#("a" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2231) nil (#("d" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2232) nil (2232 . 2233) nil (#("d" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2232) nil (#("-" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2233) nil (#("s" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2234) nil (#("u" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2235) nil (#("f" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2236) nil (#("f" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2237) nil (2237 . 2238) nil (#("f" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2237) nil (#("i" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2238) nil (#("x" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2239) nil (#("e" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2240) nil (#("s" 0 1 (document ac-symbol-documentation symbol "v" fontified t)) . -2241) nil (2229 . 2242) (#("loa" 0 3 (document ac-symbol-documentation symbol "s" fontified t)) . -2229) nil (2231 . 2232) nil (#("a" 0 1 (document ac-symbol-documentation symbol "s" fontified t)) . -2231) nil (#("d" 0 1 (document ac-symbol-documentation symbol "s" fontified t)) . -2232) nil (2231 . 2233) nil (#("g" 0 1 (document ac-symbol-documentation symbol "s" fontified t)) . -2231) nil (#("i" 0 1 (document ac-symbol-documentation symbol "s" fontified t)) . -2232) nil (#("o" 0 1 (document ac-symbol-documentation symbol "s" fontified t)) . -2233) nil (#("r" 0 1 (document ac-symbol-documentation symbol "s" fontified t)) . -2234) nil (2229 . 2235) (#("lo" 0 2 (fontified t)) . -2229) nil (2229 . 2231) (t 20354 . 37513) nil (#("l" 0 1 (fontified t)) . -2229) nil (#("o" 0 1 (fontified t)) . -2230) (t 20354 . 37507) nil (2233 . 2234) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . -2233) nil (2229 . 2231) (t 20354 . 37491) nil (#("()" 0 1 (fontified t) 1 2 (fontified t)) . 2229) nil (#("ac" 0 2 (fontified t)) . 2230) nil (#("-mo" 0 3 (fontified t)) . 2232) nil (2230 . 2235) (#("ac-mouse-5" 0 6 (document ac-symbol-documentation symbol "f" fontified t) 6 7 (document ac-symbol-documentation symbol "f" fontified t) 7 8 (document ac-symbol-documentation symbol "f" fontified t) 8 9 (document ac-symbol-documentation symbol "f" fontified t) 9 10 (document ac-symbol-documentation symbol "f" fontified t)) . 2230) nil (2239 . 2240) nil (2238 . 2239) nil (2237 . 2238) nil (2236 . 2237) nil (#("s" 0 1 (document ac-symbol-documentation symbol "f" fontified t)) . 2236) nil (2236 . 2237) nil (#("s" 0 1 (document ac-symbol-documentation symbol "f" fontified t)) . -2236) nil (#("e" 0 1 (document ac-symbol-documentation symbol "f" fontified t)) . -2237) nil (#("-" 0 1 (document ac-symbol-documentation symbol "f" fontified t)) . -2238) nil (#("5" 0 1 (document ac-symbol-documentation symbol "f" fontified t)) . -2239) nil (2230 . 2240) (#("ac-mo" 0 5 (fontified t)) . -2230) nil (2232 . 2235) nil (2230 . 2232) nil (2229 . 2231) (t 20354 . 37330) nil (nil rear-nonsticky nil 2228 . 2229) (nil fontified nil 2228 . 2229) (nil fontified nil 2211 . 2228) (nil fontified nil 2206 . 2211) (nil fontified nil 2171 . 2206) (nil fontified nil 2159 . 2171) (nil fontified nil 2158 . 2159) (nil fontified nil 2147 . 2158) (nil fontified nil 2142 . 2147) (nil fontified nil 2107 . 2142) (nil fontified nil 2095 . 2107) (nil fontified nil 2094 . 2095) (nil fontified nil 2091 . 2094) (nil fontified nil 2085 . 2091) (nil fontified nil 2084 . 2085) (nil fontified nil 2074 . 2084) (nil fontified nil 2073 . 2074) (nil fontified nil 2039 . 2073) (2039 . 2229) nil (#("(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd \"C-n\") 'ac-next)
            (define-key ac-completing-map (kbd \"C-p\") 'ac-previous)))
" 0 34 (fontified t) 34 35 (face (jaspace-highlight-eol-face) fontified t) 35 45 (fontified t) 45 46 (fontified t) 46 52 (face font-lock-keyword-face fontified t) 52 55 (fontified t) 55 56 (face (jaspace-highlight-eol-face) fontified t) 56 68 (fontified t) 68 103 (fontified t) 103 108 (face font-lock-string-face fontified t) 108 119 (fontified t) 119 120 (face (jaspace-highlight-eol-face) fontified t) 120 132 (fontified t) 132 167 (fontified t) 167 172 (face font-lock-string-face fontified t) 172 189 (fontified t) 189 190 (face (jaspace-highlight-eol-face) fontified t)) . -1919) nil (#(";; " 0 3 (face font-lock-comment-delimiter-face fontified t)) . -2039) (#(";; " 0 3 (face font-lock-comment-delimiter-face fontified t)) . -1975) (#(";; " 0 3 (face font-lock-comment-delimiter-face fontified t)) . -1954) (#(";; " 0 3 (face font-lock-comment-delimiter-face fontified t)) . -1919) 2121 nil (#("l" 0 1 (fontified t)) . -1775) nil (#("o" 0 1 (fontified t)) . -1776) nil (#("a" 0 1 (fontified t)) . -1777) nil (#("q" 0 1 (fontified t)) . -1778) nil (1778 . 1779) nil (1777 . 1778) nil (1781 . 1782) nil (#(";" 0 1 (face font-lock-comment-delimiter-face fontified t)) . -1781) nil (1775 . 1777) nil (1774 . 1776) (t 20354 . 36629) nil (#("
" 0 1 (fontified t face (jaspace-highlight-eol-face font-lock-comment-face))) . -2118) (t 20354 . 36624) nil (#(";(add-to-list 'load-path \"~/.emacs.d/elisp/\")
" 0 1 (fontified t face font-lock-comment-delimiter-face) 1 45 (fontified t face font-lock-comment-face) 45 46 (fontified t face (jaspace-highlight-eol-face font-lock-comment-face))) . 2120) nil (#(";; (ac-config-default)
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 22 (fontified t face font-lock-comment-face) 22 23 (fontified t face (jaspace-highlight-eol-face font-lock-comment-face))) . 2120) nil (#(";; (require 'auto-complete-config)
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 34 (fontified t face font-lock-comment-face) 34 35 (fontified t face (jaspace-highlight-eol-face font-lock-comment-face))) . 2120) nil (#(";; (add-to-list 'ac-dictionary-directories \"~/.emacs.d/elpa/auto-complete-1.4/dict\")
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 84 (fontified t face font-lock-comment-face) 84 85 (fontified t face (jaspace-highlight-eol-face font-lock-comment-face))) . 2120) nil (2119 . 2120) nil (2046 . 2049) (1979 . 1982) (1955 . 1958) (1917 . 1920) (1884 . 1887) (1856 . 1859) 2101 (t 20354 . 35848) nil (#("/" 0 1 (face font-lock-string-face fontified t)) . -2380) (t 20354 . 35747) nil (2244 . 2245) nil (2391 . 2408) nil (2390 . 2392) nil (2389 . 2390) nil (2382 . 2387) nil (2362 . 2382) nil (2361 . 2363) nil (2342 . 2361) nil (2322 . 2342) nil (2321 . 2323) nil (2320 . 2321) nil (2310 . 2319) nil (2290 . 2310) nil (2289 . 2291) nil (2288 . 2289) nil (2269 . 2286) nil (2268 . 2270) nil (2265 . 2268) nil (2245 . 2265) nil (2244 . 2246) nil (#("/" 0 1 (fontified t)) . -2244) nil (#("t" 0 1 (fontified t)) . -2245) nil (#("m" 0 1 (fontified t)) . -2246) nil (#("p" 0 1 (fontified t)) . -2247) nil (#("/" 0 1 (fontified t)) . -2248) nil (#("a" 0 1 (fontified t)) . -2249) nil (#("u" 0 1 (fontified t)) . -2250) nil (#("t" 0 1 (fontified t)) . -2251) nil (#("o" 0 1 (fontified t)) . -2252) nil (#("-" 0 1 (fontified t)) . -2253) nil (#("c" 0 1 (fontified t)) . -2254) nil (#("o" 0 1 (fontified t)) . -2255) nil (#("m" 0 1 (fontified t)) . -2256) nil (#("p" 0 1 (fontified t)) . -2257) nil (#("l" 0 1 (fontified t)) . -2258) nil (#("e" 0 1 (fontified t)) . -2259) nil (#("t" 0 1 (fontified t)) . -2260) nil (#("e" 0 1 (fontified t)) . -2261) nil (#("-" 0 1 (fontified t)) . -2262) nil (#("1" 0 1 (fontified t)) . -2263) nil (#("." 0 1 (fontified t)) . -2264) nil (#("3" 0 1 (fontified t)) . -2265) nil (#("." 0 1 (fontified t)) . -2266) nil (#("1" 0 1 (fontified t)) . -2267) nil (#("/" 0 1 (rear-nonsticky t fontified t)) . -2268) nil (nil rear-nonsticky nil 2268 . 2269) (nil fontified nil 2244 . 2269) (2244 . 2269) nil (2244 . 2245) (t 20354 . 35435)))
