# tibooks-maker: OBSOLETE

This repository is obsolete.
We recommend you to try other workflow instead like [vvakame/docker-review: Re:VIEW build container by docker](https://github.com/vvakame/docker-review).
Therefore, please DO NOT open issues, fork or send pull request to this repository.

---------------------------------

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

[https://github.com/thinkitcojp/tibooks-maker/releases](https://github.com/thinkitcojp/tibooks-maker/releases)

## Getting Started

1. `tibooks-maker-X.Y.Z-YYYYMMDD.dmg`を開き、`tibooks-maker.app`を`/Applications/`フォルダへインストールします。
1. `tibooks-maker.app`をダブルクリックしてRe:VIEW製作フォルダを開くと、`[tibooks-maker]` 環境のターミナル `Terminal.app` が起動します。
    * `tibooks-maker.app`にRe:VIEW製作フォルダ（ファイル）をドラッグ＆ドロップすることもできます。
    * ターミナル上で `$ open -a tibooks-maker -- Re:VIEW製作フォルダ`を実行してもかまいません。
    * 旧版のように `$ . /Applications/tibooks-maker.app/setup.sh`を実行して、`[tibooks-maker]` 環境に移ることもできます。
1. tibooks-makerリポジトリをクローンしたら、 `gmake all` コマンドを試してみましょう。
book.epub: 電子書籍用EPUB（カラー画像）, book.pdf: 電子書籍用PDF, book-sp.pdf: 紙書籍用PDFの3点が生成されます。
