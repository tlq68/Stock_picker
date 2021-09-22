puts "Check out the stocks!"
stocks = []
10.times  { random = rand(30) + 1; stocks.push(random)}
 p stocks

puts "Here is the optimal time to buy and sell!"

def stock_picker(stock_list) 
    check_arr = []
    new_arr = []

    stock_list.each do |x|
        check_arr = stock_list.slice(stock_list.find_index(x)..-1)
        max_stock_position = stock_list.find_index(check_arr.max)
        current_stock_position = stock_list.find_index(x)
        if current_stock_position < max_stock_position
            new_arr.push([current_stock_position, max_stock_position])
        end
    end
    new_arr
end
test_arr = stock_picker(stocks)

mapped_array = test_arr.map do |x, y|
    [stocks[x], stocks[y]]
end
def find_best_pair(array_of_stock_pairs) 
   final_result = array_of_stock_pairs.reduce([0,0]) do |acc, stock| 
        (acc.last - acc.first) > (stock.last - stock.first) ? [acc.first, acc.last] : stock
    end
    final_result
end
final_result = find_best_pair(mapped_array)

low_stock_price = find_best_pair(mapped_array).first
high_stock_price = find_best_pair(mapped_array).last
low_stock_day = stocks.find_index(final_result.first)
high_stock_day = stocks.find_index(final_result.last)

if low_stock_day != nil && high_stock_day != nil
    p [low_stock_day, high_stock_day ]

    puts "If you buy on day #{low_stock_day} at a price of $#{low_stock_price} and sell on day #{high_stock_day} at a price of $#{high_stock_price}, you will have a profit of $#{high_stock_price - low_stock_price}! "
    
else
    puts "Never!"
    puts "You shouldn't buy any stocks..."
    
end
