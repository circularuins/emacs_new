
((digest . "6b48d433fc082a6e70e63473ec959abb") (undo-list (3309 . 3310) 900 nil (nil rear-nonsticky nil 3308 . 3309) (nil fontified nil 1 . 3309) (1 . 3309) nil (#("// 定数
var CANVAS_SIZE = 500;
var CANVAS_COLOR = '#000000';
var FPS = 30;
var RECT_NUM = 100;
var BASE_RECT_SIZE = 100;
var BASE_SPEED = 10;
// グローバル変数
var rects = [];
var ct;
 
// パッケージ
var shimoigi = {}
shimoigi.animationSample = {};
 
/**
 * 動かす四角形
 */
shimoigi.animationSample.Rect = function(){
    this._initialize.apply(this, arguments);
};
// 初期化
shimoigi.animationSample.Rect.prototype._initialize = function(){
    this.width = BASE_RECT_SIZE * Math.random();
    this.height = BASE_RECT_SIZE * Math.random();
    this.x = (CANVAS_SIZE - this.width) * Math.random();
    this.y = (CANVAS_SIZE - this.height) * Math.random();
    this.speed = {x:BASE_SPEED * Math.random(), y:BASE_SPEED * Math.random()};
 
    var r = Math.floor(255 * Math.random());
    var g = Math.floor(255 * Math.random());
    var b = Math.floor(255 * Math.random());
    var a = Math.random();
    this.color = 'rgba(' + r + ',' + g + ',' + b + ',' + a + ')';
};
// 更新
shimoigi.animationSample.Rect.prototype.onFrame = function(){
    // 移動
    var speed = this.speed;
    this.x = this.x + speed.x;
    this.y = this.y + speed.y;
 
    // 行き過ぎてたら折り返し
    if(this.x < 0 || this.x > CANVAS_SIZE - this.width) this.speed.x *= -1;
    if(this.y < 0 || this.y > CANVAS_SIZE - this.height) this.speed.y *= -1;
 
    // 描画
    ct.beginPath();
    ct.rect(this.x, this.y, this.width, this.height);
    ct.fillStyle = this.color;
    ct.fill();
};
 
/**
 * メイン処理
 */
shimoigi.animationSample.init = function(){
    var canvas = document.createElement('canvas');
    canvas.setAttribute('width', CANVAS_SIZE);
    canvas.setAttribute('height', CANVAS_SIZE);
    canvas.style.backgroundColor = CANVAS_COLOR;
    ct = canvas.getContext('2d');
    document.body.appendChild(canvas);
    // 四角形初期化
    for(var i=0;i<RECT_NUM;i++){
        rects[i] = new shimoigi.animationSample.Rect();
    }
 
    // フレームレートのタイミングで更新
    setInterval(shimoigi.animationSample.onFrame, 1000 / FPS);
};
// 更新
shimoigi.animationSample.onFrame = function(){
    // キャンバスクリア
    ct.clearRect(0,0,CANVAS_SIZE,CANVAS_SIZE);
    for(var i=0;i<RECT_NUM;i++){
        rects[i].onFrame();
    }
};
 
window.onload = shimoigi.animationSample.init;
" 0 3 (fontified t face font-lock-comment-delimiter-face) 3 6 (fontified t face font-lock-comment-face) 6 9 (fontified t face font-lock-keyword-face) 9 10 (fontified t) 10 21 (fontified t face font-lock-variable-name-face) 21 29 (fontified t) 29 32 (fontified t face font-lock-keyword-face) 32 33 (fontified t) 33 45 (fontified t face font-lock-variable-name-face) 45 48 (fontified t) 48 57 (fontified t face font-lock-string-face) 57 59 (fontified t) 59 62 (fontified t face font-lock-keyword-face) 62 63 (fontified t) 63 66 (fontified t face font-lock-variable-name-face) 66 73 (fontified t) 73 76 (fontified t face font-lock-keyword-face) 76 77 (fontified t) 77 85 (fontified t face font-lock-variable-name-face) 85 93 (fontified t) 93 96 (fontified t face font-lock-keyword-face) 96 97 (fontified t) 97 111 (fontified t face font-lock-variable-name-face) 111 119 (fontified t) 119 122 (fontified t face font-lock-keyword-face) 122 123 (fontified t) 123 133 (fontified t face font-lock-variable-name-face) 133 140 (fontified t) 140 143 (fontified t face font-lock-comment-delimiter-face) 143 151 (fontified t face font-lock-comment-face) 151 154 (fontified t face font-lock-keyword-face) 154 155 (fontified t) 155 160 (fontified t face font-lock-variable-name-face) 160 167 (fontified t) 167 170 (fontified t face font-lock-keyword-face) 170 171 (fontified t) 171 173 (fontified t face font-lock-variable-name-face) 173 177 (fontified t) 177 180 (fontified t face font-lock-comment-delimiter-face) 180 186 (fontified t face font-lock-comment-face) 186 189 (fontified t face font-lock-keyword-face) 189 190 (fontified t) 190 198 (fontified t face font-lock-variable-name-face) 198 237 (fontified t) 237 240 (fontified t face font-lock-comment-delimiter-face) 240 254 (fontified t face font-lock-comment-face) 254 287 (fontified t) 287 295 (fontified t face font-lock-keyword-face) 295 297 (fontified t) 297 298 (fontified t js--pstate ((nil 0 function 256 ("shimoigi" "animationSample" "Rect") 346) (nil -2305843009213693952 toplevel nil nil nil))) 298 303 (fontified t) 303 307 (fontified t face font-lock-constant-face) 307 326 (fontified t) 326 330 (fontified t face font-lock-constant-face) 330 332 (fontified t) 332 341 (fontified t face font-lock-constant-face) 341 344 (fontified t) 344 345 (fontified t js--pend (nil 0 function 256 ("shimoigi" "animationSample" "Rect") 346)) 345 347 (fontified t) 347 350 (fontified t face font-lock-comment-delimiter-face) 350 354 (fontified t face font-lock-comment-face) 354 384 (fontified t) 384 393 (fontified t face font-lock-constant-face) 393 408 (fontified t) 408 416 (fontified t face font-lock-keyword-face) 416 418 (fontified t) 418 419 (fontified t js--pstate ((nil 0 function 355 ("shimoigi" "animationSample" "Rect" "_initialize") 945) (((((((nil 0 function 256 ("shimoigi" "animationSample" "Rect") 346)) nil (:name "[Automatically Generated Class]") nil "animationSample" nil)) nil (:name "[Automatically Generated Class]") nil "shimoigi" nil)) -2305843009213693952 toplevel nil nil nil))) 419 424 (fontified t) 424 428 (fontified t face font-lock-constant-face) 428 473 (fontified t) 473 477 (fontified t face font-lock-constant-face) 477 519 (fontified t) 519 523 (fontified t) 523 527 (fontified t face font-lock-constant-face) 527 547 (fontified t) 547 551 (fontified t face font-lock-constant-face) 551 580 (fontified t) 580 584 (fontified t face font-lock-constant-face) 584 604 (fontified t) 604 608 (fontified t face font-lock-constant-face) 608 638 (fontified t) 638 642 (fontified t face font-lock-constant-face) 642 719 (fontified t) 719 722 (fontified t face font-lock-keyword-face) 722 723 (fontified t) 723 724 (fontified t face font-lock-variable-name-face) 724 764 (fontified t) 764 767 (fontified t face font-lock-keyword-face) 767 768 (fontified t) 768 769 (fontified t face font-lock-variable-name-face) 769 809 (fontified t) 809 812 (fontified t face font-lock-keyword-face) 812 813 (fontified t) 813 814 (fontified t face font-lock-variable-name-face) 814 854 (fontified t) 854 857 (fontified t face font-lock-keyword-face) 857 858 (fontified t) 858 859 (fontified t face font-lock-variable-name-face) 859 881 (fontified t) 881 885 (fontified t face font-lock-constant-face) 885 894 (fontified t) 894 901 (fontified t face font-lock-string-face) 901 908 (fontified t) 908 911 (fontified t face font-lock-string-face) 911 918 (fontified t) 918 921 (fontified t face font-lock-string-face) 921 928 (fontified t) 928 931 (fontified t face font-lock-string-face) 931 938 (fontified t) 938 941 (fontified t face font-lock-string-face) 941 943 (fontified t) 943 944 (fontified t js--pend (nil 0 function 355 ("shimoigi" "animationSample" "Rect" "_initialize") 945)) 944 946 (fontified t) 946 949 (fontified t face font-lock-comment-delimiter-face) 949 952 (fontified t face font-lock-comment-face) 952 982 (fontified t) 982 991 (fontified t face font-lock-constant-face) 991 1002 (fontified t) 1002 1010 (fontified t face font-lock-keyword-face) 1010 1012 (fontified t) 1012 1013 (fontified t js--pstate ((nil 0 function 953 ("shimoigi" "animationSample" "Rect" "onFrame") 1422) (((((((((nil 0 function 355 ("shimoigi" "animationSample" "Rect" "_initialize") 945) (nil 0 function 256 ("shimoigi" "animationSample" "Rect") 346)) nil (:name "[Automatically Generated Class]") nil "Rect" nil)) nil (:name "[Automatically Generated Class]") nil "animationSample" nil)) nil (:name "[Automatically Generated Class]") nil "shimoigi" nil)) -2305843009213693952 toplevel nil nil nil))) 1013 1018 (fontified t) 1018 1021 (fontified t face font-lock-comment-delimiter-face) 1021 1024 (fontified t face font-lock-comment-face) 1024 1028 (fontified t) 1028 1031 (fontified t face font-lock-keyword-face) 1031 1032 (fontified t) 1032 1037 (fontified t face font-lock-variable-name-face) 1037 1040 (fontified t) 1040 1044 (fontified t face font-lock-constant-face) 1044 1056 (fontified t) 1056 1060 (fontified t face font-lock-constant-face) 1060 1065 (fontified t) 1065 1069 (fontified t face font-lock-constant-face) 1069 1087 (fontified t) 1087 1091 (fontified t face font-lock-constant-face) 1091 1096 (fontified t) 1096 1100 (fontified t face font-lock-constant-face) 1100 1120 (fontified t) 1120 1123 (fontified t face font-lock-comment-delimiter-face) 1123 1135 (fontified t face font-lock-comment-face) 1135 1139 (fontified t) 1139 1141 (fontified t face font-lock-keyword-face) 1141 1142 (fontified t) 1142 1146 (fontified t face font-lock-constant-face) 1146 1156 (fontified t) 1156 1160 (fontified t face font-lock-constant-face) 1160 1179 (fontified t) 1179 1183 (fontified t face font-lock-constant-face) 1183 1191 (fontified t) 1191 1195 (fontified t face font-lock-constant-face) 1195 1215 (fontified t) 1215 1217 (fontified t face font-lock-keyword-face) 1217 1218 (fontified t) 1218 1222 (fontified t face font-lock-constant-face) 1222 1232 (fontified t) 1232 1236 (fontified t face font-lock-constant-face) 1236 1255 (fontified t) 1255 1259 (fontified t face font-lock-constant-face) 1259 1268 (fontified t) 1268 1272 (fontified t face font-lock-constant-face) 1272 1294 (fontified t) 1294 1297 (fontified t face font-lock-comment-delimiter-face) 1297 1300 (fontified t face font-lock-comment-face) 1300 1332 (fontified t) 1332 1336 (fontified t face font-lock-constant-face) 1336 1340 (fontified t) 1340 1344 (fontified t face font-lock-constant-face) 1344 1348 (fontified t) 1348 1352 (fontified t face font-lock-constant-face) 1352 1360 (fontified t) 1360 1364 (fontified t face font-lock-constant-face) 1364 1393 (fontified t) 1393 1397 (fontified t face font-lock-constant-face) 1397 1420 (fontified t) 1420 1421 (fontified t js--pend (nil 0 function 953 ("shimoigi" "animationSample" "Rect" "onFrame") 1422)) 1421 1425 (fontified t) 1425 1428 (fontified t face font-lock-comment-delimiter-face) 1428 1441 (fontified t face font-lock-comment-face) 1441 1474 (fontified t) 1474 1482 (fontified t face font-lock-keyword-face) 1482 1484 (fontified t) 1484 1485 (fontified t js--pstate ((nil 0 function 1443 ("shimoigi" "animationSample" "init") nil) (((((((((nil 0 function 953 ("shimoigi" "animationSample" "Rect" "onFrame") 1422) (nil 0 function 355 ("shimoigi" "animationSample" "Rect" "_initialize") 945) (nil 0 function 256 ("shimoigi" "animationSample" "Rect") 346)) nil (:name "[Automatically Generated Class]") nil "Rect" nil)) nil (:name "[Automatically Generated Class]") nil "animationSample" nil)) nil (:name "[Automatically Generated Class]") nil "shimoigi" nil)) -2305843009213693952 toplevel nil nil nil))) 1485 1490 (fontified t) 1490 1493 (fontified t face font-lock-keyword-face) 1493 1494 (fontified t) 1494 1500 (fontified t face font-lock-variable-name-face) 1500 1526 (fontified t) 1526 1534 (fontified t face font-lock-string-face) 1534 1537 (fontified t) 1537 1561 (fontified nil) 1561 1568 (face font-lock-string-face fontified nil) 1568 1608 (fontified nil) 1608 1616 (face font-lock-string-face fontified nil) 1616 1708 (fontified nil) 1708 1712 (face font-lock-string-face fontified nil) 1712 1758 (fontified nil) 1758 1761 (face font-lock-comment-delimiter-face fontified nil) 1761 1768 (face font-lock-comment-face fontified nil) 1768 1869 (fontified nil) 1869 1872 (face font-lock-comment-delimiter-face fontified nil) 1872 1889 (face font-lock-comment-face fontified nil) 1889 1955 (fontified nil) 1955 1958 (face font-lock-comment-delimiter-face fontified nil) 1958 1961 (face font-lock-comment-face fontified nil) 1961 2012 (fontified nil) 2012 2015 (face font-lock-comment-delimiter-face fontified nil) 2015 2024 (face font-lock-comment-face fontified nil) 2024 2190 (fontified nil)) . 1) (t 20227 . 13036) ((marker . 1) . -2190) ((marker) . -2190)))
