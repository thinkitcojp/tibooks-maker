BUNDLEEXEC=
__epubmaker=${BUNDLEEXEC} review-epubmaker
__pdfmaker=${BUNDLEEXEC} review-pdfmaker

all: book.epub book.pdf book-sp.pdf

# book.epub: 電子書籍用EPUB（カラー画像）
book.epub: clean
	rm -f images
	ln -s images-ebook images
	${__epubmaker} config.yml
	rm -f images

# book.pdf: 電子書籍用PDF（カラー画像、閲覧用リンクあり、仕上がりサイズ）
book.pdf: clean
	rm -f images
	ln -s images-ebook images
	${__pdfmaker} config.yml
	rm -f images

# book-sp.pdf: 京葉SPおよびAmazonPOD用PDF（グレースケール画像、印刷用リンクなし、仕上がりサイズ）
book-sp.pdf: clean
	rm -f images
	cp -r images-ebook/ images-print
	mogrify -type Grayscale images-print/*.*
	ln -s images-print images
	${__pdfmaker} config-sp.yml
	rm -f images

# book-print.pdf: オフセット用PDF（グレースケール画像、印刷用リンクなし、トンボあり、デフォルトオフ）
book-print.pdf: clean
	rm -f images
	cp -r images-ebook/ images-print
	mogrify -type Grayscale images-print/*.*
	ln -s images-print images
	${__pdfmaker} config-print.yml
	rm -f images

# book-preview.pdf: 表示確認用PDF（フォント非埋め込み、デフォルトオフ）
book-preview.pdf: clean
	rm -f images
	ln -s images-ebook images
	${__pdfmaker} config-preview.yml
	rm -f images

clean:
	rm -f book*.pdf book*.epub
	rm -rf book-*
	rm -f images
	find . -name "*~" -delete

## end of file
