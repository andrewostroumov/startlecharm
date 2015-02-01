class Hash
  def deep_join_keys(separator = '_')
    joined_hash = {}
    each do |key, value|
      unless value.is_a? Hash
        joined_hash.merge! key => value
        next
      end

      value.map do |nested_key, nested_value|
        deep_hash = ({ nested_key => nested_value }).deep_join_keys(separator)
        deep_hash.each do |joined_key, joined_value|
          joined_hash.merge! "#{key}#{separator}#{joined_key}" => joined_value
        end
      end
    end
    joined_hash
  end

  def deep_join_keys!(separator = '_')
    backup_self = dup
    clear
    self.merge! backup_self.deep_join_keys separator
  end
end
