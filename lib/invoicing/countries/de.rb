module Invoicing
  module Countries
    module DE
      # just a copy of UK::VAT
      class VAT
        def tax_rate(params)
          params[:model_object].send(:tax_rate)
        end
        
        def tax_factor(params)
          BigDecimal('1') + tax_rate(params).rate
        end
        
        def tax_percent(params)
          BigDecimal('100') * tax_rate(params).rate
        end
        
        def apply_tax(params)
          params[:value] * tax_factor(params)
        end
        
        def remove_tax(params)
          params[:value] / tax_factor(params)
        end
        
        def tax_info(params)
          "(incl. MwSt)"
        end
        
        def tax_details(params)
          "(incl. #{tax_percent(params).to_s}% MwST)"
        end
      end
    end
  end
end
