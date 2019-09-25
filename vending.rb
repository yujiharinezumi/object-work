class  VendingMachine



  def initialize

    #投入金額
    @slot_money = 0

    # @left_money = 0

    #お釣りの金額
    @change_money = 0

    #自動販売機の売り上げ金額
    @total_money = 0

    #飲み物の金額、個数を配列の中に入れる
    @drink = {cola: { price: 120,quantity: 5}, redbull: {price:200,quantity:5}, water:{price:100,quantity:5}}

  end

    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    #freeze メソッドでMoney以外の金額を入れさせない
    MONEY = [10, 50, 100, 500, 1000].freeze

    #自動販売機にお金が入れられるかどうか include?メソッドで確認する
    def check_money(money)
       MONEY.include?(money)
    end


    #自動販売機にお金を入れれて、かつ、お金の金額を追加できるようにするメソッド
  def slot_money(money)
    if check_money(money)
      @slot_money += money
    end
  end

      #投入したお金を使って飲み物を買う
  def purchase(name)
    #お金や在庫がなければプログラムを進めなくする
    #buy_drinksで購入できる場合の条件分岐をしている
     return if not  buy_drinks(name)

     #お釣りの計算
     @slot_money -= @drink[name][:price]
     #自動販売機の売り上げの計算
     @total_money += @drink[name][:price]
     #購入時に飲み物の在庫を１個づつ減らす計算
     @drink[name][:quantity] -= 1
     # ------>>>  irbではお釣り、売り上げは計算されるが、表示されるのは在庫の数だけ
  end


  def count_money(name)
    if purchase(name)
        # お釣りを表示させる
      @slot_money
    end
  end


  # ----->> 取りあず無視
  # def result_money
  #   @change_money -= @drink[name][:price]
  # end

  # 所持金で飲み物が購入できるか
  def judge_money(name)
    @slot_money > @drink[name][:price]
  end
  # 在庫数が１個以上あるか
  def stock_drinks(name)
      @drink[name][:quantity] >= 1
  end
  # judge_moneyとstock_drinksがtrueか
  def buy_drinks(name)
    judge_money(name) && stock_drinks(name)
  end


end

  # 飲み物を別のクラスで定義してあげて、金額や個数が変わった時に対応できるようにする。（金曜に）
#
# Class drink
#   def self.cola
#
#   end
#
#   def self.redbull
#
#   end
#
#   def self.water
#
#
#   end
#
#
# end
