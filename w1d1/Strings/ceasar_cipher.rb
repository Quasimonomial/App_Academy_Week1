def cipher str, num
  origin = ("a".."z").to_a
  cipher = origin.rotate(num)
  result = str.tr(origin.join, cipher.join)
end

