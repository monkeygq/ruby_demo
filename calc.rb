require 'spreadsheet'
Spreadsheet.client_encoding = 'UTF-8'
book = Spreadsheet.open 'gravity.xls'
sheet = book.worksheet('sheet2')
block_count = sheet.row(0).length - 1
h = {}
gravity = {}
block_count.times do |index|
  h["S#{index}"] = {}
  gravity["S#{index}"] = {}
end

#p h

#p sheet.row(0)
#p "+++++++++++++++++++++++++++++++++++++++++++++++++++=="
sheet.each_with_index do |row, index|
  #row.each do |item|
  #  print "%10s" % "#{item}"
  #end
  #puts
  if index > 0
    row.each_with_index do |item, col|
      if col > index
        h[row[0]]["S#{col-1}"] = item.to_f if item
      end
    end
  end
end

#p h 


arr = book.worksheet('sheet1').row(1)
area = {}

arr.each_with_index do |i, index|
  area["S#{index}"] = i.to_f
end

#print "area="
#p area

h.each do |k1, v1|
   v1.each do |k2, v2|
     gravity[k1][k2] = area[k1] * area[k2] / (h[k1][k2] ** 2)
   end
end

#print "gravity="
#p gravity
sort_arr = []
gravity.each do |k1, v1|
  v1.each do |k2, v2|
    sort_arr << [k1, k2, v2]
  end
end
#p "++++++++++++++++++= gravity first 1128++++++++++++++++=="
output = []
hash = Hash.new(0)
sort_arr.sort { |a, b| b[2] <=> a[2] }.first(132).map do |i|
  #print "%04s" % "#{index + 1}"
  #print ". "
  #print i
  #puts
  #output << [index+1, i.last]
  #p i
  hash[i[0]] += 1
  hash[i[1]] += 1
end
p hash.to_a.sort { |a, b| a[1] <=> b[1] }
p hash.count
#p output
=begin
new_book = Spreadsheet::Workbook.new
new_sheet = new_book.create_worksheet

new_row_0 = []

block_count.times do |index|
  new_row_0 << "S#{index}"
end
new_sheet.row(0).concat([nil] + new_row_0 )

block_count.times do |index1|
  k1 = "S#{index1}"
  new_sheet.row(index1+1).concat([k1])
  block_count.times do |index2|
    k2 = "S#{index2}"
    value = gravity[k1][k2] ? gravity[k1][k2] : nil
    new_sheet.row(index1+1).concat([value])
  end
end

new_book.write './result.xls'
=end
