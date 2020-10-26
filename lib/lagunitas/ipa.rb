# frozen_string_literal: true

require 'zip'
require 'fileutils'
require 'securerandom'

module Lagunitas
  # Representation of an IPA file
  class IPA
    def initialize(path)
      @path = path
      @contents = nil
    end

    def app
      @app ||= App.new(app_path)
    end

    def app_path
      @app_path ||= Dir.glob(File.join(contents, 'Payload', '*.app')).first
    end

    def cleanup
      return unless @contents

      FileUtils.rm_rf(@contents)
      @contents = nil
    end

    private

    def contents
      return if @contents

      @contents = "tmp/lagunitas-#{SecureRandom.hex}"

      Zip::File.open(@path) do |zip_file|
        zip_file.each do |f|
          f_path = File.join(@contents, f.name)
          FileUtils.mkdir_p(File.dirname(f_path))
          zip_file.extract(f, f_path) unless File.exist?(f_path)
        end
      end

      @contents
    end
  end
end
