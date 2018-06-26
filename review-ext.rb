# -*- coding: utf-8 -*-
module ReVIEW
  module TextUtils
    def convert_inencoding(str, enc)
      # skip the NKF convertion
      str
    end
  end

  class LATEXBuilder
    def dt(str)
      str.sub!(/\[/){'\lbrack{}'}
      str.sub!(/\]/){'\rbrack{}'}
      # removed the forcely ad-hoc line-breaking tags '\mbox{} \\\\'
      puts '\item[' + str + ']'   # \mbox{} \\\\
    end
    
    def lead(lines)
      latex_block 'lead', lines
    end

    def table_begin(ncols)
      if @latex_tsize
        puts macro('begin', 'reviewtable', @latex_tsize)
      elsif @tsize
        cellwidth = @tsize.split(/\s*,\s*/).collect {|i|
          if i =~ /\A([LCRP])/
            align = $1
            "#{align}{#{i.sub(align, '')}mm}"
          else
            "P{#{i}mm}"
          end
        }
        puts macro('begin', 'reviewtable', '|'+(cellwidth.join('|'))+'|')
      else
        puts macro('begin', 'reviewtablesetup')
        puts macro('begin', 'tabularx', '\hsize', (['|'] * (ncols + 1)).join('x'))
      end
      puts '\hline'
      # These tags @tsize, @latex_tsize are nil when putting table_end
      # @tsize = nil
      # @latex_tsize = nil
    end

    def table_end
      if @latex_tsize
        puts macro('end', 'reviewtable')
      elsif @tsize
        puts macro('end', 'reviewtable')
      else
        puts macro('end', 'tabularx')
        puts macro('end', 'reviewtablesetup')
      end
      if @table_caption
        puts '\end{table}'
      end
      @tsize = nil
      @latex_tsize = nil
      @table_caption = nil
      blank
    end

    def table_header(id, caption)
      if caption.present?
        @table_caption = true
        puts '\begin{table}[H]'
        puts macro('caption', compile_inline(caption))
      end
      puts macro('label', table_label(id))
    end

    def th(s)
      if  /\\\\/i =~ s
        # macro('reviewth', macro('shortstack[l]', s))
        array = s.split("\\\\")
        macro('reviewth', array.join('\ccr '))
      else
        macro('reviewth', s)
      end
    end

    def td(s)
      if  /\\\\/ =~ s
        # macro('shortstack[l]', s)
        array = s.split("\\\\")
        array.join('\ccr ')
      else
        s
      end
    end

    def tr(rows)
      print rows.join(' & ')
      puts ' \\\\  \hline'
    end

    def image_image(id, caption, metric)
      metrics = parse_metric("latex", metric)
      puts "\\begin{reviewimage}%%#{id}"
      if metrics.present?
        puts "\\includekeepaspectratiographics[#{metrics}]{#{@chapter.image(id).path}}"
      else
        puts "\\includekeepaspectratiographics{#{@chapter.image(id).path}}"
      end
      if caption.present?
        puts macro('caption', compile_inline(caption))
      end
      puts macro('label', image_label(id))
      puts '\end{reviewimage}'
    end

    def indepimage(id, caption=nil, metric=nil)
      metrics = parse_metric("latex", metric)
      puts "\\begin{reviewindepimage}%%#{id}"
      if metrics.present?
        puts "\\includekeepaspectratiographics[#{metrics}]{#{@chapter.image(id).path}}"
      else
        puts "\\includekeepaspectratiographics{#{@chapter.image(id).path}}"
      end
      if caption.present?
        puts macro('reviewindepimagecaption',
                   %Q[#{I18n.t("numberless_image")}#{I18n.t("caption_prefix")}#{compile_inline(caption)}])
      end
      puts '\end{reviewindepimage}'
    end

    # def index(str)
    #   '\index{' + escape_index(text(str)).gsub("＠", "@") + '}'
    # end

  end # end of class LATEXBuilder


  class HTMLBuilder
    def make_math_image(str, path, fontsize = 10) # 12
      fontsize2 = (fontsize * 1.2).round.to_i
      texsrc = <<-EOB
\\documentclass[10pt,uplatex]{jsarticle}
\\RequirePackage[utf8]{inputenc}
\\RequirePackage[prefernoncjk]{pxcjkcat}
\\cjkcategory{sym18,sym19,grek}{cjk}
\\usepackage{amsmath}
\\usepackage{amsthm}
\\usepackage{amssymb}
\\usepackage{amsfonts}
\\usepackage{anyfontsize}
\\usepackage{bm}
\\pagestyle{empty}

\\begin{document}
\\fontsize{#{fontsize}}{#{fontsize2}}\\selectfont #{str}
\\end{document}
      EOB
      Dir.mktmpdir do |tmpdir|
        tex_path = File.join(tmpdir, 'tmpmath.tex')
        dvi_path = File.join(tmpdir, 'tmpmath.dvi')
        pdf_path = File.join(tmpdir, 'tmpmath.pdf')
        File.write(tex_path, texsrc)
        ## 
        ##  * latex -> uplatex: destroy the LaTeX typesetting log
        ##  * dvipng -> sips (pre-installed in macOS): set output resolution to 144 dpi
        # system("latex --interaction=nonstopmode --output-directory=#{tmpdir} #{tex_path} 2>&1 >/dev/null && dvipng -D 144 -T tight -z9 -o #{path} #{dvi_path} || exit 1")
        system("uplatex --interaction=nonstopmode --output-directory=#{tmpdir} #{tex_path} 2>&1 >/dev/null && dvipdfmx -o - #{dvi_path} | pdfcrop - #{pdf_path} && magick -density 200x200 #{pdf_path} #{path} || exit 1")
      end
    end
  end # end of class HTMLBuilder

end
