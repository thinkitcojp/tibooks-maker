#!/usr/bin/env ruby
# coding: utf-8

require 'fileutils'

def rewrite(fname)
  File.open("#{ARGV[0]}/#{fname}") do |fi|
    File.open("#{ARGV[0]}/#{fname}-n", "w") do |fo|
      fo.puts yield(fi.readlines.join)
    end
  end
end

# 手動調整


# Think IT 用著者紹介および奥付
rewrite("book.tex") {|s|
  s.gsub(/input\{(.+?)\.tex\}/, 'include{\1}').
    sub('\include{terms}', '\begin{disclaimer}\include{terms}\end{disclaimer}').
    sub('\include{profile}', '\begin{writers}\include{profile}\end{writers}').
    sub('\include{okuduke}', '\begin{colophon}\include{okuduke}\end{colophon}')
} 

%w(book.tex).each do |f|
  File.rename("#{ARGV[0]}/#{f}-n", "#{ARGV[0]}/#{f}")
end
