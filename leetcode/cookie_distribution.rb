def distribute_cookies(cookies, k)
  # Sort the cookies from lowest to highest, nlogn
  cookies.sort!

  left        = 0
  right       = cookies.length - 1
  kid_counter = 0

  cookie_sums = Array.new(k, 0)

  # Linearly traverse the list of cookies and assign to kids
  while left <= right

    kid_index = kid_counter % k

    cookie_sums[kid_index] += cookies[left]
    cookie_sums[kid_index] += cookies[right]

    left        += 1
    right       -= 1
    kid_counter += 1
  end

  cookie_sums.max
end

cookies = [8, 15, 10, 20, 8]
k       = 2

distribute_cookies(cookies, k)
