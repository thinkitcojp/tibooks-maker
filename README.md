# What's this?
"tibooks-maker" is easy publishing for pBooks & eBooks.
customized Re:VIEW-platform for [Think IT Books](https://thinkit.co.jp/tibooks)

* tibooks-maker is OS X apps (all in one package) constructed from the following components:
 * Re:VIEW
 * Ruby
 * TeX Live
  * uplatex
  * dvipdfmx

 Copyright ©2015-2017 Impress Corporation, An Impress Group Company. All rights reserved.<br>
 special thanks Munehiro Yamamoto (Green Cherry Ltd.)

## Installing

Download the latest Version.

https://github.com/thinkitcojp/tibooks-maker/releases

## Getting Started

1. `tibooks-maker-X.Y.Z-YYYYMMDD.dmg` を開き `tibooks-maker` フォルダを `/Applications/` フォルダへコピーします。
1. ターミナル `Terminal.app` を起動して、
   `. /Applications/tibooks-maker/setup.sh` を実行すると、プロンプトが、
   `tibooks-maker` 環境に切り替わります。
    ```bash
    $ . /Applications/tibooks-maker/setup.sh

		tibook-maker 2.2.0-20170305 (Durian)

        This is constructed from the following components:
         * Re:VIEW:	review (2.2.0)
         * Ruby:	ruby 2.3.3p222 (2016-11-21 revision 56859) [x86_64-darwin10.0]
         * TeX Live
           * uplatex:	e-upTeX 3.14159265-p3.6-u1.20-141210-2.6 (utf8.uptex) (TeX Live 2015)
           * dvipdfmx:	dvipdfmx Version 20150315 

    [tibooks-maker]:~ $
    ```
1. tibooks-makerリポジトリをクローンしたら、 `gmake all` コマンドを試してみましょう。
book.epub: 電子書籍用EPUB（カラー画像）, book.pdf: 電子書籍用PDF, book-sp.pdf: 紙書籍用PDF の3点が生成されます。
