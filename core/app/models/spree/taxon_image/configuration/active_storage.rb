module Spree
  class TaxonImage < Asset
    module Configuration
      module ActiveStorage
        extend ActiveSupport::Concern

        included do
          validate :check_attachment_content_type

          has_one_attached :attachment

          def self.styles
            @styles ||= {
              mini: '32x32>',
              normal: '128x128>'
            }
          end

          def default_style
            :mini
          end

          def accepted_image_types
            %w(image/jpeg image/jpg image/png image/gif)
          end

          def check_attachment_content_type
            true
          end
        end
      end
    end
  end
end
