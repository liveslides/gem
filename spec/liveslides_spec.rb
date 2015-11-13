require 'spec_helper'

describe LiveSlides do
  it 'has a version number' do
    expect(LiveSlides::VERSION).not_to be nil
  end
end

describe LiveSlides::Helper do
  let(:url) { "https://www.liveslides.com/" }
  let(:title) { "LiveSlides??" }
  let(:color_scheme) { "dark" }
  let(:slide_url) { "https://api.liveslides.com/v1/slide?url=https%3A%2F%2Fwww.liveslides.com%2F&title=LiveSlides%3F%3F" }
  let(:button_url) { "//api.liveslides.com/v1/button?color_scheme=dark" }

  include LiveSlides::Helper

  describe '#liveslides_slide_url' do
    subject { liveslides_slide_url("https://www.liveslides.com/", title: title) }
    it "generates URL" do
      expect(subject).to eql(slide_url)
    end
  end

  describe '#liveslides_button_url' do
    subject { liveslides_button_url(color_scheme: color_scheme) }
    it "generates URL" do
      expect(subject).to eql(button_url)
    end
  end

  describe '#liveslides_button' do
    subject { liveslides_button(url, title: title, color_scheme: color_scheme) }
    it "has <IMG src=:button_url>" do
      expect(subject).to include(%[<IMG src="#{CGI.escapeHTML(button_url)}"])
    end
    it "has <A href=:slide_url>" do
      expect(subject).to include(%[<A href="#{CGI.escapeHTML(slide_url)}"])
    end
  end
end
