require "liveslides/version"
require "uri"
require "cgi/html"

module LiveSlides
  class API
    URL = "https://api.liveslides.com/"

    def initialize(url = URL)
      @url = url
    end

    def url(path = "/", **params)
      URI(@url).tap do |url|
        url.path = path
        url.query = URI.encode_www_form(params)
      end
    end
  end

  def self.api
    @api ||= API.new
  end

  module Helper
    def liveslides_slide_url(url, title: nil)
      LiveSlides.api.url("/v1/slide", url: url, title: title).to_s
    end

    def liveslides_button_url(color_scheme: "light", protocol: nil)
      LiveSlides.api.url("/v1/button", color_scheme: color_scheme).tap do |uri|
        uri.scheme = protocol
      end.to_s
    end

    def liveslides_button(url, title: nil, color_scheme: "light", width: nil, height: nil)
      alt = title || "Download LiveSlide"
      html5 = CGI::HTML5.new
      html = html5.a(href: liveslides_slide_url(url, title: title)) do
        html5.img(src: liveslides_button_url(color_scheme: color_scheme), alt: alt, width: width, height: height)
      end
      html.respond_to?(:html_safe) ? html.html_safe : html
    end
  end
end

require 'liveslides/railtie.rb' if defined?(Rails)
