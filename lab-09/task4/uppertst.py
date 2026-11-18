from ctypes import *

libupper = CDLL("../task3/libup.so")

libupper.mytoupper.argtypes = [c_char_p, c_char_p]
libupper.mytoupper.restype = c_int

inStr = create_string_buffer(b"dokukin_dmitrii_alekseevich_ikbo_42_25_variant_10")
outStr = create_string_buffer(250)

length = libupper.mytoupper(inStr, outStr)

print(inStr.value.decode())
print(outStr.value.decode())
print(length)
