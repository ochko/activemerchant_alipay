module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Alipay
        autoload :Common, File.dirname(__FILE__) + '/alipay/common'
        autoload :Helper, File.dirname(__FILE__) + '/alipay/helper'
        autoload :Return, File.dirname(__FILE__) + '/alipay/return'
        autoload :Notification, File.dirname(__FILE__) + '/alipay/notification'

        mattr_accessor :service_url
        self.service_url = 'https://www.alipay.com/cooperate/gateway.do'

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
