require "./JsonSerializer/*"

module JsonSerializer
  def jsonify_array(obj)
    result = "["
    i = 0
    last = obj.size - 1
    obj.each do | element |
      result += "#{jsonify_single(element)}"
      if i < last
        result += ","
      end
      i += 1
    end
    return result + "]"
  end

  def jsonify_single(obj)
    if obj.is_a? String || obj.is_a? Char
      return "\"#{obj}\""
    elsif obj.is_a? Symbol
      return "\"#{obj.to_s}\""
    elsif obj.is_a? Nil
      return "null"
    elsif obj.is_a? Bool || obj.is_a? Int8 || obj.is_a? Int16 || obj.is_a? Int32 || obj.is_a? Int64 || obj.is_a? UInt8 || obj.is_a? UInt16 || obj.is_a? UInt32 || obj.is_a? UInt64
      return obj
    elsif obj.is_a? Hash
      result = "{"
      i = 0
      last = obj.size - 1
      obj.each do | key, value |
        result += "\"#{key}\":#{jsonify_single(value)}"
        if i < last
          result += ","
        end
        i += 1
      end
      return result + "}"
    elsif obj.is_a? Array
      jsonify_array(obj)
    elsif obj.is_a? Range
      jsonify_array(obj)
    elsif obj.is_a? Tuple
      jsonify_array(obj)
    end
  end

  def jsonify(obj)
    jsonify_single(obj)
  end
end
