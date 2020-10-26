# frozen_string_literal: true

require 'test_helper'

module Lagunitas
  class IPATest < TestCase
    def setup
      @ipa = Lagunitas::IPA.new('test/data/Sample.ipa')
    end

    def test_app_path
      assert_includes @ipa.app_path, 'Sample.app'
    end

    def teardown
      @ipa&.cleanup
    end
  end
end
