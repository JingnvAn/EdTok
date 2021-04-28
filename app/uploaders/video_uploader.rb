class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video 
  include CarrierWave::Video::Thumbnailer

  process encode_video: [:mp4, resolution: "640x480"]

  version :thumb do
    process thumbnail: [{format: 'png', quality: 10, size: 400, strip: true, logger: Rails.logger}]
    def full_filename for_file
      png_name for_file, version_name
    end
  end

  def png_name for_file, version_name
    %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  end

  def full_name(for_file)
    super.chomp(File.extname(super)) + '.mp4'
  end
  
  def name
    original_filename.chomp(File.extname(original_filename)) + '.mp4'
  end

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
