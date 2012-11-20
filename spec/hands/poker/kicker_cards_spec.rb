require 'spec_helper'

module TheGambler
  describe Hand do
    describe '#poker_value' do
      context 'with kicker cards' do
        
        context 'four of a kind' do
          def four_of_a_kind(primary, kicker)
            Hand.new "#{primary}S", "#{primary}C", "#{primary}H", "#{primary}D", "#{kicker}D"
          end
          
          it 'should value four aces and a jack higher than four aces and a 3' do
            four_of_a_kind('A', 'J').poker_value.should > four_of_a_kind('A', '3').poker_value
          end
          
          it 'should value four 2s and an ace higher than four 2s and a 10' do
            four_of_a_kind('2', 'A').poker_value.should > four_of_a_kind('2', '10').poker_value
          end
        end
        
        context 'three of a kind' do
          def three_of_a_kind(primary, kicker1, kicker2)
            Hand.new "#{primary}S", "#{primary}C", "#{primary}H", "#{kicker1}D", "#{kicker2}D"
          end
          
          it 'should value three aces, a jack, and a 2 higher than three aces, a 10, and a 2' do
            three_of_a_kind('A', 'J', '2').poker_value.should > three_of_a_kind('A', '10', '2').poker_value
          end
          
          it 'should value three kings, a jack, and a 10 higher than three kings, a jack, and a 2' do
            three_of_a_kind('K', 'J', '10').poker_value.should > three_of_a_kind('K', 'J', '2').poker_value
          end
        end
        
        context 'two pair' do
          def two_pair(primary, secondary, kicker)
            Hand.new "#{primary}S", "#{primary}C", "#{secondary}H", "#{secondary}D", "#{kicker}D"
          end
          
          it 'should value two pairs with an ace kicker higher than two pairs with a 10 kicker' do
            two_pair('J', '2', 'A').poker_value.should > two_pair('J', '2', '10').poker_value
          end
          
          it 'should value two pairs with a 10 kicker higher than two pairs with an 8 kicker' do
            two_pair('J', '2', '10').poker_value.should > two_pair('J', '2', '8').poker_value
          end
          
        end

        context 'one pair' do
          def one_pair(pair, a, b, c)
            Hand.new "#{pair}H", "#{pair}C", "#{a}D", "#{b}D", "#{c}D"
          end

          it 'should value a pair with J, 7, 2 higher than a pair with 10, 7, 2'  do
            one_pair('A', 'J', '7', '2').poker_value.should > one_pair('A', '10', '7', '2').poker_value
          end

          it 'should value a pair with J, 7, 5 higher than a pair with J, 6, 5' do
            one_pair('A', 'J', '7', '5').poker_value.should > one_pair('A', 'J', '6', '5').poker_value
          end

          it 'should value a pair with J, 7, 5 higher than a pair with J, 7, 2' do
            one_pair('A', 'J', '7', '5').poker_value.should > one_pair('A', 'J', '7', '2').poker_value
          end
        end

        context 'high card' do
          it 'should value high card hand AQJ72 higher than ATJ72'  do
            Hand.new(*%w{AD QC JS 7H 2D}).poker_value.should > Hand.new(*%w{AD 10C JS 7H 2D}).poker_value
          end

          it 'should value high card hand AQJ72 higher than AQT72'  do
            Hand.new(*%w{AD QC JS 7H 2D}).poker_value.should > Hand.new(*%w{AD QC 10S 7H 2D}).poker_value
          end

          it 'should value high card hand AQJ72 higher than AQJ62'  do
            Hand.new(*%w{AD QC JS 7H 2D}).poker_value.should > Hand.new(*%w{AD QC JS 6H 2D}).poker_value
          end

          it 'should value high card hand AQJ76 higher than AQJ72'  do
            Hand.new(*%w{AD QC JS 7H 6D}).poker_value.should > Hand.new(*%w{AD QC JS 7H 2D}).poker_value
          end
        end
        
      end
    end
  end
end
