
((digest . "bec2dad157fa8a6abb74b28c5aadd99e") (undo-list (2190 . 2191) 1084 nil (nil rear-nonsticky nil 2189 . 2190) (nil fontified nil 1 . 2190) (1 . 2190) nil (#("// ページ読み込み時に初期設定関数を呼び出し
window.onload = function() {
	commoninit('asteroids', '0_3_1');
	asteroidsinit();
};

// フォームの値を設定
function forminit() {
	document.prefform.p0.selectedIndex = com.p[0];
	document.prefform.p1.selectedIndex = com.p[1];
	document.prefform.p2.selectedIndex = com.p[2];
}

// フォームの値を取得
function formval() {
	return document.prefform.p0.selectedIndex + '_' + document.prefform.p1.selectedIndex + '_' + document.prefform.p2.selectedIndex;
}

// 初期設定
function asteroidsinit() {
	var i, el;
	
	// 時刻カウント間隔
	cn = document.prefform.p0.options[com.p[0]].value;
	// 隕石の数
	n = document.prefform.p1.options[com.p[1]].value;
	// 俯瞰する角度
	an = document.prefform.p2.options[com.p[2]].value;
	
	// 隕石に使われる文字
	as = new Array('●', '■', '◆', '★');
	// 半径から速度を求める係数
	k = 10000;
	// 視点の位置（100程度：原点近く～1000程度：遠く）
	p = 400;
	// 回転中心のx座標
	cx0 = com.w * 0.5;
	// 回転中心のy座標
	cy0 = com.h * (0.5 - an / 384);
	// y-z平面に対する軌道の傾斜
	qa0 = -an;
	// x-y平面に対する軌道の傾斜
	qb0 = -15;
	// 基本カラー
	c = new Array(100, 60);
	// HTMLファイルの名前
	com.f = 'asteroids.html';
	
	// 各隕石ごとの配列を用意
	r  = new Array();	// 軌道半径
	cx = new Array();	// 回転中心のx座標のぶれ
	cy = new Array();	// 回転中心のy座標のぶれ
	qa = new Array();	// y-z平面に対する軌道の傾斜のぶれ
	qb = new Array();	// x-y平面に対する軌道の傾斜のぶれ
	th = new Array();	// 初期位相
	s  = new Array();	// 周回速度（正：時計回り、負：反時計回り）
	cr = new Array();
	cg = new Array();
	cb = new Array();
	
	// 隕石の生成
	for(i = 0; n > i; i++) {
		el = document.createElement('span');
		el.id = i;
		el.className = 'asteroids';
		el.innerHTML = as[Math.floor(Math.random() * as.length)];
		document.body.appendChild(el);
	}
	
	// 各隕石のパラメータ
	for(i = 0; n > i; i++) {
		r[i]  = com.w * (0.1 + i * 0.9 / n) / 2;
		cx[i] = com.w / 50 * (Math.random() - 0.5);
		cy[i] = com.w / 50 * (Math.random() - 0.5);
		qa[i] = (qa0 + 16 * (Math.random() - 0.5)) * Math.PI / 180;
		qb[i] = (qb0 + 16 * (Math.random() - 0.5)) * Math.PI / 180;
		th[i] = Math.random() * 2 * Math.PI;
		s[i]  = -Math.sqrt(k / (r[i] * r[i] * r[i])) * cn / 100;
		cr[i] = c[Math.floor(Math.random() * 2)];
		cg[i] = c[Math.floor(Math.random() * 2)];
		cb[i] = c[Math.floor(Math.random() * 2)];
	}
	
	// 経過時間
	t = 0;
	// 原始太陽系関数を呼び出し
	asteroids();
}

// 原始太陽系
function asteroids() {
	var i, el, x, y, z, x1, y1, z1, x2, y2, z2, x3, y3, u, cs;
	for(i = 0; n > i; i++) {	
		el = document.getElementById(i);
		
		// x-y平面の円軌道
		x = r[i] * Math.cos(t * s[i] + th[i]) + cx[i];
		y = r[i] * Math.sin(t * s[i] + th[i]) + cy[i];
		z = 0;
		
		// x軸を中心に回転
		x1 = x;
		y1 = Math.cos(qa[i]) * y - Math.sin(qa[i]) * z;
		z1 = Math.sin(qa[i]) * y + Math.cos(qa[i]) * z;
		
		// z軸を中心に回転
		x2 = Math.cos(qb[i]) * x1 - Math.sin(qb[i]) * y1;
		y2 = Math.sin(qb[i]) * x1 + Math.cos(qb[i]) * y1;
		z2 = z1;
		
		// 遠近感
		u = (0 >= p + z2) ? 100 : p / (p + z2);
		x3 = x2 * u;
		y3 = y2 * u;
		
		// 位置
		el.style.left = (Math.floor(x3) + cx0) + 'px';
		el.style.top = (Math.floor(y3) + cy0) + 'px';
		
		// 見かけの大きさ
		u = (0 >= p + z2) ? 1 : p / (p + z2);
		el.style.fontSize = Math.floor(u * 100) + '%';
		
		// 色と重なり
		cs = z2 * 0.5 / (com.w * Math.sin(an)) + 0.75;
		if(cs > 1) { cs = 1; }
		if(0 > cs) { cs = 0; }
		el.style.color = 'rgb(' + Math.floor(cr[i] * cs) + '%, ' + Math.floor(cg[i] * cs) + '%, ' + Math.floor(cb[i] * cs) + '%)';
		el.style.zIndex = cs * 1000;
	}
	t++;
	setTimeout('asteroids()', cn);
}
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 24 (fontified t face font-lock-comment-face) 24 40 (fontified t) 40 48 (fontified t face font-lock-keyword-face) 48 51 (fontified t) 51 52 (fontified t js--pstate ((nil 0 function 25 ("window" "onload") 108) (nil -2305843009213693952 toplevel nil nil nil))) 52 65 (fontified t) 65 76 (fontified t face font-lock-string-face) 76 78 (fontified t) 78 85 (fontified t face font-lock-string-face) 85 106 (fontified t) 106 107 (fontified t js--pend (nil 0 function 25 ("window" "onload") 108)) 107 110 (fontified t) 110 113 (fontified t face font-lock-comment-delimiter-face) 113 123 (fontified t face font-lock-comment-face) 123 131 (fontified t face font-lock-keyword-face) 131 132 (fontified t) 132 140 (fontified t face font-lock-function-name-face) 140 143 (fontified t) 143 144 (fontified t js--pstate ((nil 0 function 124 ("forminit") 291) (((((nil 0 function 25 ("window" "onload") 108)) nil (:name "[Automatically Generated Class]") nil "window" nil)) -2305843009213693952 toplevel nil nil nil))) 144 289 (fontified t) 289 290 (fontified t js--pend (nil 0 function 124 ("forminit") 291)) 290 292 (fontified t) 292 295 (fontified t face font-lock-comment-delimiter-face) 295 305 (fontified t face font-lock-comment-face) 305 313 (fontified t face font-lock-keyword-face) 313 314 (fontified t) 314 321 (fontified t face font-lock-function-name-face) 321 324 (fontified t) 324 325 (fontified t js--pstate ((nil 0 function 306 ("formval") 458) (((nil 0 function 124 ("forminit") 291) (((nil 0 function 25 ("window" "onload") 108)) nil (:name "[Automatically Generated Class]") nil "window" nil)) -2305843009213693952 toplevel nil nil nil))) 325 327 (fontified t) 327 333 (fontified t face font-lock-keyword-face) 333 371 (fontified t) 371 374 (fontified t face font-lock-string-face) 374 414 (fontified t) 414 417 (fontified t face font-lock-string-face) 417 456 (fontified t) 456 457 (fontified t js--pend (nil 0 function 306 ("formval") 458)) 457 459 (fontified t) 459 462 (fontified t face font-lock-comment-delimiter-face) 462 467 (fontified t face font-lock-comment-face) 467 475 (fontified t face font-lock-keyword-face) 475 476 (fontified t) 476 489 (fontified t face font-lock-function-name-face) 489 492 (fontified t) 492 493 (fontified t js--pstate ((nil 0 function 468 ("asteroidsinit") nil) (((nil 0 function 306 ("formval") 458) (nil 0 function 124 ("forminit") 291) (((nil 0 function 25 ("window" "onload") 108)) nil (:name "[Automatically Generated Class]") nil "window" nil)) -2305843009213693952 toplevel nil nil nil))) 493 495 (fontified t) 495 498 (fontified t face font-lock-keyword-face) 498 499 (fontified t) 499 500 (fontified t face font-lock-variable-name-face) 500 502 (fontified t) 502 504 (fontified t face font-lock-variable-name-face) 504 506 (fontified t) 506 509 (fontified t) 509 512 (fontified t face font-lock-comment-delimiter-face) 512 521 (fontified t face font-lock-comment-face) 521 574 (fontified t) 574 577 (fontified t face font-lock-comment-delimiter-face) 577 582 (fontified t face font-lock-comment-face) 582 634 (fontified t) 634 637 (fontified t face font-lock-comment-delimiter-face) 637 644 (fontified t face font-lock-comment-face) 644 699 (fontified t) 699 702 (fontified t face font-lock-comment-delimiter-face) 702 712 (fontified t face font-lock-comment-face) 712 718 (fontified t) 718 721 (fontified t face font-lock-keyword-face) 721 722 (fontified t) 722 727 (fontified t face font-lock-type-face) 727 728 (fontified t) 728 731 (fontified t face font-lock-string-face) 731 733 (fontified t) 733 736 (fontified t face font-lock-string-face) 736 738 (fontified t) 738 741 (fontified t face font-lock-string-face) 741 743 (fontified t) 743 746 (fontified t face font-lock-string-face) 746 750 (fontified t) 750 753 (fontified t face font-lock-comment-delimiter-face) 753 766 (fontified t face font-lock-comment-face) 766 779 (fontified t) 779 782 (fontified t face font-lock-comment-delimiter-face) 782 810 (fontified t face font-lock-comment-face) 810 821 (fontified t) 821 824 (fontified t face font-lock-comment-delimiter-face) 824 833 (fontified t face font-lock-comment-face) 833 854 (fontified t) 854 857 (fontified t face font-lock-comment-delimiter-face) 857 866 (fontified t face font-lock-comment-face) 866 900 (fontified t) 900 903 (fontified t face font-lock-comment-delimiter-face) 903 918 (fontified t face font-lock-comment-face) 918 931 (fontified t) 931 934 (fontified t face font-lock-comment-delimiter-face) 934 949 (fontified t face font-lock-comment-face) 949 962 (fontified t) 962 965 (fontified t face font-lock-comment-delimiter-face) 965 971 (fontified t face font-lock-comment-face) 971 976 (fontified t) 976 979 (fontified t face font-lock-keyword-face) 979 980 (fontified t) 980 985 (fontified t face font-lock-type-face) 985 997 (fontified t) 997 1000 (fontified t face font-lock-comment-delimiter-face) 1000 1012 (fontified t face font-lock-comment-face) 1012 1021 (fontified nil) 1021 1037 (face font-lock-string-face fontified nil) 1037 1042 (fontified nil) 1042 1045 (face font-lock-comment-delimiter-face fontified nil) 1045 1057 (face font-lock-comment-face fontified nil) 1057 1076 (fontified nil) 1076 1079 (face font-lock-comment-delimiter-face fontified nil) 1079 1084 (face font-lock-comment-face fontified nil) 1084 1103 (fontified nil) 1103 1106 (face font-lock-comment-delimiter-face fontified nil) 1106 1118 (face font-lock-comment-face fontified nil) 1118 1137 (fontified nil) 1137 1140 (face font-lock-comment-delimiter-face fontified nil) 1140 1152 (face font-lock-comment-face fontified nil) 1152 1171 (fontified nil) 1171 1174 (face font-lock-comment-delimiter-face fontified nil) 1174 1192 (face font-lock-comment-face fontified nil) 1192 1211 (fontified nil) 1211 1214 (face font-lock-comment-delimiter-face fontified nil) 1214 1232 (face font-lock-comment-face fontified nil) 1232 1251 (fontified nil) 1251 1254 (face font-lock-comment-delimiter-face fontified nil) 1254 1259 (face font-lock-comment-face fontified nil) 1259 1278 (fontified nil) 1278 1281 (face font-lock-comment-delimiter-face fontified nil) 1281 1302 (face font-lock-comment-face fontified nil) 1302 1362 (fontified nil) 1362 1365 (face font-lock-comment-delimiter-face fontified nil) 1365 1371 (face font-lock-comment-face fontified nil) 1371 1427 (fontified nil) 1427 1433 (face font-lock-string-face fontified nil) 1433 1466 (fontified nil) 1466 1477 (face font-lock-string-face fontified nil) 1477 1578 (fontified nil) 1578 1581 (face font-lock-comment-delimiter-face fontified nil) 1581 1591 (face font-lock-comment-face fontified nil) 1591 2112 (fontified nil) 2112 2115 (face font-lock-comment-delimiter-face fontified nil) 2115 2120 (face font-lock-comment-face fontified nil) 2120 2129 (fontified nil) 2129 2132 (face font-lock-comment-delimiter-face fontified nil) 2132 2145 (face font-lock-comment-face fontified nil) 2145 2162 (fontified nil) 2162 2165 (face font-lock-comment-delimiter-face fontified nil) 2165 2171 (face font-lock-comment-face fontified nil) 2171 2321 (fontified nil) 2321 2324 (face font-lock-comment-delimiter-face fontified nil) 2324 2334 (face font-lock-comment-face fontified nil) 2334 2446 (fontified nil) 2446 2449 (face font-lock-comment-delimiter-face fontified nil) 2449 2458 (face font-lock-comment-face fontified nil) 2458 2573 (fontified nil) 2573 2576 (face font-lock-comment-delimiter-face fontified nil) 2576 2585 (face font-lock-comment-face fontified nil) 2585 2705 (fontified nil) 2705 2708 (face font-lock-comment-delimiter-face fontified nil) 2708 2712 (face font-lock-comment-face fontified nil) 2712 2789 (fontified nil) 2789 2792 (face font-lock-comment-delimiter-face fontified nil) 2792 2795 (face font-lock-comment-face fontified nil) 2795 2838 (fontified nil) 2838 2842 (face font-lock-string-face fontified nil) 2842 2886 (fontified nil) 2886 2890 (face font-lock-string-face fontified nil) 2890 2897 (fontified nil) 2897 2900 (face font-lock-comment-delimiter-face fontified nil) 2900 2908 (face font-lock-comment-face fontified nil) 2908 2992 (fontified nil) 2992 2995 (face font-lock-string-face fontified nil) 2995 3002 (fontified nil) 3002 3005 (face font-lock-comment-delimiter-face fontified nil) 3005 3011 (face font-lock-comment-face fontified nil) 3011 3129 (fontified nil) 3129 3135 (face font-lock-string-face fontified nil) 3135 3163 (fontified nil) 3163 3168 (face font-lock-string-face fontified nil) 3168 3196 (fontified nil) 3196 3201 (face font-lock-string-face fontified nil) 3201 3229 (fontified nil) 3229 3233 (face font-lock-string-face fontified nil) 3233 3287 (fontified nil) 3287 3300 (face font-lock-string-face fontified nil) 3300 3309 (fontified nil)) . 1) (t 20227 . 13815) ((marker . 1) . -3309) ((marker) . -3309)))
