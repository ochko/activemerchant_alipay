require 'active_merchant/billing/integrations/alipay/sign.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Alipay
        class Return < ActiveMerchant::Billing::Integrations::Return
          include Common

          def success?
            @params['is_success'] == 'T'
          end

          def message
            @message
          end

          def order
            @params["out_trade_no"]
          end

          def amount
            @params["total_fee"]
          end

          def notify_id
            @params["notify_id"]
          end

          def acknowledge
            unless signed?
              @message = "Alipay Error: ILLEGAL_SIGN"
              return false
            end

            true
          end

        end
      end
    end
  end
end
