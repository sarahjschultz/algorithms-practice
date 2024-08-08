class ComputeLogfileStats

  SPLIT_ROUTES = {
    GET:  ["/api/users/{user_id}/count_pending_messages",
           "/api/users/{user_id}/get_messages",
           "/api/users/{user_id}/get_friends_progress",
           "/api/users/{user_id}/get_friends_score",
           "/api/users/{user_id}"],
    POST: ["/api/users/{user_id}"]
  }.freeze

  ROUTES_REGEX = [
    %r{/api/users/\d+$},
    %r{/api/users/\d+/get_messages$},
    %r{/api/users/\d+/count_pending_messages$},
    %r{/api/users/\d+/get_friends_progress$},
    %r{/api/users/\d+/get_friends_score$},
  ].freeze

  def initialize
    @file = read_file
  end

  def read_file
    File.readlines("./logfile.txt").map(&:chomp)
  end

  def parse_file
    counts = Hash.new { |h, k| h[k] = {} }

    @file.each do |log_line|
      method       = log_line.match(/(method=)([A-Z]*)/)[2]
      path         = log_line.match(/(path=)(\S*)/)[2]
      connect_time = log_line.match(/(connect=)(\d*)/)[2]
      service_time = log_line.match(/(service=)(\d*)/)[2]

      # Ignore methods outside of our scope
      next unless SPLIT_ROUTES[method.to_sym]

      # Ignore paths outside of our scope
      next unless ROUTES_REGEX.any? { |regex| regex =~ path }

      # TODO: Is it possible to get a false positive, here?
      matching_reg  = ROUTES_REGEX.select { |regex| regex =~ path }
      matched_route = SPLIT_ROUTES[method.to_sym].grep(matching_reg[0])

      if counts[method][matched_route].nil?
        counts[method][matched_route] = { count: 1, service_times: [service_time.to_i], connect_times: [connect_time.to_i] }
      else
        counts[method][matched_route][:count] += 1
        counts[method][matched_route][:service_times] << service_time.to_i
        counts[method][matched_route][:connect_times] << connect_time.to_i
      end
    end

    counts
  end

  def analyze_file
    file_stats = []

    file_counts = parse_file

    # Naive quadratic approach
    file_counts.each_key do |method_type|

      file_counts[method_type].each do |request_path|
        pp request_path = request_path.flatten
        file_stats << {
          "request_identifier": "#{method_type.to_s} #{request_path}",
          "called":             request_path[:count].to_i,
          "response_time_mean": compute_response_mean(request_path)
          # TODO: Compute median (middle)
          # "response_time_median": compute_response_median(request_path)
        }
      end
    end
    file_stats
  end

  def compute_response_mean(request_count_obj)
    connection_times_total = request_count_obj[:connect_times].reduce(&:+)
    service_times_total    = request_count_obj[:service_times].reduce(&:+)

    (connection_times_total + service_times_total) / (request_count_obj[:connect_times] + request_count_obj[:service_times])
  end
end

stats = ComputeLogfileStats.new
puts stats.analyze_file
