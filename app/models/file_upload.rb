class FileUpload < ActiveRecord::Base
	belongs_to :uploader, polymorphic: true

  validates :uploader_id, :uploader_type, presence: true

  private

    def set_hash_id
      seed = "--#{rand(10000)}--#{Time.now}--"
      self.hash_id = Digest::SHA256.hexdigest(seed)
    end

    def set_extension
      ext = File.extname(raw.current_path).to_s

      if ext[-1, 1] == '_'
        self.ext = ext[0..-2]
      else
        self.ext = ext
      end
    end

    def set_name
      set_extension
      name = File.basename(raw.current_path, File.extname(raw.current_path))
      self.name = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end  
end
