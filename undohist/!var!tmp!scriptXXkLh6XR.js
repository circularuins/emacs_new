
((digest . "d41d8cd98f00b204e9800998ecf8427e") (undo-list nil (#("var timerID;
var cW = 600;	//キャンバス横サイズ
var cH = 300;	//キャンバス縦サイズ
var i = 0;	//角度の初期値
var div = 5;	//角度の増源値
var objX = 300;	//オブジェクトのX座標
var objY = 150;	//オブジェクトのY座標
var objS;	//オブジェクトのサイズ
var objA;	//オブジェクトの透明度
var maxAlpha = 1;//最大アルファ値
var defScall = 20;	//オブジェクトのデフォルトサイズ
var radiusX = cW / 2 - 50;	//横の半径
var radiusY = cH / 2 - 50;	//縦の半径
window.onload = function() {
	setTimer();
};
function setTimer(){
	clearInterval(timerID);
	timerID = setInterval(\"setMove()\", 50);
}
function setMove(){
	//角度調整
	i += div;
	//パラメータの計算
	divSin = Math.sin(i / 360 * 2 * Math.PI);
	divCos = Math.cos(i / 360 * 2 * Math.PI);
	objX = divSin * radiusX + cW / 2;	//X座標
	objY = divSin * radiusY + cH / 2;	//Y座標
	objS = (divCos + 2) / 2 * defScall;	//大きさ
	objA = (divCos + 2) / 2 * maxAlpha;	//透明度
	
	//描画処理
	draw();
}
function draw() {
	//キャンバスの初期処理
	var canvas = document.getElementById('testCanvas');
	if ( ! canvas || ! canvas.getContext ) return false;
	//2Dコンテキスト
	var ctx = canvas.getContext('2d');
	//表示クリア
	ctx.clearRect(0, 0, cW, cH);
	
	//円を描く
	ctx.beginPath();
	ctx.globalAlpha = objA;
	ctx.fillStyle = \"#CC0000\";
	ctx.arc(objX, objY, objS, 0, Math.PI * 2, false);
	ctx.fill();
	
	//テキストの描画
	ctx.globalAlpha = 1;
	ctx.fillStyle = \"#666666\";
	ctx.fillText(\"X座標：\" + objX, 5, 12);
	ctx.fillText(\"Y座標：\" + objY, 5, 24);
	ctx.fillText(\"大きさ：\" + objS, 5, 36);
	ctx.fillText(\"透明度：\" + objA, 5, 48);
}
" 0 3 (fontified t face font-lock-keyword-face) 3 4 (fontified t) 4 11 (fontified t face font-lock-variable-name-face) 11 13 (fontified t) 13 16 (fontified t face font-lock-keyword-face) 16 17 (fontified t) 17 19 (fontified t face font-lock-variable-name-face) 19 27 (fontified t) 27 29 (fontified t face font-lock-comment-delimiter-face) 29 39 (fontified t face font-lock-comment-face) 39 42 (fontified t face font-lock-keyword-face) 42 43 (fontified t) 43 45 (fontified t face font-lock-variable-name-face) 45 53 (fontified t) 53 55 (fontified t face font-lock-comment-delimiter-face) 55 65 (fontified t face font-lock-comment-face) 65 68 (fontified t face font-lock-keyword-face) 68 69 (fontified t) 69 70 (fontified t face font-lock-variable-name-face) 70 76 (fontified t) 76 78 (fontified t face font-lock-comment-delimiter-face) 78 85 (fontified t face font-lock-comment-face) 85 88 (fontified t face font-lock-keyword-face) 88 89 (fontified t) 89 92 (fontified t face font-lock-variable-name-face) 92 98 (fontified t) 98 100 (fontified t face font-lock-comment-delimiter-face) 100 107 (fontified t face font-lock-comment-face) 107 110 (fontified t face font-lock-keyword-face) 110 111 (fontified t) 111 115 (fontified t face font-lock-variable-name-face) 115 123 (fontified t) 123 125 (fontified t face font-lock-comment-delimiter-face) 125 136 (fontified t face font-lock-comment-face) 136 139 (fontified t face font-lock-keyword-face) 139 140 (fontified t) 140 144 (fontified t face font-lock-variable-name-face) 144 152 (fontified t) 152 154 (fontified t face font-lock-comment-delimiter-face) 154 165 (fontified t face font-lock-comment-face) 165 168 (fontified t face font-lock-keyword-face) 168 169 (fontified t) 169 173 (fontified t face font-lock-variable-name-face) 173 175 (fontified t) 175 177 (fontified t face font-lock-comment-delimiter-face) 177 188 (fontified t face font-lock-comment-face) 188 191 (fontified t face font-lock-keyword-face) 191 192 (fontified t) 192 196 (fontified t face font-lock-variable-name-face) 196 198 (fontified t) 198 200 (fontified t face font-lock-comment-delimiter-face) 200 211 (fontified t face font-lock-comment-face) 211 214 (fontified t face font-lock-keyword-face) 214 215 (fontified t) 215 223 (fontified t face font-lock-variable-name-face) 223 228 (fontified t) 228 230 (fontified t face font-lock-comment-delimiter-face) 230 238 (fontified t face font-lock-comment-face) 238 241 (fontified t face font-lock-keyword-face) 241 242 (fontified t) 242 250 (fontified t face font-lock-variable-name-face) 250 257 (fontified t) 257 259 (fontified t face font-lock-comment-delimiter-face) 259 275 (fontified t face font-lock-comment-face) 275 278 (fontified t face font-lock-keyword-face) 278 279 (fontified t) 279 286 (fontified t face font-lock-variable-name-face) 286 302 (fontified t) 302 304 (fontified t face font-lock-comment-delimiter-face) 304 309 (fontified t face font-lock-comment-face) 309 312 (fontified t face font-lock-keyword-face) 312 313 (fontified t) 313 320 (fontified t face font-lock-variable-name-face) 320 336 (fontified t) 336 338 (fontified t face font-lock-comment-delimiter-face) 338 343 (fontified t face font-lock-comment-face) 343 359 (fontified t) 359 367 (fontified t face font-lock-keyword-face) 367 370 (fontified t) 370 371 (fontified t js--pstate ((nil 0 function 344 ("window" "onload") 387) (nil -2305843009213693952 toplevel nil nil nil))) 371 385 (fontified t) 385 386 (fontified t js--pend (nil 0 function 344 ("window" "onload") 387)) 386 388 (fontified t) 388 396 (fontified t face font-lock-keyword-face) 396 397 (fontified t) 397 405 (fontified t face font-lock-function-name-face) 405 407 (fontified t) 407 408 (fontified t js--pstate ((nil 0 function 389 ("setTimer") 477) (((((nil 0 function 344 ("window" "onload") 387)) nil (:name "[Automatically Generated Class]") nil "window" nil)) -2305843009213693952 toplevel nil nil nil))) 408 457 (fontified t) 457 468 (fontified t face font-lock-string-face) 468 475 (fontified t) 475 476 (fontified t js--pend (nil 0 function 389 ("setTimer") 477)) 476 477 (fontified t) 477 485 (fontified t face font-lock-keyword-face) 485 486 (fontified t) 486 493 (fontified t face font-lock-function-name-face) 493 495 (fontified t) 495 496 (fontified t js--pstate ((nil 0 function 478 ("setMove") 803) (((nil 0 function 389 ("setTimer") 477) (((nil 0 function 344 ("window" "onload") 387)) nil (:name "[Automatically Generated Class]") nil "window" nil)) -2305843009213693952 toplevel nil nil nil))) 496 498 (fontified t) 498 500 (fontified t face font-lock-comment-delimiter-face) 500 505 (fontified t face font-lock-comment-face) 505 517 (fontified t) 517 519 (fontified t face font-lock-comment-delimiter-face) 519 528 (fontified t face font-lock-comment-face) 528 649 (fontified t) 649 651 (fontified t face font-lock-comment-delimiter-face) 651 655 (fontified t face font-lock-comment-face) 655 690 (fontified t) 690 692 (fontified t face font-lock-comment-delimiter-face) 692 696 (fontified t face font-lock-comment-face) 696 733 (fontified t) 733 735 (fontified t face font-lock-comment-delimiter-face) 735 739 (fontified t face font-lock-comment-face) 739 776 (fontified t) 776 778 (fontified t face font-lock-comment-delimiter-face) 778 782 (fontified t face font-lock-comment-face) 782 785 (fontified t) 785 787 (fontified t face font-lock-comment-delimiter-face) 787 792 (fontified t face font-lock-comment-face) 792 801 (fontified t) 801 802 (fontified t js--pend (nil 0 function 478 ("setMove") 803)) 802 803 (fontified t) 803 811 (fontified t face font-lock-keyword-face) 811 812 (fontified t) 812 816 (fontified t face font-lock-function-name-face) 816 819 (fontified t) 819 820 (fontified t js--pstate ((nil 0 function 804 ("draw") nil) (((nil 0 function 478 ("setMove") 803) (nil 0 function 389 ("setTimer") 477) (((nil 0 function 344 ("window" "onload") 387)) nil (:name "[Automatically Generated Class]") nil "window" nil)) -2305843009213693952 toplevel nil nil nil))) 820 822 (fontified t) 822 824 (fontified t face font-lock-comment-delimiter-face) 824 835 (fontified t face font-lock-comment-face) 835 836 (fontified t) 836 839 (fontified t face font-lock-keyword-face) 839 840 (fontified t) 840 846 (fontified t face font-lock-variable-name-face) 846 873 (fontified t) 873 885 (fontified t face font-lock-string-face) 885 889 (fontified t) 889 891 (fontified t face font-lock-keyword-face) 891 928 (fontified t) 928 934 (fontified t face font-lock-keyword-face) 934 935 (fontified t) 935 940 (fontified t face font-lock-constant-face) 940 943 (fontified t) 943 945 (fontified t face font-lock-comment-delimiter-face) 945 954 (fontified t face font-lock-comment-face) 954 955 (fontified t) 955 958 (fontified t face font-lock-keyword-face) 958 959 (fontified t) 959 962 (fontified t face font-lock-variable-name-face) 962 983 (fontified t) 983 987 (fontified t face font-lock-string-face) 987 991 (fontified t) 991 993 (fontified t face font-lock-comment-delimiter-face) 993 999 (fontified t face font-lock-comment-face) 999 1029 (fontified t) 1029 1032 (fontified nil) 1032 1034 (face font-lock-comment-delimiter-face fontified nil) 1034 1039 (face font-lock-comment-face fontified nil) 1039 1099 (fontified nil) 1099 1108 (face font-lock-string-face fontified nil) 1108 1177 (fontified nil) 1177 1179 (face font-lock-comment-delimiter-face fontified nil) 1179 1187 (face font-lock-comment-face fontified nil) 1187 1226 (fontified nil) 1226 1235 (face font-lock-string-face fontified nil) 1235 1251 (fontified nil) 1251 1257 (face font-lock-string-face fontified nil) 1257 1288 (fontified nil) 1288 1294 (face font-lock-string-face fontified nil) 1294 1325 (fontified nil) 1325 1331 (face font-lock-string-face fontified nil) 1331 1362 (fontified nil) 1362 1368 (face font-lock-string-face fontified nil) 1368 1387 (fontified nil)) . 1) (t 20227 . 12435) ((marker . 1) . -1387)))
