# To Check if odd 1 count is there then return 1 and if it is even count return 0
puts "COunt of 1 is odd then return 1 else return 0: #{'1011'.to_i(2)%2}"
#Swap MSB and LSB
bits = "01001001"
puts "Original bit is #{bits}"
bits = bits.split('').map(&:to_i)
if bits[0] != bits[-1]
  bits[0] = 1 - bits [0]
  bits[1] = 1 - bits [1]
end
puts "New bits are #{bits.join('')}"

# Reverse Bits
puts "Reverse Bit Program"
bits = "01001001"
puts "Original bit is #{bits}"
bits = bits.split('').map(&:to_i)
new_bits = bits.collect do |bit|
  1 - bit
end
puts "Reverse bit is  #{new_bits.join('')}"

#Find nearest no whoes weight match eg: 92 => 1011100 has weight 4 find nearest no having same wgiht

no = 123
binary_no = 123.to_s(2).split('').map(&:to_i)
# From left side check two consecutive different no and swap the bits
(binary_no.length-1).downto(0) do |index|
  if binary_no[index] != binary_no[index-1]
    binary_no[index], binary_no[index-1] = binary_no[index-1], binary_no[index]
    break
  end
end
puts "Nearest No is #{binary_no.join('').to_i(2)}"

#Addition of no using binary no
no1 = 6
no2 = 4

binary_no1 = no1.to_s(2)
binary_no2 = no2.to_s(2)

while binary_no2 != 0 do
  (binary_no1 + binary_no2).to_i(2)
end

# Find permutation
"5430".split("").permutation.to_a.map!(&:join).uniq


# Find combinations
[5,4,3,2,1].combination(5)