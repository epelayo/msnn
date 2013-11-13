print "hola"
 -- modulo vector
 
 vector={} 
 vector.__index = vector 

-- .__newindex : Retorna un vector. Necesario implementarlo para hacer cb[#cb] = x


 function vector.__tostring(m) 
  local s = ""
  for i,e in pairs(m) do
   -- asegurar esta línea que sigue
    if type(i) == "string" then print( i .. ":\n" ) end
    if type(e) == "array" then      
      	s = s..vector.__tostring(e)
    else
      	s = s.." "..tostring(e)
    end
  end
  s=s.."\n"
  return s
end 


 function vector.__add(v, num) 
   local newv = {} 
   if (type(v)=="number") then
     local aux = v
     v = num
     num = aux
   end
   for i,e in ipairs(v) do 
        if (type(num)=="number") then 
          newv[i] = e + num 
        else 
          newv[i] = e + num[i] 
        end 
      end 
      return vector.new(newv) 
 end 
 
 function vector.__sub(v, num) 
   local newv = {} 
   if (type(v)=="number") then
     local aux = v
     v = num
     num = aux
   end
   for i,e in ipairs(v) do 
        if (type(num)=="number") then 
          newv[i] = e - num 
        else 
          newv[i] = e - num[i] 
        end 
    end 
    return vector.new(newv) 
 end 
 
 function vector.__mul(v, num) 
   local newv = {} 
   if (type(v)=="number") then
     local aux = v
     v = num
     num = aux
   end
   for i,e in ipairs(v) do 
      if (type(num)=="number") then 
        newv[i] = e * num 
      else
        newv[i] = e * num[i] 
      end 
    end 
    return vector.new(newv) 
 end 
  
 function vector.new(v) 
   local newv = {} 
   for i,e in ipairs(v) do 
        if (type(e)=="table") then 
          newv[i] = vector.new(e)
        else 
          newv[i] = e 
        end 
   end
   setmetatable(newv, vector) 
   return newv 
 end 
setmetatable(vector,{ __call = function(_,...) return vector.new(...) end }) 

-- ejecuciÃ³n 

 a = vector({1,3,5}) 
 a2 = vector({2,4,6})
 m = vector({a, a2})
 p = vector({2,3})
  print(a)
 print(m)
 pv = m * p
 
 print "#pv1"
 print(tostring(pv[1]))
 print "#pv2"
 print(tostring(pv[2]))
 print(pv)
 
 d = vector({11,12,13}) 
 t = {a, d}
 c = t[2]


b = (a + 4)*2 
print(b)
--b = b + 2*(c-a)
--  print(tostring(b) )
 
 
r = vector( { {11, 12, 13}, {14,15,16} } )

print((r)) 
print(r[1])
 print "fin" 
