# tibooks-maker
tibooks-maker is customized Re:VIEW-platform for [Think IT Books](https://thinkit.co.jp/tibooks,Think IT Books)

* OS X apps (all in one package)
 * Re:VIEW
 * Ruby
 * TeX Live
 * Fontset

 Copyright ©2015 Impress Corporation, An Impress Group Company. All rights reserved.<br>
 special thanks Munehiro Yamamoto (Green Cherry Ltd.)

## Installing

Download the latest Version.

https://github.com/suzukin/tibooks-maker/releases

## Getting Started

1. `tibooks-maker-1.0.dmg` から `tibooks-maker` フォルダを `/Applications/` フォルダへ差し替えコピーします。
1. ターミナル `Terminal.app` を起動して、
   `. /Applications/tibooks-maker/setup.sh` を実行すると、
   `tibooks-maker` の環境に切り替わります。
    ```bash
    $ . /Applications/tibooks-maker/setup.sh
     
    tibook-maker 1.0 (Cherry)
     
    [tibooks-maker]:~ $ 
    ```
1. `review-pdfmaker`, `review-epubmaker` コマンドを試します。
   ```bash
   [tibooks-maker]:~ $ review-pdfmaker --help
   Usage: review-pdfmaker configfile
   --help                       Prints this message and quit.
   --[no-]debug                 Keep temporary files.
   --ignore-errors              Ignore review-compile errors.
   [tibooks-maker]:~ $ review-epubmaker --help
   Usage: review-epubmaker [options] YAML_filename [export_filename]
   --help                       Prints this message and quit.
   [tibooks-maker]:~ $ 
   ```
