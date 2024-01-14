require 'jekyll-google_cse/version'
require 'jekyll'

module Jekyll
  class GoogleCse < Liquid::Tag # :nodoc:
    InvalidGoogleCseConfig = Class.new(Jekyll::Errors::FatalException)

    TEMPLATE = <<-TEMPLATE.freeze
<script>
  (function() {
    var cx = '%s';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>
    TEMPLATE

    def render(context)
      google_cse_config = fetch_google_cse_config(context)
      format(TEMPLATE, google_cse_config)
    end

    def fetch_google_cse_config(context)
      cse_config = context.registers[:site].config['google_cse_id']
      case cse_config
      when String
        return cse_config
      end
      raise InvalidGoogleCseConfig,
            'Invalid jekyll-google_cse configuration. See ' \
            'https://github.com/brint/jekyll-google_cse#usage for more ' \
            'details on usage and configuration.'
    end
  end
end

Liquid::Template.register_tag('google_cse', Jekyll::GoogleCse)
