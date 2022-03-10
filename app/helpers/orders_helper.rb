module OrdersHelper
    def currency_view(amount_in_cents)
            number_to_currency(amount_in_cents / 100)
    end
end
