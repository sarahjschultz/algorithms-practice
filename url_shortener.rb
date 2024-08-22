# Two ways to shorten the URL:
#
# 1. Use a hash function like MD5 hash to hash the string -- take consistent length
# Tradeoffs: Possible to have collisions and so would need check logic
#
# 2. Write a mapper by hand which will base-62 encode the primary key of the string
# Tradeoffs: Mapped string will be of varying lengths, but will have no collisions

def shorten_url_md5(long_url)
  Digest::MD5.hexdigest(long_url).take(7)
end

def shorten_url_manual_encode(url_id)

  # URL safe chars including -, _
  # 26 + 26 + 10 + 2 = 64
  map = [
    "a".."z",
    "A".."Z",
    0..9,
    "-", "_"
  ]

  q      = r = url_id
  result = ""

  while r.positive?
    q, r = q.divmod(64)

    result << map[r - 1]
  end
  result
end
