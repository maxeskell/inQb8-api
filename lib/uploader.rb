class Uploader

  def self.split_base64(string)
    if string.present? && string.match(%r{^data:(.*?);(.*?),(.*)$})
      return { type: $1, encoding: $2, data: $3, extension: $1.split('/')[1] }
    else
      return nil
    end
  end

end
