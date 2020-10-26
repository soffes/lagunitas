# frozen_string_literal: true

require 'cfpropertylist'
require 'pngdefry'

module Lagunitas
  # Representation of an app inside an IPA
  class App
    def initialize(path)
      @path = path
    end

    def info
      @info ||= CFPropertyList.native_types(CFPropertyList::List.new(file: File.join(@path, 'Info.plist')).value)
    end

    def identifier
      info['CFBundleIdentifier']
    end

    def bundle_name
      info['CFBundleName']
    end

    def display_name
      info['CFBundleDisplayName']
    end

    def version
      info['CFBundleVersion']
    end

    def short_version
      info['CFBundleShortVersionString']
    end

    def icon(size)
      icons.each do |icon|
        return icon[:path] if icon[:width] >= size
      end
      nil
    end

    def icons
      @icons ||= begin
        icons = []
        info['CFBundleIcons']['CFBundlePrimaryIcon']['CFBundleIconFiles'].each do |name|
          icons << get_image(name)
          icons << get_image("#{name}@2x")
        end
        icons.delete_if(&:!)
      rescue NoMethodError # fix a ipa without icons
        []
      end
    end

    private

    def get_image(name)
      path = File.join(@path, "#{name}.png")
      return nil unless File.exist?(path)

      dimensions = Pngdefry.dimensions(path)
      {
        path: path,
        width: dimensions.first,
        height: dimensions.last
      }
    rescue Errno::ENOENT
      nil
    end
  end
end
