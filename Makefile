OBJS=book.epub book.pdf book-sp.pdf book-print.pdf

BUNDLEEXEC=
__epubmaker=${BUNDLEEXEC} review-epubmaker
__pdfmaker=${BUNDLEEXEC} review-pdfmaker

all: ${OBJS}

# book.epub: 電子書籍用EPUB（カラー画像）
book.epub: config.yml
	${__epubmaker} $<

# book.pdf: 電子書籍用PDF（カラー画像、閲覧用リンクあり、仕上がりサイズ）
book.pdf: config.yml
	${__pdfmaker} $<

# book-sp.pdf: 京葉SPおよびAmazonPOD用PDF（グレースケール画像、印刷用リンクなし、仕上がりサイズ）
book-sp.pdf: config-sp.yml
	make images-tmpGrayscale
	${__pdfmaker} $<
	make clean-images-tmpGrayscale

# book-print.pdf: オフセット用PDF（グレースケール画像、印刷用リンクなし、トンボあり、デフォルトオフ）
book-print.pdf: config-print.yml
	make images-tmpGrayscale
	${__pdfmaker} $<
	make clean-images-tmpGrayscale

images-tmpGrayscale:
	test ! -d images-tmpGrayscale
	echo Converting all images to grayscale ...
	cp -a images images-tmpGrayscale
	mogrify -type Grayscale images/*.* && echo done. || /bin/false; \

clean-images-tmpGrayscale:
	test -d images-tmpGrayscale
	rm -rf images
	mv images-tmpGrayscale images

clean:
	rm -rf ${OBJS} book-pdf book-*-pdf book-epub
	rm -rf images-tmpGrayscale
	find . -name "*~" -delete

.PHONY: clean

## end of file
