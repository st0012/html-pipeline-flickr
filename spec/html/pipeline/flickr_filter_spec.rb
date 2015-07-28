require 'spec_helper'

describe HTML::Pipeline::FlickrFilter do
  subject { HTML::Pipeline::FlickrFilter }
  let(:flickr_url) { "https://www.flickr.com/photos/99434203@N05/9379906996" }

  it 'has a version number' do
    expect(HTML::Pipeline::Flickr::VERSION).not_to be nil
  end

  context "Default context" do
    it "generates with default options" do
      expect(subject.to_html(flickr_url)).to eq(
        %(<a href="https://www.flickr.com/photos/99434203@N05/9379906996" ><img src="https://farm4.staticflickr.com/3787/9379906996_3ccabd5aae_b.jpg" alt="Ebony&Alex-011-IMGP4840" title="Ebony&Alex-011-IMGP4840" /></a>)
      )
    end
  end
  context "Multiple source" do
    it "generates two content" do
      expect(subject.to_html(flickr_url + " test " + flickr_url)).to eq(
        %(<a href="https://www.flickr.com/photos/99434203@N05/9379906996" ><img src="https://farm4.staticflickr.com/3787/9379906996_3ccabd5aae_b.jpg" alt="Ebony&Alex-011-IMGP4840" title="Ebony&Alex-011-IMGP4840" /></a> test <a href="https://www.flickr.com/photos/99434203@N05/9379906996" ><img src="https://farm4.staticflickr.com/3787/9379906996_3ccabd5aae_b.jpg" alt="Ebony&Alex-011-IMGP4840" title="Ebony&Alex-011-IMGP4840" /></a>)
      )
    end
  end

  context "With maxwidth & maxheight options" do
    it "gets different size of image" do
      result = subject.to_html(
        flickr_url,
        flickr_maxwidth: 100,
        flickr_maxheight: 200
      )

      expect(result).to eq(
        %(<a href="https://www.flickr.com/photos/99434203@N05/9379906996" ><img src="https://farm4.staticflickr.com/3787/9379906996_3ccabd5aae_t.jpg" alt="Ebony&Alex-011-IMGP4840" title="Ebony&Alex-011-IMGP4840" /></a>)
      )
    end
  end

  context "With link_attr option" do
    it "generates link with attributes" do
      result = subject.to_html(flickr_url, flickr_link_attr: "target='_blank'")

      expect(result).to eq(
        %(<a href="https://www.flickr.com/photos/99434203@N05/9379906996" target='_blank'><img src="https://farm4.staticflickr.com/3787/9379906996_3ccabd5aae_b.jpg" alt="Ebony&Alex-011-IMGP4840" title="Ebony&Alex-011-IMGP4840" /></a>)
      )
    end
  end
end
