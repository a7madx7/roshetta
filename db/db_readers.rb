def read(file)
  File.readlines(file).each do |d|
    decoded_json_line = ActiveSupport::JSON.decode(d)
    begin
      yield(decoded_json_line) if block_given?
    rescue
      next
    end
  end
end