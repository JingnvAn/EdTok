class VideoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include CarrierWave::Video 
  include CarrierWave::Video::Thumbnailer

  process encode_video: [:mp4, resolution: "640x480"]
  
  # version :rescaled do
  #   process encode_video: [
  #     :mp4,
  #     resolution: "640x480", # Aspect ratio is preserved automatically
  #     # Audio codec and custom are to fix: http://stackoverflow.com/questions/19800298/ffmpeg-carrierwave-video-always-returns-unknown-encoder-libfaac
  #     audio_codec: "aac",
  #     custom: "-strict experimental -q:v 5 -preset slow -g 30",
  #     callbacks: { after_transcode: :set_success }
  #   ]
  # end

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
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_allowlist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
