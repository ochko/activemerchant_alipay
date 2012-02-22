module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Alipay
        autoload :Common, File.dirname(__FILE__) + '/alipay/common'
        autoload :Helper, File.dirname(__FILE__) + '/alipay/helper'
        autoload :Return, File.dirname(__FILE__) + '/alipay/return'
        autoload :Notification, File.dirname(__FILE__) + '/alipay/notification'

        # Set this if you want to change the Alipay test url
        mattr_accessor :test_url        

        # Overwrite this if you want to change the Alipay production url
        mattr_accessor :production_url
        self.production_url = 'https://www.alipay.com/cooperate/gateway.do'

        def self.service_url
          mode = ActiveMerchant::Billing::Base.integration_mode
          case mode
          when :production
            self.production_url
          when :test
            self.test_url || self.production_url
          else
            raise StandardError, "Integration mode set to an invalid value: #{mode}"
          end
        end

        def self.notification(post, options = {})
          Notification.new(post)
        end

        def self.return(query_string, options = {})
          Return.new(query_string)
        end
      end
    end
  end
end
