require "jekyll/languages/version"

module Jekyll
  module Languages
    
    def sentencize_array(array)
      connector = strings[:connector]
      
      case array.length
      when 0
        ""
      when 1
        array[0].to_s
      when 2
        "#{array[0]} #{connector} #{array[1]}"
      else
        "#{array[0...-1].join(', ')} #{connector} #{array[-1]}"
      end
    end
    
    private
    
    def config
      @config ||= Jekyll.configuration({}).fetch('jekyll_languages', {})
    end
    
    def strings
      {
        :connector => config['array_connector'] || 'and'
      }
    end
    
  end
end

Liquid::Template.register_filter(Jekyll::Languages) if defined?(Liquid)