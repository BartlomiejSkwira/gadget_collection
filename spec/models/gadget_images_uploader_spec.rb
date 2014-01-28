require_relative '../spec_helper'

describe GadgetImagesUploader do
  include CarrierWave::Test::Matchers

  before do
    GadgetImagesUploader.enable_processing = true
    @image = create(:image)
    path_to_file = "#{Rails.root}/spec/features/fixtures/test.jpeg"
    @image.file = File.open(path_to_file)
  end

  after do
    GadgetImagesUploader.enable_processing = false
    @image.file.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      @image.file.thumb.should have_dimensions(64, 64)
    end
  end

  context 'the small version' do
    it "should scale down a landscape image to fit within 200 by 200 pixels" do
      @image.file.small.should be_no_larger_than(200, 200)
    end
  end

  context 'the middle version' do
    it "should scale down a landscape image to fit within 400 by 400 pixels" do
      @image.file.middle.should be_no_larger_than(400, 400)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @image.file.should have_permissions(0600)
  end
end
