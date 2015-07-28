require 'spec_helper'

describe HTML::Pipeline::FlickrFilter do
  subject { HTML::Pipeline::FlickrFilter }
  let(:flickr_url) { "https://www.flickr.com/photos/99434203@N05/9379906996" }

  it 'has a version number' do
    expect(HTML::Pipeline::Flickr::VERSION).not_to be nil
  end

  context "With no options" do
    it "generates iframe with default setting" do
      expect(subject.to_html(flickr_url)).to eq(
        %(<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/Kg4aWWIsszw" frameborder="0" allowfullscreen></iframe></div>)
      )
    end
  end

  context "With options" do
    it "generated iframe with custom option" do
      result = subject.to_html(
        flickr_url,
        video_width: 500,
        video_height: 100,
        video_frameborder: 5,
        video_autoplay: true,
        video_hide_related: true
      )

      expect(result).to eq(
        %(<div class="video youtube"><iframe width="500" height="100" src="//www.youtube.com/embed/Kg4aWWIsszw?autoplay=1&rel=0" frameborder="5" allowfullscreen></iframe></div>)
      )
    end
  end
end
