str = "my love lcx"
def str.myupcase
  self.gsub(/lcx/,"Lcx")
end

p str.myupcase  #=> "my love Lcx"
p str.methods(false)  #=> [:myupcase]

