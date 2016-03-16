# -*- coding: utf-8 -*-
module ReVIEW
  module TextUtils
    def convert_inencoding(str, enc)
      # skip the NKF convertion
      str
    end
  end

  class Builder
    def tsize(str)
      if matched = str.match(/\A\|(.*?)\|(.*)/)
        builders = matched[1].split(/,/).map{|i| i.gsub(/\s/, '') }
        c = self.class.to_s.gsub(/ReVIEW::/, '').gsub(/Builder/, '').downcase
        if builders.include?(c)
          @tsize = matched[2]
        end
      end
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

    def tsize(str)
      # @tsize = str
      super(str)
    end

    def table_header(id, caption)
      if caption.present?
        @table_caption = true
        puts '\begin{table}[h]'
        puts macro('caption', compile_inline(caption))
      end
      puts macro('label', table_label(id))
    end

    def th(s)
      if  /\\\\/i =~ s
        macro('reviewth', macro('shortstack[l]', s))
        # array = s.split("\\\\")
        # macro('reviewth', array.join('\ccr '))
      else
        macro('reviewth', s)
      end
    end

    def td(s)
      if  /\\\\/ =~ s
        macro('shortstack[l]', s)
        # array = s.split("\\\\")
        # array.join('\ccr ')
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
      puts '\begin{reviewimage}'
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

  end

end
