#!/usr/bin/ruby

# taken from: http://git.661346.n2.nabble.com/Removing-useless-merge-commit-with-quot-filter-branch-quot-td7356544.html

old_parents = gets.chomp.gsub('-p ', ' ')

if old_parents.empty? then
  new_parents = []
else
  new_parents = `git show-branch --independent #{old_parents}`.split
end

puts new_parents.map{|p| '-p ' + p}.join(' ')

