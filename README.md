# What's this?
"tibooks-maker" is easy publishing for pBooks & eBooks.
customized Re:VIEW-platform for [Think IT Books](https://thinkit.co.jp/tibooks,Think IT Books)

* tibooks-maker is OS X apps (all in one package) constructed from the following components:
 * Re:VIEW
 * Ruby
 * TeX Live
  * uplatex
  * dvipdfmx

 Copyright ©2015 Impress Corporation, An Impress Group Company. All rights reserved.<br>
 special thanks Munehiro Yamamoto (Green Cherry Ltd.)

## Installing

Download the latest Version.

https://github.com/suzukin/tibooks-maker/releases

## Getting Started

1. `tibooks-maker-1.x.dmg` を開き `tibooks-maker` フォルダを `/Applications/` フォルダへコピーします。
1. ターミナル `Terminal.app` を起動して、
   `. /Applications/tibooks-maker/setup.sh` を実行すると、プロンプトが、
   `tibooks-maker` 環境に切り替わります。
    ```bash
    $ . /Applications/tibooks-maker/setup.sh

		tibook-maker 1.1 (Cherry)

		This is constructed from the following components:
		 * Re:VIEW:	review (1.7.2)
		 * Ruby:	ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
		 * TeX Live
		   * uplatex:	e-upTeX 3.14159265-p3.6-u1.20-141210-2.6 (utf8.uptex) (TeX Live 2015)
		   * dvipdfmx:	dvipdfmx Version 20150315

    [tibooks-maker]:~ $
    ```
1. tibooks-makerリポジトリをクローンしたら、 `gmake all` コマンドを試してみましょう。
book.epub: 電子書籍用EPUB（カラー画像）, book.pdf: 電子書籍用PDF, book-sp.pdf: 紙書籍用PDF の3点が生成されます。
