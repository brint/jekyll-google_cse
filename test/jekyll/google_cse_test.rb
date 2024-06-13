# frozen_string_literal: true

require 'test_helper'

class Jekyll::GoogleCseTest < Minitest::Test
  def site_config
    site = Jekyll::Site.new(Jekyll.configuration)
    site.config['google_cse_id'] = 'abcdef1234'
    return site
  end

  def bad_site_config
    site = Jekyll::Site.new(Jekyll.configuration)
    site.config['google_cse_id'] = {
      'random' => 'value'
    }
    return site
  end

  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::GoogleCse::VERSION
  end

  def test_bad_google_cse_configuration
    bad_site = bad_site_config
    bad_tmpl = Liquid::Template.parse('{% google_cse %}')
    bad_tmpl.registers[:site] = bad_site
    error_string = 'Liquid error: Invalid jekyll-google_cse configuration. ' \
                   'See https://github.com/brint/jekyll-google_cse#usage for more details ' \
                   'on usage and configuration.'
    assert_equal error_string, bad_tmpl.render
  end

  # rubocop:disable Metrics/MethodLength
  def test_generating_google_cse_code
    site = site_config
    tmpl = Liquid::Template.parse('{% google_cse %}')
    tmpl.registers[:site] = site
    expected = <<-TEMPLATE
<script>
  (function() {
    var cx = 'abcdef1234';
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
    assert_equal expected, tmpl.render
  end
  # rubocop:enable Metrics/MethodLength
end
