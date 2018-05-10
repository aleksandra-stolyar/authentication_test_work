class LogoUploader < ImagesUploader
  version :thumb do
    process resize_to_fill: [50, 50]
  end
end
