require 'digest/md5'
require 'cgi'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Alipay
        module Common
          def signed?
            method = @params.delete("sign_type")
            sign = @params.delete("sign")

            if 'MD5' == method && sign.present?
              sign.downcase == signature(@params)
            else
              false
            end
          end

          def signature(params)
            query = params.sort.collect do |s|
              "#{s[0]}=#{s[0] == "notify_id" ? s[1] : CGI.unescape(s[1])}"
            end
            Digest::MD5.hexdigest(query.join("&") + KEY)
          end
        end
      end
    end
  end
end
