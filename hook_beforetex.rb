#!/usr/bin/env ruby
# coding: utf-8

require 'fileutils'

def rewrite(fname)
  File.open("#{fname}") do |fi|
    File.open("#{fname}-n", "w") do |fo|
      fo.puts yield(fi.readlines.join)
    end
  end
end

## 手動調整
# Dir.glob("#{ARGV[0]}/*.tex").each do |f|
#   rewrite(f) {|s|
#     return nil if s.nil?
#     ## some processes
#
#   }
#   File.rename("#{f}-n", "#{f}")
# end


## Think IT 用著者紹介および奥付
Dir.glob("#{ARGV[0]}/book.tex").each do |f|
  rewrite("book.tex") {|s|
    s.gsub(/input\{(.+?)\.tex\}/, 'include{\1}').
      sub('\include{terms}', '\begin{disclaimer}\include{terms}\end{disclaimer}').
      sub('\include{profile}', '\begin{writers}\include{profile}\end{writers}').
      sub('\include{okuduke}', '\begin{colophon}\include{okuduke}\end{colophon}')
  } 
  File.rename("#{f}-n", "#{f}")
end
