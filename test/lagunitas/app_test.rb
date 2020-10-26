# frozen_string_literal: true

require 'test_helper'

module Lagunitas
  class AppTest < TestCase
    def setup
      @ipa = Lagunitas::IPA.new('test/data/Sample.ipa')
      @app = @ipa.app
    end

    def test_identifier
      assert_equal 'com.samsoffes.Sample', @app.identifier
    end

    def test_display_name
      assert_equal 'Sample', @app.display_name
    end

    def test_version
      assert_equal '13', @app.version
    end

    def test_short_version
      assert_equal '2.2', @app.short_version
    end

    def test_icons
      assert_includes @app.icon(120), 'AppIcon60x60@2x.png'
      assert_nil @app.icon(1024)
    end

    def teardown
      @ipa&.cleanup
    end
  end
end
