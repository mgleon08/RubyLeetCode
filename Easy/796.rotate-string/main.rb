# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
  a.size == b.size && (a + a).include?(b)
end

string1 = "abcde"
string2 = "cdeab"
puts rotate_string(string1, string2)

string2 = "abced"
puts rotate_string(string1, string2)

string1 = "aa"
string2 = "a"
puts rotate_string(string1, string2)
