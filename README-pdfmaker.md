thinkit-books LaTeX スタイルファイル群設定
====================

Think IT Books各種 PDF を生成する仕組みは、
（第一弾）Think IT Books用LaTeXスタイルファイル群
thinkit-books のクラスオプションに設定することで実現しています。
ここで、クラスオプションとは、親TeXファイルにおいて、
以下のような位置にカンマ（,）区切りで記述するオプションです。

```latex
\documentclass[クラスオプションたち（省略可能）]{thinkit-books]
```

このクラスオプションオプションたちは、
Re:VIEW設定ファイル config.yaml 内の texdocumentclass において、
以下のような位置に記述します。

```yaml
texdocumentclass: ["thinkit-books", "クラスオプションたち（省略可能）"]
```


利用可能な主なクラスオプション
--------------------

thinkit-books v1.0 において利用可能な主なクラスオプションは、以下のとおりです。

### トンボ

トンボの有無ならびに、トンボ有りのときの用紙サイズを指定します。

* tombo:
  トンボをつける
* tombopaper=b5: トンボ用紙サイズを指定する（例：b5）
  * default: a4; b5

### PDF埋込フォントプロファイル

PDF埋込フォントプロファイルを指定します（後述のPDFデータ作成形式 `cameraready` 参照）。

* pdf:kanjimap=ipaex: PDF埋込するフォントを上書き指定する（例：フリーフォント）
  * default: hiragino（OS X 10.11 El Capitan同梱ヒラギノフォント）
  * hiragino-legacy（OS X 10.10 Yosemite 以前同梱ヒラギノフォント）
  * morisawa（MORISAWA PASSPORTが必要）
  * ipaex（フリーフォント）

### PDFデータ作成形式

印刷用 `print`、閲覧用 `pdf`、プレビュー用 `preview` のいずれかの形式を指定します。

* cameraready=pdf: データ作成形式を指定する（例：閲覧用PDF）
  * preview: デフォルトで ipaex（フリーフォント）を埋め込む
  * print, pdf: デフォルトで hiragino（OS X El Capitan同梱ヒラギノフォント）を埋め込む
  * default: print; preview, pdf

### 用紙サイズ

用紙サイズ（＋裁ち落とし）を設定します（後述の基本版面設計 `Q`, `W`, `L`, `H`, `head`, `gutter`ならびに、基本版面設定例参照）。

* paper=a5+3mm: 用紙サイズを指定する（例：A5 裁ち落とし+3mm）
  * paper を指定することで、基本版面設計（Q, W, L, H, head, gutter）の初期設定がされる
  * default: b5var; {a5,b5,b5var,12mo}{,+3mm,+3.17mm,+4mm}

### 基本版面設計

* 基本版面設計：基本版面設計を上書き指定する（後述の基本版面設定例参照参照）（例：B5変形 paper=b5var{,+Xmm} のときのそれぞれの初期値）
  * Q=13, W=43, L=32, H=24, head=22mm, gutter=23mm

### 各種直前改丁頁制御

* 各種直前改丁頁制御：default: right; left, page
  * frontmatter:break-before=page
  * mainmatter:break-before=page
  * backmatter:break-before=page
  * appendix:break-before=page
  * toc:break-before=page
  * idx:break-before=page

基本版面設定例
--------------------

クラスオプション `paper` を指定することで、基本版面設計（Q, W, L, H, head, gutter）の初期設定がされます。
なお、ノドはAmazon POD仕様により20mm以上、地および小口はともになりゆきです。

1. [x] B5変形 b5var W182mm x H232mm（paperを省略したときのデフォルト）
  * [x] 13Q 43W 32L 24H   天22mm ノド23mm
1. B5 b5 W182mm x H257mm
  * [x] 13Q 43W 35L 24H   天22mm ノド23mm
  * `paper=b5, % Q=13, W=43, L=35, H=24, %B5 default (13Q)`
1. A5 a5 W148mm x H210mm
  * [x] 12Q 38W 34L 20.5H 天20mm ノド20mm
  * `paper=a5, % Q=12, W=38, L=34, H=20.5, head=20mm, gutter=20mm, %A5 default (12Q)`
1. 四六 12mo W128mm x H188mm
  * [x] 12Q 31W 30L 20.5H 天18mm ノド20mm
  * `paper=12mo, Q=13, W=29, L=28, H=22, head=18mm, gutter=20mm, %四六 (13Q)`

各用紙サイズに対して、±1Q した基本版面の設計例とその設定例は、以下のとおりです。

1. B5変形 b5var W182mm x H232mm
  *     14Q 40W 30L 25.5H 天22mm ノド23mm
  * `paper=b5var, Q=14, W=40, L=30, H=25.5, %example: B5var (14Q)`
1. B5 b5 W182mm x H257mm
  *     14Q 40W 34L 25.5H 天22mm ノド23mm
  * `paper=b5, Q=14, W=40, L=34, H=25.5, %example: B5 (14Q)`
1. A5 a5 W148mm x H210mm
  *     13Q 35W 32L 22H   天20mm ノド20mm
  * `paper=a5, Q=13, W=35, L=32, H=22, head=20mm, gutter=20mm, %example: A5 + 13Q`
1. 四六 12mo W128mm x H188mm
  *     13Q 29W 28L 22H   天18mm ノド20mm
  * `paper=12mo, % Q=12, W=31, L=30, H=20.5, head=18mm, gutter=20mm, %四六 default (12Q)`

### 運用上必要になるlatexコマンド

まず、`@<raw>{|latex|hogehoge}`で、ビルダー単位で実行可能なコマンドを挿入できます（latexを指定することでPDF作成時にだけ呼ばれ、EPUBでは反映されない）。基本的にLaTexのコマンドを入れれば処理されます。

 * `@<raw>{|latex|\allowbreak}`

指定位置で改行を入れます、allow〜なので命令としては弱め、強制改行の場合は`\break`、または`\\`なども併用します。なお、「/」や「_」の直後に`@<raw>{|latex|\allowbreak}`を入れるとコケます。

 * `@<raw>{|latex|\clearpage}`

このコマンドを入れるとそれ以前までの図版をすべて出力してから改ページされます。単純な改ページ`\newpage`とは少し意味合いが異なり図版位置を操作する場合はこちらのほうが使い勝手が良かったりします。

 * `@<raw>{|latex|\vfill}`

下寄せで配置したい場合など、縦方向に空きを持たせるコマンドです、`\vspace{長さ}`で絶対値指定ができたと思います。

以降、気付いたら追記します！

参考
http://www.latex-cmd.com/

### TeXファイルを直接修正する場合は

段組や表組みの調整など、TeXの一時ファイルを修正してコンパイルするには、

`cd book-pdf/`

で、テンポラリのフォルダーに移動し、当該の`.tex`ファイルを修正、その後、

`ptex2pdf -u -l book.tex`

コマンドでTeX→PDFに変換します。

### ImageMagickで画像を変換する

※mogrifyにするとフォルダー内の全画像に一括適用されます

グレースケール画像を変換する

```
convert a.jpg -type Grayscale b.jpg
mogrify -type Grayscale *.*
```

epsに変換する

```
convert a.jpg a.eps
mogrify -format eps *.*
```

画像に枠を付ける（太さや色はお好みで）

```
convert -border 1x1 -bordercolor black a.jpg a_waku.jpg
mogrify -border 1x1 -bordercolor black *.*
```

### 表のセルサイズ（横幅）を手動で調整する

tableタグの直前にtsizeで指定します、列数と合わせるようにします。単位は確かmmです。

```
//tsize[|latex|20,45,75]
//table[table01][]{
```
